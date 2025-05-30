/**
 * Vercel Database Configuration for Neon PostgreSQL
 * 
 * This file provides specific configuration for Vercel deployments to use
 * Neon PostgreSQL via their HTTP protocol rather than TCP sockets.
 */
import { neon } from '@neondatabase/serverless';

// Get the database connection string from environment
const connectionString = process.env.DATABASE_URI || '';

// Configure the database for Vercel
export function configureNeonForVercel() {
  console.log('🚀 Configuring Neon database for Vercel deployment');
  
  // Use the HTTP protocol for Neon
  const sql = neon(connectionString);
  
  return {
    sql,
    connectionString,
    isVercel: true
  };
}

// Default export for importing in various contexts
export default { configureNeonForVercel };
