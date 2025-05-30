/**
 * pg-cloudflare compatibility shim for Vercel
 * 
 * This module provides a direct replacement for pg-cloudflare that works with Vercel's serverless environment
 * by completely avoiding the use of TCP sockets.
 */

// Export an empty module that will be used as a replacement for pg-cloudflare
module.exports = {
  // Provide mock implementations of any required functions
  // This effectively disables the pg-cloudflare module when running on Vercel
  Socket: class MockSocket {
    constructor() {
      console.log('🔄 Using pg-cloudflare compatibility shim');
    }
    // Mock any methods that might be called
    connect() { return Promise.resolve(); }
    end() { return Promise.resolve(); }
  }
};
