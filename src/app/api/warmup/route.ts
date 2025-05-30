import { NextResponse } from 'next/server';
import { Client } from 'pg';

/**
 * This endpoint exists solely to warm up the application 
 * to prevent cold starts on Vercel
 * 
 * It is pinged periodically by Cron-job.org
 */
export async function GET() {
  try {
    // Create a lightweight database connection test
    const client = new Client({ 
      connectionString: process.env.DATABASE_URI,
      connectionTimeoutMillis: 5000,
    });
    
    await client.connect();
    const result = await client.query('SELECT NOW() as time');
    await client.end();
    
    return NextResponse.json({ 
      status: 'ok', 
      timestamp: new Date().toISOString(),
      dbTime: result.rows[0].time
    });
  } catch (error) {
    console.error('Warmup error:', error);
    return NextResponse.json({ 
      status: 'error', 
      message: error instanceof Error ? error.message : 'Unknown error'
    }, { status: 500 });
  }
}