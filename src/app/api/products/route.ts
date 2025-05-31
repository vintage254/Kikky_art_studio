import { NextRequest, NextResponse } from 'next/server';
import { getPayload } from 'payload';
import configPromise from '@payload-config';

export async function GET(request: NextRequest) {
  try {
    // Initialize Payload
    const payload = await getPayload({ config: configPromise });
    
    // Get query parameters
    const { searchParams } = new URL(request.url);
    const featured = searchParams.get('featured') === 'true';
    const category = searchParams.get('category');
    const limit = parseInt(searchParams.get('limit') || '10');
    const page = parseInt(searchParams.get('page') || '1');
    
    // Build query conditions
    const where: any = {
      _status: {
        equals: 'published',
      },
    };
    
    // Add featured filter if requested
    if (featured) {
      where.featured = {
        equals: true,
      };
    }
    
    // Add category filter if provided
    if (category) {
      where.category = {
        equals: category,
      };
    }
    
    // Fetch products from database
    const products = await payload.find({
      collection: 'products',
      where,
      limit,
      page,
      sort: '-createdAt',
      depth: 2, // Include related data like categories
    });
    
    // Return the products
    return NextResponse.json(products);
  } catch (error) {
    console.error('Error fetching products:', error);
    return NextResponse.json(
      { error: 'Failed to fetch products' },
      { status: 500 }
    );
  }
}
