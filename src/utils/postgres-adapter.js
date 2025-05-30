// Direct support for Neon PostgreSQL on Vercel
// This file handles both local development and Vercel production environments

/**
 * The standard PostgreSQL adapter won't work on Vercel due to Cloudflare sockets issues.
 * This module provides direct PostgreSQL access that works in both environments.
 */

// Dynamically import the appropriate client based on environment
let Pool;

// This conditional import approach prevents webpack from trying to bundle cloudflare:sockets
if (process.env.VERCEL) {
  // For Vercel, use Neon's serverless driver with HTTP protocol
  try {
    const { Pool: NeonPool } = require('@neondatabase/serverless');
    Pool = NeonPool;
    console.log('🚀 Using Neon serverless HTTP driver on Vercel');
  } catch (err) {
    console.error('Failed to load Neon serverless driver:', err);
    // Fallback to regular pg (might not work on Vercel)
    const { Pool: PgPool } = require('pg');
    Pool = PgPool;
  }
} else {
  // For local development, use standard pg driver
  const { Pool: PgPool } = require('pg');
  Pool = PgPool;
  console.log('🛠️ Using standard PostgreSQL driver for local development');
}

// Create and export a connection pool
function createPool(connectionString, options = {}) {
  return new Pool({
    connectionString,
    ssl: process.env.VERCEL ? true : false,
    // Minimal pool settings for better reliability
    max: 2,
    idleTimeoutMillis: 5000,
    connectionTimeoutMillis: 5000,
    ...options
  });
}

module.exports = { createPool };
