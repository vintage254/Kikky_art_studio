# Neon PostgreSQL Optimization for Payload CMS

This document outlines the optimizations made to ensure Payload CMS works correctly with Neon PostgreSQL, addressing common issues like idle-in-transaction timeouts and connection handling.

## Key Issues Fixed

1. **Database Adapter Configuration Mismatch**: The application was incorrectly configured to use MongoDB while actually connecting to PostgreSQL.

2. **Idle-in-Transaction Timeouts**: Neon PostgreSQL automatically suspends connections after 5 minutes of inactivity, causing "Connection terminated unexpectedly" errors.

3. **Connection Pool Settings**: Suboptimal connection pool settings were leading to resource waste and potential connection issues.

4. **Transaction Handling**: Poor transaction handling was causing queries to remain in "idle in transaction" state.

## Database Configuration Changes

### 1. Updated PostgreSQL Adapter Configuration

We updated the Payload CMS configuration in `src/payload/payload.config.ts` to use the PostgreSQL adapter with optimized settings:

```typescript
db: postgresAdapter({
  pool: {
    connectionString: process.env.DATABASE_URI,
    // Optimized settings for Neon PostgreSQL
    max: 2, // Reduced max connections to prevent connection exhaustion
    min: 0, // Allow pool to fully drain to zero when not in use
    idleTimeoutMillis: 30000, // 30 second idle timeout to release connections faster
    connectionTimeoutMillis: 30000, // 30 second connection timeout for cold starts
    ssl: {
      rejectUnauthorized: false // Required for Neon connections
    },
    // Set statement timeout to prevent idle-in-transaction issues
    statement_timeout: 60000, // 1 minute statement timeout
    query_timeout: 60000, // 1 minute query timeout
    // Add connection error handling
    allowExitOnIdle: true
  },
}),
```

### 2. Database Parameter Optimizations

Created a script to configure PostgreSQL database parameters (`set-transaction-timeout.js`):

```javascript
// Key parameters set:
// - idle_in_transaction_session_timeout = 600000 (10 minutes)
// - statement_timeout = 120000 (2 minutes)
// - lock_timeout = 30000 (30 seconds)
// - work_mem = 4MB
```

### 3. Package Dependencies

Updated `package.json` to:
- Remove MongoDB dependencies 
- Add PostgreSQL dependencies
- Add proper TypeScript types for PostgreSQL
- Add a script to run the transaction timeout configuration

### 4. Docker Configuration

Updated Docker configuration to use PostgreSQL instead of MongoDB:

```yaml
services:
  postgres:
    image: postgres:15-alpine
    ports:
      - '5432:5432'
    environment:
      POSTGRES_DB: payload
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
```

## Client-Side Optimizations

### 1. Connection Monitoring Tool

Created a `monitor-connections.js` script to help debug connection issues:
- Monitors active connections
- Shows connection state and duration
- Identifies risky connections (long-running transactions)
- Displays connection pool statistics

### 2. Robust Connection Testing

Implemented a comprehensive connection testing tool (`test-neon-connection.js`) that:
- Tests connection with optimal settings
- Checks database information and configuration
- Validates transaction timeout settings
- Provides detailed error handling with diagnostic information

## Best Practices Implemented

1. **Proper Connection Pooling**:
   - Limited pool size to prevent resource exhaustion
   - Configured idle timeout to release connections
   - Implemented error handling for dropped connections

2. **Transaction Management**:
   - Set appropriate timeouts to prevent idle-in-transaction issues
   - Configured statement and query timeouts

3. **Error Handling**:
   - Added robust error handling for connection failures
   - Implemented pool-level error handling to prevent application crashes

4. **Resource Optimization**:
   - Configured pool to scale to zero when not in use
   - Set proper work memory allocation

## Recommended Next Steps

1. **Application Level Changes**:
   - Implement connection retry logic in your application
   - Add error boundaries around database operations
   - Consider implementing a circuit breaker pattern for database operations

2. **Monitoring**:
   - Use the provided monitoring tools to track connection usage
   - Set up alerts for connection pool exhaustion
   - Monitor for long-running transactions

3. **Scale to Zero Considerations**:
   - Be aware of cold start times when Neon scales to zero
   - Implement appropriate UI feedback for users during cold starts
   - Consider keeping critical endpoints warm

By implementing these optimizations, your Payload CMS application should now properly handle connections to Neon PostgreSQL, including the auto-scaling behavior and connection management specific to Neon's serverless architecture. 