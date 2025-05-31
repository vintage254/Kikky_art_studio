import { NextRequest, NextResponse } from 'next/server';
import { getPayload } from 'payload';
import configPromise from '@payload-config';
import { TOKEN_COOKIE_NAME } from '@/utilities/auth/constants';

export async function POST(request: NextRequest) {
  try {
    // Get the token and new password from the request body
    const { token, password } = await request.json();

    if (!token || !password) {
      return NextResponse.json(
        { error: 'Token and password are required' },
        { status: 400 }
      );
    }

    // Initialize Payload
    const payload = await getPayload({ config: configPromise });

    try {
      // Reset the password
      const result = await payload.resetPassword({
        collection: 'users',
        data: {
          token,
          password,
        },
      });

      // Create response with cookie
      const response = NextResponse.json({
        user: result.user,
        token: result.token,
        success: true,
      });

      // Set authentication cookie
      response.cookies.set({
        name: TOKEN_COOKIE_NAME,
        value: result.token,
        httpOnly: true,
        secure: process.env.NODE_ENV === 'production',
        sameSite: 'lax',
        path: '/',
        // Expire in 2 weeks
        maxAge: 60 * 60 * 24 * 14,
      });

      return response;
    } catch (resetError) {
      console.error('Error resetting password:', resetError);
      return NextResponse.json(
        { error: 'Invalid or expired token', success: false },
        { status: 400 }
      );
    }
  } catch (error) {
    console.error('Server error during password reset:', error);
    return NextResponse.json(
      { error: 'An unexpected error occurred', success: false },
      { status: 500 }
    );
  }
}
