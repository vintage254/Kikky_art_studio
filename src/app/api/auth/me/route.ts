import { NextRequest, NextResponse } from 'next/server';
import { getPayload } from 'payload';
import configPromise from '@payload-config';
import { TOKEN_COOKIE_NAME } from '@/utilities/auth/constants';

export async function GET(request: NextRequest) {
  try {
    // Get the token from cookies
    const token = request.cookies.get(TOKEN_COOKIE_NAME)?.value;
    
    if (!token) {
      return NextResponse.json({ user: null }, { status: 401 });
    }

    // Initialize Payload
    const payload = await getPayload({ config: configPromise });
    
    try {
      // Verify the token and get the user
      const { user } = await payload.verifyToken({
        collection: 'users',
        token,
      });
      
      if (!user) {
        return NextResponse.json({ user: null }, { status: 401 });
      }
      
      return NextResponse.json({ user }, { status: 200 });
    } catch (tokenError) {
      console.error('Token verification error:', tokenError);
      
      // Clear the invalid token cookie
      const response = NextResponse.json({ user: null }, { status: 401 });
      response.cookies.delete(TOKEN_COOKIE_NAME);
      
      return response;
    }
  } catch (error) {
    console.error('Server error fetching user:', error);
    return NextResponse.json(
      { error: 'An unexpected error occurred' },
      { status: 500 }
    );
  }
}
