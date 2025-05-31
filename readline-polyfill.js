/**
 * Readline Module Polyfill for Vercel
 * 
 * This provides a minimal readline polyfill for modules that depend on Node's readline module
 * but don't actually need it in a serverless environment.
 */

// Create a mock interface
const createInterface = (options) => {
  return {
    // Basic methods
    close: () => {},
    pause: () => {},
    resume: () => {},
    write: () => {},
    
    // Event handlers
    on: (event, callback) => {
      return this;
    },
    once: (event, callback) => {
      return this;
    },
    
    // Question method that immediately returns a fake response
    question: (query, callback) => {
      if (callback) {
        process.nextTick(() => callback(''));
      }
      return this;
    },
    
    // Line listeners
    setPrompt: () => {},
    prompt: () => {}
  };
};

// Export readline functions
const readline = {
  createInterface,
  clearLine: (stream, dir) => {},
  clearScreenDown: (stream) => {},
  moveCursor: (stream, dx, dy) => {},
  cursorTo: (stream, x, y) => {}
};

// Export for both CommonJS and ES modules
export default readline;
module.exports = readline;
