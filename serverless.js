/**
 * Serverless Database Adapter for Vercel
 * 
 * This file explicitly configures the database connection for Vercel's serverless environment.
 * It patches the PostgreSQL driver to use Neon's serverless-compatible HTTP protocol.
 */

// Export configuration for Vercel
module.exports = {
  // Tell Next.js to treat these modules as externals
  externals: [
    'pg-native',
    'cloudflare:sockets',
  ],
  
  // Webpack will not attempt to bundle these modules
  resolve: {
    alias: {
      // Replace PostgreSQL with compatible modules for serverless
      'pg': '@neondatabase/serverless',
      'pg-native': false,
      'cloudflare:sockets': false,
    },
    fallback: {
      // Node.js built-in modules that might be referenced
      'fs': false,
      'path': false,
      'net': false,
      'tls': false,
      'crypto': false,
      'stream': false,
    }
  }
};
