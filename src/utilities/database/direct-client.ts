/**
 * Direct PostgreSQL Client for Neon
 * 
 * This utility provides a direct connection to Neon PostgreSQL
 * that bypasses connection pools for more reliable connections.
 */

import { Client } from 'pg';

/**
 * Create a direct connection to Neon PostgreSQL
 * This uses the same approach as the successful test-db.cjs
 */
export async function testNeonConnection(): Promise<boolean> {
  // Get the connection string from environment variables
  let connectionString = process.env.DATABASE_URI || '';
  
  // Ensure we're using the pooler endpoint for Neon
  if (connectionString.includes('neon.tech') && !connectionString.includes('-pooler')) {
    connectionString = connectionString.replace(/(@[^/]+\.neon\.tech)/, '$1-pooler');
  }
  
  // Create a new client with the modified connection string
  const client = new Client({
    connectionString,
    // Don't wait too long to connect
    connectionTimeoutMillis: 5000,
  });
  
  try {
    // Attempt to connect
    await client.connect();
    console.log('✅ Direct Neon connection successful');
    
    // Test a simple query
    const result = await client.query('SELECT NOW() as time');
    console.log(`✅ Query executed at ${result.rows[0].time}`);
    
    return true;
  } catch (error) {
    console.error('❌ Direct Neon connection failed:', error);
    return false;
  } finally {
    // Always close the connection
    try {
      await client.end();
    } catch (err) {
      // Ignore errors when closing
    }
  }
}

/**
 * Convert a standard Neon connection string to use the pooler endpoint
 */
export function getPoolerConnectionString(connectionString: string): string {
  if (!connectionString) return '';
  
  // Skip if already using pooler
  if (connectionString.includes('-pooler')) {
    return connectionString;
  }
  
  try {
    // For Neon URLs, ensure we're using the pooler endpoint
    if (connectionString.includes('neon.tech')) {
      return connectionString.replace(/(@[^/]+\.neon\.tech)/, '$1-pooler');
    }
    
    // For other URLs, return as is
    return connectionString;
  } catch (err) {
    console.warn('Error converting to pooler connection string:', err);
    return connectionString;
  }
}
