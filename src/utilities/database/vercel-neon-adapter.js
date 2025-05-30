/**
 * Vercel-compatible Neon PostgreSQL adapter
 * 
 * This file provides a custom adapter that works specifically for Vercel deployments
 * with Neon PostgreSQL, avoiding the Cloudflare sockets issue by using the HTTP protocol.
 */

// Import the serverless driver directly
const { neon } = require('@neondatabase/serverless');

// Create a specialized module to be used in Vercel environment
module.exports = function setupVercelNeonAdapter(connectionString) {
  // Create the SQL executor with HTTP protocol
  const sql = neon(connectionString);
  
  console.log('📊 Setting up Vercel-compatible Neon adapter');
  
  // Return a wrapped adapter
  return {
    sql,
    connectionString,
    // Add any other methods needed for integration
  };
};
