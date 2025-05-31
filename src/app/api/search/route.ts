import { NextRequest, NextResponse } from 'next/server';
import { getPayload } from 'payload';
import configPromise from '@payload-config';

export async function GET(request: NextRequest) {
  try {
    // Initialize Payload
    const payload = await getPayload({ config: configPromise });
    
    // Get query parameters
    const { searchParams } = new URL(request.url);
    const query = searchParams.get('q') || '';
    const limit = parseInt(searchParams.get('limit') || '12');
    const page = parseInt(searchParams.get('page') || '1');
    
    // Define search query
    const searchQuery = query ? {
      where: {
        or: [
          {
            title: {
              like: query,
            },
          },
          {
            'meta.description': {
              like: query,
            },
          },
          {
            'meta.title': {
              like: query,
            },
          },
          {
            keywords: {
              like: query,
            },
          },
        ],
      },
    } : {};
    
    // Fetch search results from database
    const results = await payload.find({
      collection: 'search',
      depth: 1,
      limit,
      page,
      select: {
        title: true,
        slug: true,
        categories: true,
        meta: true,
      },
      pagination: false,
      ...searchQuery
    });
    
    // Return the search results
    return NextResponse.json(results);
  } catch (error) {
    console.error('Error performing search:', error);
    return NextResponse.json(
      { error: 'Failed to perform search' },
      { status: 500 }
    );
  }
}
