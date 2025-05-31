/**
 * Node FS Polyfill for Vercel
 * 
 * This provides a minimal polyfill for the node:fs module
 * required by Payload CMS and other dependencies.
 */

// Create a mock fs module with commonly used methods
const fs = {
  // File system promises API
  promises: {
    readFile: () => Promise.resolve(''),
    writeFile: () => Promise.resolve(),
    mkdir: () => Promise.resolve(),
    stat: () => Promise.resolve({ isDirectory: () => false }),
    access: () => Promise.resolve(),
    readdir: () => Promise.resolve([]),
    unlink: () => Promise.resolve(),
    rm: () => Promise.resolve()
  },
  
  // Synchronous methods
  readFileSync: () => '',
  writeFileSync: () => undefined,
  mkdirSync: () => undefined,
  statSync: () => ({ isDirectory: () => false }),
  existsSync: () => false,
  readdirSync: () => [],
  unlinkSync: () => undefined,
  
  // Stream methods
  createReadStream: () => ({
    on: () => ({}),
    pipe: (dest) => dest
  }),
  createWriteStream: () => ({
    on: () => ({}),
    write: () => true,
    end: () => undefined
  }),
  
  // Constants
  constants: {
    F_OK: 0,
    R_OK: 4,
    W_OK: 2,
    X_OK: 1
  }
};

// Export for both CommonJS and ES modules
export default fs;
export const promises = fs.promises;
export const constants = fs.constants;

// Export common methods
export const readFile = fs.promises.readFile;
export const writeFile = fs.promises.writeFile;
export const mkdir = fs.promises.mkdir;
export const stat = fs.promises.stat;
export const readFileSync = fs.readFileSync;
export const writeFileSync = fs.writeFileSync;
export const existsSync = fs.existsSync;
export const readdirSync = fs.readdirSync;
