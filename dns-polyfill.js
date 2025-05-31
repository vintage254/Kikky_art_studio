/**
 * DNS Module Polyfill for Vercel
 * 
 * This provides a minimal DNS polyfill for modules that depend on Node's dns module
 * but don't actually need it in a serverless environment.
 */

// Provide mock implementations of the dns methods that are commonly used
const dns = {
  // Mock lookup function that always resolves with a safe localhost IP
  lookup: (hostname, options, callback) => {
    // Handle different function signatures
    if (typeof options === 'function') {
      callback = options;
      options = {};
    }
    
    // Always resolve to localhost for safety
    const err = null;
    const address = '127.0.0.1';
    const family = 4;
    
    if (callback) {
      process.nextTick(() => callback(err, address, family));
    }
    
    return { address, family };
  },
  
  // Promise-based version
  promises: {
    lookup: async (hostname, options) => {
      return { address: '127.0.0.1', family: 4 };
    }
  },
  
  // Mock resolve function that always returns localhost
  resolve: (hostname, callback) => {
    if (callback) {
      process.nextTick(() => callback(null, ['127.0.0.1']));
    }
  },
  
  // Promise-based version
  resolve4: (hostname, callback) => {
    if (callback) {
      process.nextTick(() => callback(null, ['127.0.0.1']));
    }
  },
  
  // Other common DNS methods with mock implementations
  resolveAny: (hostname, callback) => {
    if (callback) {
      process.nextTick(() => callback(null, [{ address: '127.0.0.1', ttl: 60 }]));
    }
  }
};

// Export for both CommonJS and ES modules
export default dns;
module.exports = dns;
