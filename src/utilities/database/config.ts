// Configuration for database connections
// This file contains optimized settings for Neon Postgres connections

export const postgresPoolConfig = {
  // Maximum number of clients in the pool
  max: parseInt(process.env.DATABASE_POOL_MAX || '10', 10),
  
  // Close idle clients after this many milliseconds
  idleTimeoutMillis: parseInt(process.env.DATABASE_IDLE_TIMEOUT_MS || '10000', 10),
  
  // Return an error after this many milliseconds if connection not established
  connectionTimeoutMillis: parseInt(process.env.DATABASE_CONNECTION_TIMEOUT_MS || '5000', 10),
  
  // Close and replace a connection after it's been used this many times
  maxUses: 7500,
  
  // Use reconnection strategy for connection errors
  allowExitOnIdle: false,
};

// Function to add Neon-specific connection options to a connection string
export function optimizeNeonConnectionString(connectionString: string): string {
  // Check if the connection string contains the Neon hostname
  if (!connectionString.includes('neon.tech')) {
    return connectionString;
  }
  
  // Add options to improve connection handling with Neon
  const url = new URL(connectionString);
  
  // Add parameters if they don't exist already
  if (!url.searchParams.has('connect_timeout')) {
    url.searchParams.set('connect_timeout', '10');  // 10 seconds
  }
  
  if (!url.searchParams.has('keepalives')) {
    url.searchParams.set('keepalives', '1');  // Enable TCP keepalives
  }
  
  if (!url.searchParams.has('keepalives_idle')) {
    url.searchParams.set('keepalives_idle', '30');  // 30 seconds
  }
  
  if (!url.searchParams.has('pool_timeout')) {
    url.searchParams.set('pool_timeout', '5');  // 5 seconds
  }
  
  return url.toString();
}
