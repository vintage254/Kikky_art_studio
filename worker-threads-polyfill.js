/**
 * Worker Threads Module Polyfill for Vercel
 * 
 * This provides a minimal worker_threads polyfill for modules that depend on Node's worker_threads module
 * but don't actually need full functionality in a serverless environment.
 */

const workerThreads = {
  // Return empty values for properties that might be accessed
  parentPort: {
    on: () => {},
    once: () => {},
    postMessage: () => {}
  },
  
  // Return empty worker data
  workerData: null,
  
  // Add other commonly used properties
  Worker: class MockWorker {
    constructor() {
      this.on = () => this;
      this.postMessage = () => {};
      this.terminate = () => {};
    }
  },
  
  isMainThread: true,
  
  threadId: 0
};

// Export for both CommonJS and ES modules
export default workerThreads;
module.exports = workerThreads;
