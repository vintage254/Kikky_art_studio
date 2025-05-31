/**
 * This is a bridge module that re-exports client-side utilities
 * to maintain backward compatibility while avoiding Node.js imports in client code
 * 
 * IMPORTANT: This file should NOT import any server-only dependencies like Payload CMS
 * or Node.js core modules, as it may be imported by client components.
 */

// Re-export everything from the client module for backward compatibility
export * from './client';

// Re-export the token cookie name from constants for consistency
export { TOKEN_COOKIE_NAME } from './constants';
