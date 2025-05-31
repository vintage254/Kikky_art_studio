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
    
    // Fetch the category by slug
    const categoryData = await payload.find({
      collection: 'categories',
      where: {
        slug: {
          equals: slug,
        },
      },
      limit: 1,
      depth: 1,
    });

    const category = categoryData.docs?.[0];
    
    if (!category) {
      return NextResponse.json(
        { error: 'Category not found' },
        { status: 404 }
      );
    }
    
    // Return the category data
    return NextResponse.json(category);
  } catch (error) {
    console.error(`Error fetching category with slug ${params.slug}:`, error);
    return NextResponse.json(
      { error: 'Failed to fetch category data' },
      { status: 500 }
    );
  }
}
