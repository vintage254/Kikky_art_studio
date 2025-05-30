/**
 * PG Default Export Adapter for Vercel
 * 
 * This simple adapter ensures @payloadcms/db-postgres has access to a default export
 * from the pg module when running on Vercel.
 */

// Import from @neondatabase/serverless which we've already set up
import * as pg from '@neondatabase/serverless';

// Create a default export object that matches what @payloadcms/db-postgres expects
const defaultExport = { ...pg };

// Export both named exports and a default export
export default defaultExport;
export const Pool = pg.Pool;
export const Client = pg.Client;
