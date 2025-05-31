import { NextRequest, NextResponse } from 'next/server';
import { getPayload } from 'payload';
import configPromise from '@payload-config';

export async function GET(request: NextRequest) {
  try {
    // Initialize Payload
    const payload = await getPayload({ config: configPromise });
    
    // Get query parameters
    const { searchParams } = new URL(request.url);
    const slug = searchParams.get('slug');
    const limit = parseInt(searchParams.get('limit') || '10');
    const depth = parseInt(searchParams.get('depth') || '0');
    
    // Build query conditions
    const where: any = {};
    
    // Add slug filter if provided
    if (slug) {
      where.slug = {
        equals: slug,
      };
    }
    
    // Fetch pages from database
    const pages = await payload.find({
      collection: 'pages',
      where,
      limit,
      depth,
    });
    
    // Return the pages
    return NextResponse.json(pages);
  } catch (error) {
    console.error('Error fetching pages:', error);
    return NextResponse.json(
      { error: 'Failed to fetch pages' },
      { status: 500 }
    );
  }
}
