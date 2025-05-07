require('dotenv').config();
const { Pool } = require('pg');

// Use the new connection string format with the session pooler
const connectionString = process.env.DATABASE_URI.replace(
  /postgresql:\/\/postgres:(.+)@db\.njcowccdmobbgjfzkjqo\.supabase\.co:5432\/postgres/,
  'postgresql://postgres.njcowccdmobbgjfzkjqo:$1@aws-0-us-east-2.pooler.supabase.com:5432/postgres'
);

console.log('Trying connection with:', connectionString.replace(/:[^:]*@/, ':****@'));

const pool = new Pool({
  connectionString: connectionString,
});

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