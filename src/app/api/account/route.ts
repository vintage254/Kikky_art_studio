import { NextRequest, NextResponse } from 'next/server';
import { getPayload } from 'payload';
import configPromise from '@payload-config';
import { getLoggedInUser } from '@/utilities/auth/server';

export async function GET(request: NextRequest) {
  try {
    // Initialize Payload
    const payload = await getPayload({ config: configPromise });
    
    // Get the currently logged in user
    const user = await getLoggedInUser();
    
    if (!user) {
      return NextResponse.json(
        { error: 'Not authenticated' },
        { status: 401 }
      );
    }
    
    // Return the user information
    return NextResponse.json(user);
  } catch (error) {
    console.error('Error fetching user account data:', error);
    return NextResponse.json(
      { error: 'Failed to fetch account data' },
      { status: 500 }
    );
  }
}
