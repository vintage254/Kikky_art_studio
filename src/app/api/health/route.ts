import { NextResponse } from 'next/server'

// Simple health check endpoint
export async function GET(): Promise<NextResponse> {
  return NextResponse.json({
    status: 'ok',
    message: 'Service is healthy',
    timestamp: new Date().toISOString()
  })
} 