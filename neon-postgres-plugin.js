/**
 * Neon PostgreSQL Plugin for Vercel
 * 
 * This file serves as a wrapper for the Neon PostgreSQL driver,
 * specifically designed to work in Vercel's serverless environment.
 */

// This module will be resolved directly by Vercel
module.exports = {};

// Add special handling for Vercel environment
if (process.env.VERCEL) {
  console.log('🚀 Running in Vercel environment, setting up Neon Serverless');
  
  // Tell Webpack not to bundle cloudflare:sockets
  if (typeof __non_webpack_require__ !== 'undefined') {
    // Use dynamic require to bypass webpack
    global.__non_webpack_require__('cloudflare:sockets');
  }
}

// Export empty module for client-side
if (typeof window !== 'undefined') {
  module.exports = {};
}
