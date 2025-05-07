require('dotenv').config();
const { Pool } = require('pg');

// Using direct connection parameters instead of connection string
const connectionParams = {
  user: 'postgres.njcowccdmobbgjfzkjqo',
  password: process.env.DATABASE_URI.match(/postgres:[^@]+@/)[0].replace('postgres:', '').replace('@', ''),
  host: 'aws-0-us-east-2.pooler.supabase.com',
  port: 5432,
  database: 'postgres',
  ssl: {
    rejectUnauthorized: false // Allow self-signed certificates
  }
};

console.log('Trying connection with params:', {
  ...connectionParams,
  password: '****'
});

const pool = new Pool(connectionParams);

async function testConnection() {
  try {
    const client = await pool.connect();
    console.log('Successfully connected to the database!');
    const result = await client.query('SELECT NOW()');
    console.log('Current time in database:', result.rows[0].now);
    client.release();
  } catch (err) {
    console.error('Database connection error:', err);
  } finally {
    await pool.end();
  }
}

testConnection(); 