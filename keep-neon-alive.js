require('dotenv').config();
const { Pool } = require('pg');

// Create a connection pool with minimal settings
const pool = new Pool({
  connectionString: process.env.DATABASE_URI,
  ssl: {
    rejectUnauthorized: false
  },
  max: 1,
  idleTimeoutMillis: 30000
});

// Handle pool errors
pool.on('error', err => {
  console.error('Unexpected pool error:', err.message);
  // Restart the process if needed
  if (process.env.NODE_ENV === 'production') {
    setTimeout(() => {
      console.log('Restarting after pool error...');
      process.exit(1); // Exit with error code to allow process manager to restart
    }, 5000);
  }
});

// Simple query to keep the connection alive
async function keepAlive() {
  let client;
  const startTime = Date.now();
  
  try {
    client = await pool.connect();
    console.log(`[${new Date().toISOString()}] Connected to database.`);
    
    // Run a simple query
    const result = await client.query('SELECT NOW() AS time');
    const serverTime = result.rows[0].time;
    const elapsedMs = Date.now() - startTime;
    
    console.log(`[${new Date().toISOString()}] Database time: ${serverTime.toISOString()} (query took ${elapsedMs}ms)`);
    return true;
  } catch (err) {
    console.error(`[${new Date().toISOString()}] Failed to connect: ${err.message}`);
    return false;
  } finally {
    if (client) client.release();
  }
}

// Determine if we should ping based on business hours (e.g., 8 AM to 6 PM, Monday to Friday)
function shouldPing() {
  const now = new Date();
  const hours = now.getHours();
  const day = now.getDay(); // 0 = Sunday, 1 = Monday, etc.
  
  // Default to active during business hours (8 AM to 6 PM, Monday to Friday)
  const businessHoursStart = parseInt(process.env.BUSINESS_HOURS_START || '8', 10);
  const businessHoursEnd = parseInt(process.env.BUSINESS_HOURS_END || '18', 10);
  const businessDays = (process.env.BUSINESS_DAYS || '1,2,3,4,5').split(',').map(d => parseInt(d, 10));
  
  const isBusinessHours = hours >= businessHoursStart && hours < businessHoursEnd;
  const isBusinessDay = businessDays.includes(day);
  
  return isBusinessDay && isBusinessHours;
}

// Main function to run periodically
async function main() {
  try {
    if (shouldPing()) {
      console.log(`[${new Date().toISOString()}] Business hours active, keeping database warm.`);
      await keepAlive();
    } else {
      console.log(`[${new Date().toISOString()}] Outside business hours, allowing database to scale to zero.`);
    }
  } catch (err) {
    console.error(`[${new Date().toISOString()}] Error in main function:`, err);
  }
}

// The ping interval (4 minutes is good to keep within Neon's 5-minute scale-to-zero window)
const PING_INTERVAL_MS = parseInt(process.env.PING_INTERVAL_MS || '240000', 10);

// Run immediately on start
main();

// Then schedule to run at the specified interval
const timer = setInterval(main, PING_INTERVAL_MS);

// Handle graceful shutdown
process.on('SIGINT', async () => {
  console.log('Shutting down keep-alive service...');
  clearInterval(timer);
  await pool.end();
  process.exit(0);
});

console.log(`Keep-alive service started. Pinging every ${PING_INTERVAL_MS / 1000} seconds during business hours.`);
console.log(`Business hours: ${process.env.BUSINESS_HOURS_START || '8'}:00 to ${process.env.BUSINESS_HOURS_END || '18'}:00 on days ${process.env.BUSINESS_DAYS || '1,2,3,4,5'}`);
console.log('Press Ctrl+C to exit.'); 