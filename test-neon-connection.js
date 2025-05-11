require('dotenv').config();
const { Pool } = require('pg');

// Create a connection pool for Neon with optimal settings
const pool = new Pool({
  connectionString: process.env.DATABASE_URI,
  // Optimized settings for Neon PostgreSQL
  max: 3, // Maximum number of connections (limited by Neon)
  min: 0, // Allow pool to fully drain to zero when not in use
  idleTimeoutMillis: 30000, // 30 second idle timeout
  connectionTimeoutMillis: 30000, // 30 second connection timeout (for cold starts)
  ssl: {
    rejectUnauthorized: false // Required for some Neon connections
  },
  // Automatically clean idle clients after 30 seconds
  allowExitOnIdle: true
});

// Handle pool-level errors (crucial for handling scale-to-zero reconnection)
pool.on('error', (err) => {
  console.error('Unexpected postgres pool error:', err.message);
  // Don't crash the application, just log the error
  // The next query will automatically create a new connection
});

async function testNeonConnection() {
  console.log('Testing Neon PostgreSQL connection with best practices...');
  let client;
  
  try {
    console.log('1. Acquiring connection from pool...');
    client = await pool.connect();
    console.log('✅ Connection successful!');
    
    // Basic query test
    console.log('\n2. Testing basic query...');
    const versionResult = await client.query('SELECT version()');
    console.log(`✅ PostgreSQL Version: ${versionResult.rows[0].version}`);
    
    // Database info
    console.log('\n3. Getting database information...');
    const dbResult = await client.query(`
      SELECT 
        current_database() as db_name,
        current_user as user_name,
        inet_server_addr() as server_ip,
        inet_server_port() as server_port,
        pg_size_pretty(pg_database_size(current_database())) as db_size
    `);
    console.log('✅ Database info:');
    console.table(dbResult.rows[0]);
    
    // Check connection pooling status
    console.log('\n4. Checking connection pool stats...');
    console.log(`- Total connections in pool: ${pool.totalCount}`);
    console.log(`- Idle connections in pool: ${pool.idleCount}`);
    console.log(`- Waiting clients: ${pool.waitingCount}`);
    
    // Check current timeout settings
    console.log('\n5. Checking current timeout settings...');
    const timeoutResults = await client.query(`
      SELECT name, setting, unit, context FROM pg_settings 
      WHERE name IN (
        'idle_in_transaction_session_timeout',
        'statement_timeout',
        'lock_timeout'
      )
    `);
    
    console.log('✅ Current timeout settings:');
    console.table(timeoutResults.rows.map(row => ({
      setting: row.name,
      value: row.setting + (row.unit ? ' ' + row.unit : ''),
      context: row.context
    })));
    
    // Checking table access
    console.log('\n6. Checking tables in the current database...');
    const tableResult = await client.query(`
      SELECT table_name, table_schema 
      FROM information_schema.tables 
      WHERE table_schema NOT IN ('pg_catalog', 'information_schema')
      LIMIT 5
    `);
    
    if (tableResult.rows.length > 0) {
      console.log('✅ Found tables:');
      console.table(tableResult.rows);
    } else {
      console.log('ℹ️ No user tables found in the current database');
    }
    
    console.log('\n✅ All connection tests completed successfully!');
    console.log('💡 TIP: For production use with Neon, remember to:');
    console.log('  - Handle reconnection on scale-to-zero events');
    console.log('  - Use prepared statements for better performance');
    console.log('  - Properly release connections back to the pool');
    console.log('  - Consider using Neon\'s connection pooler for high connection scenarios');
    
      } catch (err) {
    console.error('❌ Error during connection test:', err.message);
    if (err.code) {
      console.error(`Error code: ${err.code}`);
    }
    if (err.stack) {
      console.error('Stack trace:', err.stack);
    }
    
    // Provide helpful guidance based on error code
    switch(err.code) {
      case 'ENOTFOUND':
      case 'ETIMEDOUT':
        console.error('Network error: Please check your connection string, VPN settings, or firewall rules');
        break;
      case '28P01':
        console.error('Authentication error: Invalid username or password');
        break;
      case '3D000':
        console.error('Database error: The database does not exist');
        break;
      case '42P01':
        console.error('Table error: The specified table does not exist');
        break;
      case '57P03':
        console.error('Connection error: The database system is starting up or in recovery mode');
        console.error('This is normal with Neon scale-to-zero. Try again in a few seconds.');
        break;
    }
  } finally {
    if (client) {
      client.release();
      console.log('Connection released back to pool');
    }
    
    try {
      // Properly close the pool when done
    await pool.end();
      console.log('Connection pool closed');
    } catch (poolErr) {
      console.error('Error closing pool:', poolErr.message);
    }
  }
}

// Run the test
testNeonConnection()
  .then(() => {
    console.log('Test script completed');
  })
  .catch(err => {
    console.error('Unhandled error in test script:', err);
    process.exit(1);
  }); 