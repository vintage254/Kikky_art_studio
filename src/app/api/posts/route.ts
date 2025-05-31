import { NextRequest, NextResponse } from 'next/server';
import { getPayload } from 'payload';
import configPromise from '@payload-config';

export async function GET(request: NextRequest) {
  try {
    // Initialize Payload
    const payload = await getPayload({ config: configPromise });
    
    // Get query parameters
    const { searchParams } = new URL(request.url);
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '10');
    const category = searchParams.get('category');
    const slug = searchParams.get('slug');
    
    // For single post fetch by slug
    if (slug) {
      const post = await payload.find({
        collection: 'posts',
        where: {
          _status: {
            equals: 'published',
          },
          slug: {
            equals: slug,
          },
        },
        depth: 1,
        limit: 1,
      });
      
      if (post.docs.length === 0) {
        return NextResponse.json(
          { error: 'Post not found' },
          { status: 404 }
        );
      }
      
      return NextResponse.json(post.docs[0]);
    }
    
    // Build query conditions for multiple posts
    const where: any = {
      _status: {
        equals: 'published',
      },
    };
    
    // Add category filter if provided
    if (category) {
      where.categories = {
        in: [category],
      };
    }
    
    // Fetch posts from database
    const posts = await payload.find({
      collection: 'posts',
      where,
      limit,
      page,
      sort: '-publishedAt',
      depth: 1,
    });
    
    // Return the posts
    return NextResponse.json(posts);
  } catch (error) {
    console.error('Error fetching posts:', error);
    return NextResponse.json(
      { error: 'Failed to fetch posts' },
      { status: 500 }
    );
  }
}
