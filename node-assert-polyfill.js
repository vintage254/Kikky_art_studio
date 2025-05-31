/**
 * Node Assert Polyfill for Vercel
 */

// Import and re-export the assert module
import assert from 'assert';
export default assert;
export { assert };

// Export all properties from assert
export const strict = assert.strict;
export const deepEqual = assert.deepEqual;
export const deepStrictEqual = assert.deepStrictEqual;
export const doesNotMatch = assert.doesNotMatch;
export const doesNotReject = assert.doesNotReject;
export const doesNotThrow = assert.doesNotThrow;
export const equal = assert.equal;
export const fail = assert.fail;
export const ifError = assert.ifError;
export const match = assert.match;
export const notDeepEqual = assert.notDeepEqual;
export const notDeepStrictEqual = assert.notDeepStrictEqual;
export const notEqual = assert.notEqual;
export const notStrictEqual = assert.notStrictEqual;
export const ok = assert.ok;
export const rejects = assert.rejects;
export const strictEqual = assert.strictEqual;
export const throws = assert.throws;
