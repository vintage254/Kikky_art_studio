/**
 * Direct Neon database integration for Vercel
 * 
 * This file provides a direct integration with Neon PostgreSQL for Vercel deployments,
 * completely bypassing the standard pg module to avoid cloudflare:sockets issues.
 */

// Import the serverless driver
const { neon, neonConfig } = require('@neondatabase/serverless');

// Configure for better performance
neonConfig.fetchConnectionCache = true;

// Create a singleton client
let sqlClient = null;

// Get the SQL executor for Neon
function getClient() {
  if (sqlClient === null) {
    // Get the connection string from environment
    const connectionString = process.env.DATABASE_URI;
    
    // Create a new client
    sqlClient = neon(connectionString);
    console.log('🚀 Created Neon serverless client for Vercel');
  }
  
  return sqlClient;
}

// Export the connection handler
module.exports = {
  sql: getClient(),
  getClient,
  // Used by PayloadCMS
  query: async (text, params) => {
    const client = getClient();
    return client(text, params);
  }
};
