// Database Connection Test Script
// Run with: node test-connection.js
import dotenv from 'dotenv';
import pg from 'pg';
import { fileURLToPath } from 'url';
import path from 'path';
import fs from 'fs';

// Initialize dotenv
dotenv.config();

// Get file paths
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

/**
 * Tests direct connection to Postgres database
 */
async function testDirectConnection(connectionString) {
  console.log('Testing direct connection to database...');
  
  const client = new pg.Client({ 
    connectionString,
    // Set reasonable timeout
    connectionTimeoutMillis: 5000,
  });
  
  try {
    console.log('Connecting...');
    await client.connect();
    
    console.log('✅ Connection successful! Running test query...');
    const result = await client.query('SELECT NOW() as time');
    console.log(`✅ Query executed at ${result.rows[0].time}`);
    
    console.log('Checking database tables...');
    const tablesResult = await client.query(`
      SELECT table_name 
      FROM information_schema.tables 
      WHERE table_schema='public' 
      ORDER BY table_name
    `);
    
    console.log('Available tables:');
    tablesResult.rows.forEach((row, i) => {
      console.log(`${i+1}. ${row.table_name}`);
    });
    
    return true;
  } catch (error) {
    console.error('❌ Connection failed:', error.message);
    console.error('Stack:', error.stack);
    return false;
  } finally {
    try {
      console.log('Closing connection...');
      await client.end();
      console.log('Connection closed.');
    } catch (err) {
      // Ignore errors when closing
    }
  }
}

/**
 * Update the .env file with improved Neon database settings
 */
function updateEnvFile(connectionString) {
  try {
    // Read current .env file
    const envPath = path.join(__dirname, '.env');
    let content = fs.readFileSync(envPath, 'utf8');
    
    // Add optimized database pool settings if they don't exist
    if (!content.includes('DATABASE_POOL_MAX=')) {
      content += '\n# Optimized PostgreSQL Connection Pool Settings\n';
      content += 'DATABASE_POOL_MAX=2\n';
      content += 'DATABASE_IDLE_TIMEOUT_MS=5000\n';
      content += 'DATABASE_CONNECTION_TIMEOUT_MS=5000\n';
    } else {
      // Update existing pool settings
      content = content.replace(/DATABASE_POOL_MAX=\d+/, 'DATABASE_POOL_MAX=2');
      content = content.replace(/DATABASE_IDLE_TIMEOUT_MS=\d+/, 'DATABASE_IDLE_TIMEOUT_MS=5000');
      content = content.replace(/DATABASE_CONNECTION_TIMEOUT_MS=\d+/, 'DATABASE_CONNECTION_TIMEOUT_MS=5000');
    }
    
    // Write updated content back to .env file
    fs.writeFileSync(envPath, content);
    console.log('✅ Updated .env file with optimized database settings');
    
    return true;
  } catch (error) {
    console.error('❌ Failed to update .env file:', error.message);
    return false;
  }
}

// Main function
async function main() {
  // Get connection string from environment
  const connectionString = process.env.DATABASE_URI;
  
  if (!connectionString) {
    console.error('❌ No DATABASE_URI found in .env file');
    return;
  }
  
  // Display connection info (with password hidden)
  const displayString = connectionString.replace(/:[^:@]+@/, ':***@');
  console.log(`Connection string: ${displayString}`);
  
  // Test direct connection
  const success = await testDirectConnection(connectionString);
  
  if (success) {
    console.log('\n🎉 Database connection is working properly!');
    
    // Update .env file with optimized settings
    updateEnvFile(connectionString);
    
    console.log('\n✨ Recommendations for your Next.js app:');
    console.log('1. Restart your development server: pnpm run dev');
    console.log('2. If connection issues persist, try deploying to Vercel where serverless connections may be more stable');
    console.log('3. For local development, consider using a connection pooler like pgBouncer');
  } else {
    console.log('\n❌ Database connection test failed.');
    console.log('\n🔍 Troubleshooting steps:');
    console.log('1. Check if the Neon database is online in your dashboard');
    console.log('2. Verify your database credentials are correct');
    console.log('3. Try using the pooler endpoint in your connection string (add -pooler to the hostname)');
  }
}

// Run the script
main().catch(err => {
  console.error('Unexpected error:', err);
  process.exit(1);
});
