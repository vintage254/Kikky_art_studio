import { Pool, PoolClient } from 'pg';
import { optimizeNeonConnectionString, postgresPoolConfig } from './config';

/**
 * A singleton connection manager for PostgreSQL
 * Handles connection pooling and automatic reconnection
 */
class DatabaseConnectionManager {
  private static instance: DatabaseConnectionManager;
  private pool: Pool | null = null;
  private reconnecting = false;
  private connectionString: string;
  
  private constructor() {
    // Get connection string from environment
    this.connectionString = process.env.DATABASE_URI || '';
    
    // Optimize connection string for Neon if needed
    if (this.connectionString.includes('neon.tech')) {
      this.connectionString = optimizeNeonConnectionString(this.connectionString);
    }
    
    // Initialize the connection pool
    this.initPool();
  }
  
  /**
   * Get the singleton instance
   */
  public static getInstance(): DatabaseConnectionManager {
    if (!DatabaseConnectionManager.instance) {
      DatabaseConnectionManager.instance = new DatabaseConnectionManager();
    }
    
    return DatabaseConnectionManager.instance;
  }
  
  /**
   * Initialize the connection pool
   */
  private initPool(): void {
    try {
      this.pool = new Pool({
        connectionString: this.connectionString,
        ...postgresPoolConfig,
      });
      
      // Handle errors at the pool level
      this.pool.on('error', (err: Error) => {
        console.warn('Unexpected error on idle client', err.message);
        if (!this.reconnecting) {
          this.handleConnectionError();
        }
      });
      
      console.log('Database connection pool initialized');
    } catch (error) {
      console.error('Failed to initialize connection pool:', error);
      // Try to reconnect
      this.handleConnectionError();
    }
  }
  
  /**
   * Handle connection errors and attempt reconnection
   */
  private handleConnectionError(): void {
    if (this.reconnecting) return;
    
    this.reconnecting = true;
    console.log('Attempting to reconnect to database...');
    
    // Close the current pool if it exists
    if (this.pool) {
      this.pool.end()
        .catch((err: Error) => console.error('Error closing pool:', err))
        .finally(() => {
          // Create a new pool after a delay
          setTimeout(() => {
            this.initPool();
            this.reconnecting = false;
          }, 5000); // Wait 5 seconds before reconnecting
        });
    } else {
      // If there's no pool, try to create one after a delay
      setTimeout(() => {
        this.initPool();
        this.reconnecting = false;
      }, 5000);
    }
  }
  
  /**
   * Get a client from the pool
   */
  public async getClient(): Promise<PoolClient> {
    if (!this.pool) {
      this.initPool();
    }
    
    if (!this.pool) {
      throw new Error('Failed to initialize database connection pool');
    }
    
    try {
      return await this.pool.connect();
    } catch (error) {
      console.error('Failed to get client from pool:', error);
      this.handleConnectionError();
      throw error;
    }
  }
  
  /**
   * Execute a query with automatic reconnection
   */
  public async query<T = any>(text: string, params: any[] = []): Promise<T[]> {
    if (!this.pool) {
      this.initPool();
    }
    
    if (!this.pool) {
      throw new Error('Failed to initialize database connection pool');
    }
    
    try {
      const result = await this.pool.query(text, params);
      return result.rows as T[];
    } catch (error) {
      console.error('Query error:', error);
      
      // Check if it's a connection error
      if (error instanceof Error && 
          (error.message.includes('connection') || 
           error.message.includes('timeout') ||
           error.message.includes('terminated'))) {
        this.handleConnectionError();
      }
      
      throw error;
    }
  }
  
  /**
   * Close the connection pool
   */
  public async close(): Promise<void> {
    if (this.pool) {
      await this.pool.end();
      this.pool = null;
    }
  }
}

// Export the singleton instance
export const dbConnectionManager = DatabaseConnectionManager.getInstance();

// Export a helper function to get a connection
export async function getDbConnection(): Promise<PoolClient> {
  return dbConnectionManager.getClient();
}

// Export a helper function to execute a query
export async function executeQuery<T = any>(text: string, params: any[] = []): Promise<T[]> {
  return dbConnectionManager.query<T>(text, params);
}
