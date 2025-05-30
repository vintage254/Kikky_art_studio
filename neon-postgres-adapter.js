/**
 * Neon PostgreSQL HTTP Adapter for Vercel
 * 
 * This file replaces standard PostgreSQL connections with Neon's HTTP-based serverless driver.
 */

const { Pool } = require('@neondatabase/serverless');

// Create a connection pool using Neon's HTTP protocol
function createNeonPool(connectionString) {
  if (!connectionString) {
    throw new Error('No DATABASE_URI provided');
  }
  
  console.log('🔌 Creating Neon serverless pool');
  
  return new Pool({
    connectionString,
    // Explicitly avoid TCP socket connections
    ssl: true,
    // Minimal pool settings for Vercel
    max: 1,
    connectionTimeoutMillis: 5000,
  });
}

// Export the adapter for use in payload.config.ts
module.exports = {
  createNeonPool,
};
