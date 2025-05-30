import { NextResponse } from 'next/server';
import { revalidateTag, revalidatePath } from 'next/cache';

/**
 * API route for revalidating content by tag or path
 * This provides a compatible way to revalidate cache for 
 * both client and server components
 */
export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const tag = searchParams.get('tag');
  const path = searchParams.get('path');
  const secret = searchParams.get('secret');
  
  // Validate request includes correct secret
  const expectedSecret = process.env.PAYLOAD_SECRET;
  if (secret !== expectedSecret) {
    return NextResponse.json(
      { error: 'Invalid secret' },
      { status: 401 }
    );
  }
  
  // Validate request has at least one parameter to revalidate
  if (!tag && !path) {
    return NextResponse.json(
      { error: 'Missing tag or path parameter' },
      { status: 400 }
    );
  }

  try {
    // Revalidate tag if provided
    if (tag) {
      revalidateTag(tag);
      console.log(`Revalidated tag: ${tag}`);
    }
    
    // Revalidate path if provided
    if (path) {
      revalidatePath(path);
      console.log(`Revalidated path: ${path}`);
    }
    
    return NextResponse.json({
      revalidated: true,
      now: Date.now(),
      tag: tag || undefined,
      path: path || undefined
    });
  } catch (error) {
    console.error('Error revalidating:', error);
    
    return NextResponse.json(
      { 
        error: 'Revalidation failed',
        message: error instanceof Error ? error.message : String(error)
      },
      { status: 500 }
    );
  }
}
