import { NextResponse } from 'next/server';
import { TOKEN_COOKIE_NAME } from '@/utilities/auth/constants';

export async function POST() {
  try {
    // Create a response
    const response = NextResponse.json({ success: true });
    
    // Delete the auth cookie
    response.cookies.delete(TOKEN_COOKIE_NAME);
    
    return response;
  } catch (error) {
    console.error('Error during logout:', error);
    return NextResponse.json(
      { error: 'An unexpected error occurred' },
      { status: 500 }
    );
  }
}
