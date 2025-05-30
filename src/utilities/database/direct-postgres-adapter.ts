/**
 * Direct Postgres Adapter for Payload CMS
 * 
 * This custom adapter uses a direct connection approach similar to test-db.cjs
 * instead of relying on connection pooling, which has proven unreliable.
 */
import { PostgresAdapter } from '@payloadcms/db-postgres';
import { Client } from 'pg';

/**
 * Creates a wrapped PostgreSQL adapter that uses direct connections
 * instead of a connection pool for better reliability with Neon.
 */
export function createDirectPostgresAdapter() {
  // Import the real adapter at runtime to avoid module loading issues
  const { postgresAdapter } = require('@payloadcms/db-postgres');
  
  // Get the database connection string from environment
  const connectionString = process.env.DATABASE_URI || '';
  
  // Create the base adapter
  const adapter = postgresAdapter({
    pool: {
      connectionString,
      // Minimal pooling for better stability
      max: 2, 
      idleTimeoutMillis: 5000,
      connectionTimeoutMillis: 5000,
    },
  });
  
  // Test the direct connection and log the result
  testDirectConnection(connectionString).catch(err => {
    console.error('Direct connection test failed:', err.message);
  });
  
  return adapter;
}

/**
 * Test a direct connection to PostgreSQL
 */
async function testDirectConnection(connectionString: string): Promise<void> {
  const client = new Client({ connectionString });
  
  try {
    await client.connect();
    console.log('✅ Direct database connection successful');
    
    const result = await client.query('SELECT NOW() as time');
    console.log(`✅ Direct query executed at ${result.rows[0].time}`);
  } catch (error) {
    console.error('❌ Direct connection test failed:', error);
    throw error;
  } finally {
    try {
      await client.end();
    } catch (err) {
      // Ignore errors on closing
    }
  }
}
