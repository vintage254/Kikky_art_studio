/**
 * Neon Serverless Adapter for Payload CMS
 * 
 * This adapter uses the @neondatabase/serverless driver instead of the standard pg driver
 * to enable compatibility with Vercel's serverless environment.
 */
import { neon } from '@neondatabase/serverless';
import { postgresAdapter } from '@payloadcms/db-postgres';
import type { PoolConfig as PgPoolConfig } from 'pg'; // Import PoolConfig type from pg

/**
 * Type definitions for Neon adapter options
 */
interface NeonPoolConfig {
  max?: number;
  idleTimeoutMillis?: number;
  connectionTimeoutMillis?: number;
  ssl?: PgPoolConfig['ssl']; // Add ssl property, typed from pg's PoolConfig
  // Add other relevant pool config properties if they are supported by pg pool
}

interface NeonAdapterOptions {
  connectionString: string;
  poolConfig: NeonPoolConfig;
}

/**
 * Creates a PostgreSQL adapter using Neon's serverless driver with custom options
 */
export function createNeonServerlessAdapter(options: NeonAdapterOptions) {
  const { connectionString, poolConfig } = options;
  
  // Create a Neon serverless SQL executor using the provided connection string
  const sql = neon(connectionString);
  
  // Log successful configuration with custom settings
  console.log('📊 Configured Neon serverless database adapter with custom settings');
  if (poolConfig.ssl) {
    console.log(`[INFO] Neon adapter configured with SSL options: ${JSON.stringify(poolConfig.ssl)}`);
  }
  
  // Create and return the adapter
  // The postgresAdapter expects a pool config object.
  // We pass the connectionString explicitly and spread the rest of the poolConfig.
  return postgresAdapter({
    pool: {
      connectionString: connectionString, // Ensure connectionString is part of the pool options for postgresAdapter
      ...poolConfig, // Spread the custom pool configuration (max, idleTimeoutMillis, ssl, etc.)
    }
  });
}
