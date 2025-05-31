/**
 * Node OS Polyfill for Vercel
 * 
 * This provides a minimal polyfill for the node:os module
 * required by Payload CMS and other dependencies.
 */

// Create a mock os module with commonly used methods
const os = {
  // Basic OS information
  type: () => 'Linux',
  platform: () => 'linux',
  arch: () => 'x64',
  release: () => '5.4.0',
  
  // CPU information
  cpus: () => [{ model: 'Serverless CPU', speed: 2000 }],
  
  // Memory information
  totalmem: () => 8 * 1024 * 1024 * 1024, // 8GB
  freemem: () => 4 * 1024 * 1024 * 1024, // 4GB
  
  // Network information
  networkInterfaces: () => ({}),
  
  // User information
  userInfo: () => ({
    username: 'vercel',
    homedir: '/home/vercel',
    shell: '/bin/bash'
  }),
  
  // System constants
  constants: {
    UV_UDP_REUSEADDR: 4,
    dlopen: {},
    errno: {},
    signals: {},
    priority: {}
  },
  
  // Common methods
  hostname: () => 'vercel-serverless',
  tmpdir: () => '/tmp',
  homedir: () => '/home/vercel',
  endianness: () => 'LE',
  loadavg: () => [0, 0, 0]
};

// Export for both CommonJS and ES modules
export default os;

// Export individual methods and properties
export const type = os.type;
export const platform = os.platform;
export const arch = os.arch;
export const release = os.release;
export const cpus = os.cpus;
export const totalmem = os.totalmem;
export const freemem = os.freemem;
export const networkInterfaces = os.networkInterfaces;
export const userInfo = os.userInfo;
export const constants = os.constants;
export const hostname = os.hostname;
export const tmpdir = os.tmpdir;
export const homedir = os.homedir;
export const endianness = os.endianness;
export const loadavg = os.loadavg;
