/**
 * Neon Database Configuration for Vercel
 * 
 * This module sets up the database connection specifically for Vercel deployments
 * using Neon's HTTP-based protocol instead of TCP sockets.
 */

// We're using the special import syntax to avoid webpack issues
let serverlessDriver;

// Only run this on the server side
if (typeof window === 'undefined') {
  try {
    // Dynamic import to avoid webpack issues
    serverlessDriver = require('@neondatabase/serverless');
    
    // Configure the driver for optimal performance
    if (serverlessDriver.neonConfig) {
      serverlessDriver.neonConfig.fetchConnectionCache = true;
    }
    
    console.log('✅ Loaded Neon serverless driver');
  } catch (err) {
    console.error('❌ Failed to load Neon serverless driver:', err.message);
  }
}

// Create a database connection function
function createNeonConnection(connectionString) {
  if (typeof window !== 'undefined') {
    console.warn('⚠️ Attempted to create Neon connection in browser context');
    return null;
  }
  
  if (!serverlessDriver || !serverlessDriver.neon) {
    console.error('❌ Neon serverless driver not available');
    return null;
  }
  
  try {
    // Create a SQL executor using Neon's HTTP protocol
    const sql = serverlessDriver.neon(connectionString);
    console.log('🚀 Created Neon serverless connection');
    return sql;
  } catch (err) {
    console.error('❌ Failed to create Neon connection:', err.message);
    return null;
  }
}

// Export for use in payload.config.ts
module.exports = {
  createNeonConnection,
  // If serverlessDriver is available, expose its components
  neon: serverlessDriver?.neon,
  Pool: serverlessDriver?.Pool,
};
