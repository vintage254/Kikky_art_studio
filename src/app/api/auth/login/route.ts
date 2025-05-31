import { NextRequest, NextResponse } from 'next/server';
import { getPayload } from 'payload';
import configPromise from '@payload-config';
import { TOKEN_COOKIE_NAME } from '@/utilities/auth/constants';

export async function POST(request: NextRequest) {
  try {
    // Get credentials from request body
    const { email, password } = await request.json();

    if (!email || !password) {
      return NextResponse.json(
        { error: 'Email and password are required' },
        { status: 400 }
      );
    }

    // Initialize Payload
    const payload = await getPayload({ config: configPromise });

    // Attempt to login
    try {
      const result = await payload.login({
        collection: 'users',
        data: {
          email,
          password,
        },
      });

      // Create response with cookie
      const response = NextResponse.json({
        user: result.user,
        token: result.token,
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
    } catch (loginError) {
      console.error('Login error:', loginError);
      return NextResponse.json(
        { error: 'Invalid email or password' },
        { status: 401 }
      );
    }
  } catch (error) {
    console.error('Server error during login:', error);
    return NextResponse.json(
      { error: 'An unexpected error occurred' },
      { status: 500 }
    );
  }
}
