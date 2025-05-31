/**
 * Child Process Module Polyfill for Vercel
 * 
 * This provides a minimal child_process polyfill for modules that depend on Node's child_process module
 * but don't actually need it in a serverless environment.
 */

// Create a mock spawn function that returns an EventEmitter-like object
const mockSpawn = () => {
  const events = {};
  
  const emitter = {
    on: (event, listener) => {
      if (!events[event]) {
        events[event] = [];
      }
      events[event].push(listener);
      return emitter;
    },
    
    emit: (event, ...args) => {
      if (events[event]) {
        events[event].forEach(listener => listener(...args));
      }
      return true;
    },
    
    // Common stream properties
    stdout: {
      on: (event, listener) => {
        return emitter.on(`stdout:${event}`, listener);
      },
      pipe: (destination) => destination
    },
    
    stderr: {
      on: (event, listener) => {
        return emitter.on(`stderr:${event}`, listener);
      },
      pipe: (destination) => destination
    },
    
    // Mock a child process exit
    kill: () => {
      setTimeout(() => {
        emitter.emit('exit', 0);
      }, 0);
      return true;
    }
  };
  
  // Emit a mock exit event in the next tick
  setTimeout(() => {
    emitter.emit('exit', 0);
  }, 0);
  
  return emitter;
};

// Export a mock child_process module
const childProcess = {
  spawn: (command, args, options) => mockSpawn(),
  exec: (command, options, callback) => {
    if (typeof options === 'function') {
      callback = options;
      options = {};
    }
    
    if (callback) {
      process.nextTick(() => callback(null, '', ''));
    }
    
    return mockSpawn();
  },
  execFile: (file, args, options, callback) => {
    if (typeof options === 'function') {
      callback = options;
      options = {};
    }
    
    if (callback) {
      process.nextTick(() => callback(null, '', ''));
    }
    
    return mockSpawn();
  }
};

// Export for both CommonJS and ES modules
export default childProcess;
module.exports = childProcess;
