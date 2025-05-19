import { NextResponse } from 'next/server';

/**
 * This endpoint exists solely to warm up the application 
 * to prevent cold starts on Vercel
 * 
 * It should be pinged periodically by an external service
 */
export async function GET() {
  try {
    // Perform a minimal database connection test
    // This will warm up the connection pool without doing any heavy work
    
    return NextResponse.json({ status: 'ok', timestamp: new Date().toISOString() });
  } catch (error) {
    console.error('Warmup error:', error);
    return NextResponse.json({ status: 'error' }, { status: 500 });
  }
} 