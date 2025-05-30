/**
 * Neon Database Connection Helper
 * 
 * This utility provides functions for optimizing connections to Neon PostgreSQL
 * specifically for serverless and edge environments where connection pooling
 * can be problematic.
 */

/**
 * Optimize a Neon database URI for better connection handling
 * This function takes a standard PostgreSQL connection string and adds
 * parameters to improve reliability with Neon's serverless Postgres
 */
export function optimizeNeonConnectionString(uri: string): string {
  if (!uri) return uri;
  
  try {
    // Parse the connection string to URL format
    const url = new URL(uri);
    
    // Check if this is a Neon database URL
    if (url.hostname.includes('neon.tech')) {
      // Add Neon-specific parameters for improved connection handling
      
      // Set connection timeout (10 seconds)
      if (!url.searchParams.has('connect_timeout')) {
        url.searchParams.set('connect_timeout', '10');
      }
      
      // Enable TCP keepalives
      if (!url.searchParams.has('keepalives')) {
        url.searchParams.set('keepalives', '1');
      }
      
      // Set keepalives idle time (30 seconds)
      if (!url.searchParams.has('keepalives_idle')) {
        url.searchParams.set('keepalives_idle', '30');
      }
      
      // Set keepalives interval (10 seconds)
      if (!url.searchParams.has('keepalives_interval')) {
        url.searchParams.set('keepalives_interval', '10');
      }
      
      // Set keepalives count (3 retries)
      if (!url.searchParams.has('keepalives_count')) {
        url.searchParams.set('keepalives_count', '3');
      }
      
      // Disable pooling explicitly (important for serverless environments)
      if (!url.searchParams.has('pooling')) {
        url.searchParams.set('pooling', 'false');
      }
      
      // Set statement timeout (30 seconds)
      if (!url.searchParams.has('statement_timeout')) {
        url.searchParams.set('statement_timeout', '30000');
      }
      
      // Enable binary data transfer for better performance
      if (!url.searchParams.has('binary_transfer')) {
        url.searchParams.set('binary_transfer', 'true');
      }
      
      return url.toString();
    }
    
    return uri;
  } catch (err) {
    // If there's an error parsing the URI, return it unchanged
    console.warn('Error optimizing Neon connection string:', err);
    return uri;
  }
}

/**
 * Generate an environment-appropriate Neon connection string
 * This will use direct connections for development and pooling for production
 */
export function getNeonConnectionString(): string {
  const baseConnectionString = process.env.DATABASE_URI || '';
  
  // Skip if no connection string is defined
  if (!baseConnectionString) return '';
  
  // Determine if we're in a development environment
  const isDevelopment = 
    process.env.NODE_ENV === 'development' || 
    !process.env.NODE_ENV;
  
  // In development, use direct connections with no pooling for simplicity
  if (isDevelopment) {
    return optimizeNeonConnectionString(baseConnectionString);
  }
  
  // In production environments, rely on connection pooling
  try {
    const url = new URL(baseConnectionString);
    
    // Check if this is a Neon database URL
    if (url.hostname.includes('neon.tech')) {
      // Add production-optimized parameters
      if (!url.searchParams.has('pgbouncer')) {
        url.searchParams.set('pgbouncer', 'true');
      }
      
      if (!url.searchParams.has('connect_timeout')) {
        url.searchParams.set('connect_timeout', '15');
      }
    }
    
    return url.toString();
  } catch (err) {
    console.warn('Error setting up production Neon connection:', err);
    return baseConnectionString;
  }
}
