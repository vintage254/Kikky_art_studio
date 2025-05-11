require('dotenv').config();
const { Pool } = require('pg');

// Create a connection pool for monitoring connections
const pool = new Pool({
  connectionString: process.env.DATABASE_URI,
  ssl: {
    rejectUnauthorized: false // Required for Neon connections
  },
  max: 1, // Only need one connection for monitoring
});

// Monitor interval in seconds
const MONITOR_INTERVAL = 5;
let isRunning = true;

// Handle pool-level errors
pool.on('error', (err) => {
  console.error('Pool error:', err.message);
});

async function getConnections() {
  const client = await pool.connect();
  try {
    // Query to get active connections
    const result = await client.query(`
      SELECT 
        pid, 
        usename AS username, 
        application_name,
        client_addr AS client_ip,
        backend_start,
        state,
        EXTRACT(EPOCH FROM (now() - state_change)) AS state_duration_seconds,
        EXTRACT(EPOCH FROM (now() - query_start)) AS query_duration_seconds,
        EXTRACT(EPOCH FROM (now() - backend_start)) AS connection_duration_seconds,
        CASE WHEN state = 'idle in transaction' 
             THEN EXTRACT(EPOCH FROM (now() - state_change)) 
             ELSE NULL 
        END AS idle_in_transaction_seconds,
        LEFT(query, 100) AS query_preview
      FROM pg_stat_activity
      WHERE pid <> pg_backend_pid() -- Exclude this monitoring connection
      ORDER BY state_change DESC;
    `);

    return result.rows;
  } finally {
    client.release();
  }
}

// Get database settings
async function getDatabaseSettings() {
  const client = await pool.connect();
  try {
    const result = await client.query(`
      SELECT name, setting, unit, context 
      FROM pg_settings
      WHERE name IN (
        'max_connections',
        'idle_in_transaction_session_timeout',
        'statement_timeout',
        'lock_timeout'
      )
      ORDER BY name;
    `);
    return result.rows;
  } finally {
    client.release();
  }
}

// Format duration as human-readable
function formatDuration(seconds) {
  if (!seconds) return 'N/A';
  
  const hours = Math.floor(seconds / 3600);
  const minutes = Math.floor((seconds % 3600) / 60);
  const remainingSeconds = Math.floor(seconds % 60);
  
  if (hours > 0) {
    return `${hours}h ${minutes}m ${remainingSeconds}s`;
  } else if (minutes > 0) {
    return `${minutes}m ${remainingSeconds}s`;
  } else {
    return `${remainingSeconds}s`;
  }
}

// Format the connections data
function formatConnectionData(connections) {
  return connections.map(conn => ({
    pid: conn.pid,
    username: conn.username,
    app: conn.application_name || 'N/A',
    state: conn.state || 'N/A',
    duration: formatDuration(conn.connection_duration_seconds),
    idle_transaction: conn.idle_in_transaction_seconds ? 
      formatDuration(conn.idle_in_transaction_seconds) : 'N/A',
    query_preview: conn.query_preview ? 
      conn.query_preview.replace(/\s+/g, ' ').trim() : 'N/A'
  }));
}

// Function to summarize connection state counts
function summarizeConnections(connections) {
  const states = {};
  let totalConnections = connections.length;
  
  connections.forEach(conn => {
    const state = conn.state || 'unknown';
    states[state] = (states[state] || 0) + 1;
  });
  
  return { totalConnections, states };
}

// Check for risky connections (like long idle in transaction)
function checkRiskyConnections(connections) {
  const risky = connections.filter(conn => 
    (conn.state === 'idle in transaction' && conn.idle_in_transaction_seconds > 60) || // Idle in transaction > 1 minute
    (conn.state === 'active' && conn.query_duration_seconds > 300) // Query running > 5 minutes
  );
  
  return risky;
}

async function monitorLoop() {
  try {
    console.clear();
    console.log(`=== PostgreSQL Connection Monitor (${new Date().toISOString()}) ===\n`);
    
    // Get and display database settings
    if (!global.dbSettings) {
      const settings = await getDatabaseSettings();
      global.dbSettings = settings;
      
      console.log('Database Settings:');
      console.table(settings.map(s => ({
        setting: s.name,
        value: s.setting + (s.unit ? ' ' + s.unit : ''),
        context: s.context
      })));
      console.log();
    }
    
    // Get current connections
    const connections = await getConnections();
    
    // Display summary
    const summary = summarizeConnections(connections);
    console.log(`Total Connections: ${summary.totalConnections}`);
    console.log('Connection States:');
    Object.entries(summary.states).forEach(([state, count]) => {
      console.log(`- ${state}: ${count}`);
    });
    console.log();
    
    // Check for risky connections
    const riskyConnections = checkRiskyConnections(connections);
    if (riskyConnections.length > 0) {
      console.log('⚠️ Risky Connections Detected:');
      console.table(formatConnectionData(riskyConnections));
      console.log();
    }
    
    // Display all connections
    console.log('All Active Connections:');
    console.table(formatConnectionData(connections));
    
    console.log(`\nNext update in ${MONITOR_INTERVAL} seconds. Press Ctrl+C to exit.`);
  } catch (err) {
    console.error('Error in monitoring:', err.message);
  }
  
  if (isRunning) {
    setTimeout(monitorLoop, MONITOR_INTERVAL * 1000);
  }
}

// Start monitoring
console.log('Starting PostgreSQL connection monitor...');
monitorLoop();

// Handle exit
process.on('SIGINT', async () => {
  console.log('\nShutting down monitor...');
  isRunning = false;
  try {
    await pool.end();
    console.log('Connection pool closed.');
  } catch (err) {
    console.error('Error closing pool:', err.message);
  }
  process.exit(0);
}); 