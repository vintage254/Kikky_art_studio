import { postgresAdapter, PostgresAdapter } from '@payloadcms/db-postgres';
import { getPoolerConnectionString } from './direct-client';

/**
 * Creates a PostgreSQL adapter with enhanced reconnection capabilities for Neon
 * 
 * This wrapper adds additional error handling and reconnection logic
 * specifically optimized for serverless environments and Neon database
 */
export const createEnhancedPostgresAdapter = (): PostgresAdapter => {
  // Get the connection string and convert to use Neon pooler endpoint
  const connectionString = process.env.DATABASE_URI || '';
  const poolerConnectionString = getPoolerConnectionString(connectionString);
  
  // Create base adapter with improved configuration
  const adapter = postgresAdapter({
    pool: {
      connectionString: poolerConnectionString,
      max: parseInt(process.env.DATABASE_POOL_MAX || '10', 10),
      idleTimeoutMillis: parseInt(process.env.DATABASE_IDLE_TIMEOUT_MS || '10000', 10),
      connectionTimeoutMillis: parseInt(process.env.DATABASE_CONNECTION_TIMEOUT_MS || '5000', 10),
      allowExitOnIdle: false,
    },
  });
  
  // Override the find method to add reconnection capabilities
  const originalFind = adapter.find;
  adapter.find = async function enhancedFind(...args: Parameters<typeof originalFind>) {
    try {
      return await originalFind.apply(this, args);
    } catch (error) {
      console.error('Database find error:', error);
      if (isConnectionError(error)) {
        console.log('Attempting to reconnect and retry...');
        // Small delay before retry
        await new Promise(resolve => setTimeout(resolve, 1000));
        try {
          return await originalFind.apply(this, args);
        } catch (retryError) {
          console.error('Retry failed:', retryError);
          throw retryError;
        }
      }
      throw error;
    }
  };
  
  // Override the findGlobal method to add reconnection capabilities
  const originalFindGlobal = adapter.findGlobal;
  adapter.findGlobal = async function enhancedFindGlobal(...args: Parameters<typeof originalFindGlobal>) {
    try {
      return await originalFindGlobal.apply(this, args);
    } catch (error) {
      console.error('Database findGlobal error:', error);
      if (isConnectionError(error)) {
        console.log('Attempting to reconnect and retry...');
        // Small delay before retry
        await new Promise(resolve => setTimeout(resolve, 1000));
        try {
          return await originalFindGlobal.apply(this, args);
        } catch (retryError) {
          console.error('Retry failed:', retryError);
          throw retryError;
        }
      }
      throw error;
    }
  };
  
  // Add similar wrappers for other database operations
  // Create enhanced versions of other methods
  ['create', 'update', 'delete', 'findVersions', 'findGlobalVersions'].forEach((method) => {
    const original = adapter[method as keyof typeof adapter] as Function;
    if (typeof original === 'function') {
      adapter[method as keyof typeof adapter] = async function enhanced(...args: any[]) {
        try {
          return await original.apply(this, args);
        } catch (error) {
          console.error(`Database ${method} error:`, error);
          if (isConnectionError(error)) {
            console.log('Attempting to reconnect and retry...');
            // Small delay before retry
            await new Promise(resolve => setTimeout(resolve, 1000));
            try {
              return await original.apply(this, args);
            } catch (retryError) {
              console.error('Retry failed:', retryError);
              throw retryError;
            }
          }
          throw error;
        }
      } as any;
    }
  });
  
  return adapter;
};

/**
 * Helper function to determine if an error is a connection error
 */
function isConnectionError(error: unknown): boolean {
  if (!error) return false;
  
  // Check if it's an Error object with a message
  if (error instanceof Error) {
    const errorMessage = error.message.toLowerCase();
    const connectionErrorKeywords = [
      'connection', 
      'timeout', 
      'terminated', 
      'connect', 
      'socket',
      'econnrefused',
      'network',
      'offline',
      'unreachable'
    ];
    
    return connectionErrorKeywords.some(keyword => errorMessage.includes(keyword));
  }
  
  return false;
}
