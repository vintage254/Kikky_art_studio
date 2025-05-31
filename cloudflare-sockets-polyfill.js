/**
 * Cloudflare Sockets Polyfill for Vercel
 * 
 * This provides a minimal polyfill for the cloudflare:sockets module
 * used by pg-cloudflare but not supported in Vercel's environment.
 */

// Create a simple socket polyfill object
const sockets = {
  // Mock connect method that returns a promise
  connect: () => {
    return Promise.reject(new Error('Cloudflare sockets not supported in this environment'));
  },
  
  // Add any other needed methods
  createConnection: () => {
    throw new Error('Cloudflare sockets not supported in this environment');
  }
};

// Export for both CommonJS and ES modules
export default sockets;
module.exports = sockets;
