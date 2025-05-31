/**
 * Node Module Polyfill for Vercel
 * 
 * This provides a minimal polyfill for the node:module module
 * required by Payload CMS and other dependencies.
 */

// Create a mock module with commonly used methods
const nodeModule = {
  // Module methods
  createRequire: () => {
    return (id) => {
      // Basic mock require function
      if (id === 'assert') return require('assert');
      if (id === 'path') return require('path-browserify');
      if (id === 'util') return require('util');
      if (id === 'events') return require('events');
      return {};
    };
  },
  
  // Module symbols and properties
  builtinModules: [
    'assert', 'buffer', 'console', 'constants', 'crypto',
    'domain', 'events', 'http', 'https', 'os',
    'path', 'punycode', 'querystring', 'stream',
    'string_decoder', 'timers', 'tty', 'url', 'util', 'vm', 'zlib'
  ],
  
  // Module.syncBuiltinESMExports method
  syncBuiltinESMExports: () => {}
};

// Export for both CommonJS and ES modules
export default nodeModule;

// Export individual methods and properties
export const createRequire = nodeModule.createRequire;
export const builtinModules = nodeModule.builtinModules;
export const syncBuiltinESMExports = nodeModule.syncBuiltinESMExports;
