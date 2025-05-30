/**
 * Custom Next.js Module Resolver for Neon PostgreSQL
 * 
 * This file is specifically designed to handle the 'cloudflare:sockets' issue
 * when deploying to Vercel with Neon PostgreSQL.
 */

// This file is referenced in next.config.js
module.exports = {
  // This custom resolver helps Next.js understand how to handle certain modules
  resolveImport(specifier) {
    // If trying to import 'cloudflare:sockets', provide a null module instead
    if (specifier === 'cloudflare:sockets') {
      return { resolved: false };
    }
    
    // Handle Node.js built-in modules that might cause issues
    if (specifier.startsWith('node:')) {
      return { resolved: false };
    }
    
    // For all other modules, let Next.js handle them normally
    return { resolved: false };
  }
};
