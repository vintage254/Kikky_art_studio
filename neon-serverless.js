/**
 * Neon Serverless Integration for Vercel Deployments
 * 
 * This file directly integrates Neon PostgreSQL's serverless driver with PayloadCMS.
 * It allows bypassing the cloudflare:sockets issues on Vercel by using HTTP rather than TCP.
 * 
 * References:
 * - https://neon.tech/docs/guides/vercel
 * - https://vercel.com/guides/how-to-use-the-serverless-neon-postgres-driver-with-node-js
 */

// For direct usage in PayloadCMS
const { neon, neonConfig } = require('@neondatabase/serverless');

// Configure Neon for better performance
neonConfig.fetchConnectionCache = true;

// Export a function that returns a ready-to-use SQL executor
function createNeonClient(connectionString) {
  if (!connectionString) {
    throw new Error('No connection string provided for Neon database');
  }
  
  // Log the connection (without sensitive details)
  console.log('🚀 Creating Neon serverless connection');
  
  // Create an HTTP-based SQL executor
  const sql = neon(connectionString);
  
  return {
    sql,
    connectionString,
    execute: sql,
    // Additional methods can be added here
  };
}

module.exports = {
  createNeonClient,
  neon,
  neonConfig
};
