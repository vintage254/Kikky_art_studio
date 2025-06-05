import { NextRequest, NextResponse } from 'next/server';
import { getPayload, Payload } from 'payload'; 
import configPromise from '@payload-config';

const ALLOWED_ORIGINS: string[] = [
  'http://localhost:3000',
  'http://localhost:3001',
  'https://kikky-art-studio.vercel.app', 
  ...(process.env.NEXT_PUBLIC_SERVER_URL ? [process.env.NEXT_PUBLIC_SERVER_URL] : []),
].filter(Boolean); 

const MAX_LIMIT = 50; 
const MAX_DEPTH = 5;  

export async function GET(request: NextRequest) {
  let payload: Payload;
  const requestOrigin = request.headers.get('origin');
  const corsHeaders: { [key: string]: string } = {};

  if (requestOrigin && ALLOWED_ORIGINS.includes(requestOrigin)) {
    corsHeaders['Access-Control-Allow-Origin'] = requestOrigin;
  }

  try {
    const initTimeout = new Promise((_, reject) => 
      setTimeout(() => reject(new Error('Payload initialization timeout')), 10000)
    );
    
    const initPayload = getPayload({ config: configPromise });
    
    payload = await Promise.race([initPayload, initTimeout]) as Payload;
    
    const { searchParams } = new URL(request.url);
    const slug = searchParams.get('slug');
    
    const parsedLimit = parseInt(searchParams.get('limit') || '10', 10);
    const limit = Math.max(1, Math.min(parsedLimit, MAX_LIMIT));
    
    const parsedDepth = parseInt(searchParams.get('depth') || '0', 10);
    const depth = Math.max(0, Math.min(parsedDepth, MAX_DEPTH));
    
    const where: any = {}; 
    
    if (slug) {
      where.slug = {
        equals: slug,
      };
    }
    
    const queryTimeout = new Promise((_, reject) => 
      setTimeout(() => reject(new Error('Database query timeout')), 8000)
    );
    
    const findPagesPromise = payload.find({
      collection: 'pages',
      where,
      limit,
      depth,
    });
    
    const pagesResult = await Promise.race([findPagesPromise, queryTimeout]);
    
    return NextResponse.json(pagesResult, {
      status: 200,
      headers: {
        ...corsHeaders,
        'Cache-Control': 'public, s-maxage=60, stale-while-revalidate=300',
      },
    });
    
  } catch (error: any) {
    console.error('Error fetching pages:', error);
    
    let errorMessage = 'Failed to fetch pages';
    let errorStatus = 500;

    if (error.message?.includes('timeout')) {
      errorMessage = 'Operation timed out - please try again';
      errorStatus = 504; 
    } else if (error.message?.includes('connect')) {
      errorMessage = 'Unable to connect to the database';
      errorStatus = 503; 
    }
    
    return NextResponse.json(
      { error: errorMessage, details: error.message },
      { status: errorStatus, headers: corsHeaders }
    );
  }
}

export async function OPTIONS(request: NextRequest) {
  const requestOrigin = request.headers.get('origin');
  const headers = new Headers();

  if (requestOrigin && ALLOWED_ORIGINS.includes(requestOrigin)) {
    headers.set('Access-Control-Allow-Origin', requestOrigin);
  }

  headers.set('Access-Control-Allow-Methods', 'GET, OPTIONS');
  headers.set('Access-Control-Allow-Headers', 'Content-Type, Authorization'); 
  headers.set('Access-Control-Max-Age', '86400'); 

  return new NextResponse(null, {
    status: 204, 
    headers,
  });
}
