/**
 * Node Protocol Polyfill for Vercel
 * 
 * This provides a special loader for node: protocol imports
 * which maps them to their appropriate polyfills.
 */

// Export standard Node.js modules that might be accessed via node: protocol
export const assert = require('assert');
export const buffer = require('buffer');
export const crypto = require('crypto-browserify');
export const events = require('events');
export const fs = {};
export const module = {};
export const os = require('os-browserify');
export const path = require('path-browserify');
export const stream = require('stream-browserify');
export const util = require('util');

// Export default object with all modules
const nodeProtocol = {
  assert,
  buffer,
  crypto,
  events,
  fs,
  module,
  os,
  path,
  stream,
  util
};

export default nodeProtocol;
