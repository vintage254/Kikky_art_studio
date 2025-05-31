import { NextRequest, NextResponse } from 'next/server';
import { getPayload } from 'payload';
import configPromise from '@payload-config';

export async function GET(
  request: NextRequest,
  { params }: { params: { slug: string } }
) {
  try {
    const { slug } = params;
    
    // Initialize Payload
    const payload = await getPayload({ config: configPromise });
    
    // Fetch the product by slug
    const productData = await payload.find({
      collection: 'products',
      where: {
        slug: {
          equals: slug,
        },
      },
      limit: 1,
      depth: 2, // Get related data like categories
    });

    const product = productData.docs?.[0];
    
    if (!product) {
      return NextResponse.json(
        { error: 'Product not found' },
        { status: 404 }
      );
    }
    
    // Return the product data
    return NextResponse.json(product);
  } catch (error) {
    console.error(`Error fetching product with slug ${params.slug}:`, error);
    return NextResponse.json(
      { error: 'Failed to fetch product data' },
      { status: 500 }
    );
  }
}
