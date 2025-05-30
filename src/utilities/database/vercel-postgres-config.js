/**
 * Vercel Postgres Configuration
 * 
 * This module configures the database connection for Vercel deployments, specifically
 * handling the Neon PostgreSQL connection via HTTP rather than TCP sockets.
 */

// For CommonJS compatibility
if (typeof require !== 'undefined') {
  // When running on Vercel, use the HTTP-based driver
  try {
    // Direct import without using cloudflare:sockets
    const { Pool } = require('@neondatabase/serverless');
    
    // Export a factory function to create the pool
    module.exports = function createPool(options) {
      console.log('🔌 Using Neon serverless driver for Vercel deployment');
      return new Pool(options);
    };
  } catch (error) {
    console.error('Failed to load Neon serverless driver:', error);
    // Fallback to normal pg driver
    const { Pool } = require('pg');
    module.exports = function createPool(options) {
      console.log('🔌 Using standard pg driver');
      return new Pool(options);
    };
  }
} else {
  // For ESM
  module.exports = {};
}
