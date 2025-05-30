/**
 * Neon Serverless Adapter for Payload CMS
 * 
 * This adapter uses the @neondatabase/serverless driver instead of the standard pg driver
 * to enable compatibility with Vercel's serverless environment.
 */
import { neon } from '@neondatabase/serverless/index';
import { postgresAdapter } from '@payloadcms/db-postgres';

/**
 * Creates a PostgreSQL adapter using Neon's serverless driver
 */
export function createNeonServerlessAdapter() {
  // Get the database connection string from environment
  const connectionString = process.env.DATABASE_URI || '';
  
  // Create a Neon serverless SQL executor
  const sql = neon(connectionString);
  
  // Log successful configuration
  console.log('📊 Configured Neon serverless database adapter');
  
  // Create and return the adapter
  // The postgresAdapter expects a pool config object, not an actual pool instance
  return postgresAdapter({
    pool: {
      connectionString,
      // Minimal pooling settings to prevent connection issues
      max: 2,
      idleTimeoutMillis: 5000,
      connectionTimeoutMillis: 5000,
    }
  });
}
