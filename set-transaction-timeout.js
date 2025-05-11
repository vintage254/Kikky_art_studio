require('dotenv').config();
const { Pool } = require('pg');

// Create a connection pool for Neon
const pool = new Pool({
  connectionString: process.env.DATABASE_URI,
  ssl: {
    rejectUnauthorized: false // Required for some Neon connections
  },
  // Only use one connection for this script
  max: 1,
  idleTimeoutMillis: 10000,
  connectionTimeoutMillis: 30000
});

async function setDatabaseOptimizations() {
  let client;
  
  try {
    console.log('Connecting to Neon PostgreSQL...');
    client = await pool.connect();
    console.log('Connection successful!');
    
    // Get database name
    const dbResult = await client.query('SELECT current_database() as db_name');
    const dbName = dbResult.rows[0].db_name;
    console.log(`Current database: ${dbName}`);
    
    // Set idle_in_transaction_session_timeout at database level (10 minutes)
    console.log('Setting idle_in_transaction_session_timeout to 10 minutes (600000ms)...');
    await client.query(`ALTER DATABASE ${dbName} SET idle_in_transaction_session_timeout = 600000`);
    console.log('✅ idle_in_transaction_session_timeout setting updated successfully!');
    
    // Set statement_timeout at database level (2 minutes)
    console.log('Setting statement_timeout to 2 minutes (120000ms)...');
    await client.query(`ALTER DATABASE ${dbName} SET statement_timeout = 120000`);
    console.log('✅ statement_timeout setting updated successfully!');
    
    // Set lock_timeout at database level (30 seconds)
    console.log('Setting lock_timeout to 30 seconds (30000ms)...');
    await client.query(`ALTER DATABASE ${dbName} SET lock_timeout = 30000`);
    console.log('✅ lock_timeout setting updated successfully!');
    
    // Set work_mem to a reasonable value if needed (affects memory used for sorting)
    console.log('Setting work_mem to 4MB...');
    await client.query(`ALTER DATABASE ${dbName} SET work_mem = '4MB'`);
    console.log('✅ work_mem setting updated successfully!');
    
    // Verify current session settings
    console.log('\nCurrent session settings:');
    const timeoutResults = await client.query(`
      SELECT name, setting, unit, category FROM pg_settings 
      WHERE name IN (
        'idle_in_transaction_session_timeout',
        'statement_timeout',
        'lock_timeout',
        'work_mem'
      )
    `);
    
    timeoutResults.rows.forEach(row => {
      console.log(`${row.name}: ${row.setting}${row.unit ? ' ' + row.unit : ''} (${row.category})`);
    });
    
    console.log('\nNote: The new database settings will take effect for new sessions only.');
    
  } catch (err) {
    console.error('Error executing query:', err);
    throw err;
  } finally {
    if (client) {
      client.release();
    }
    await pool.end();
    console.log('Database connection closed.');
  }
}

// Run the function
setDatabaseOptimizations()
  .then(() => console.log('Database optimization complete!'))
  .catch(err => {
    console.error('Failed to optimize database:', err);
    process.exit(1);
  }); 