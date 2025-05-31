import { NextRequest, NextResponse } from 'next/server';
import { getPayload } from 'payload';
import configPromise from '@payload-config';
import { TOKEN_COOKIE_NAME } from '@/utilities/auth/constants';

export async function POST(request: NextRequest) {
  try {
    // Get user data from request body
    const { email, password, name } = await request.json();

    if (!email || !password || !name) {
      return NextResponse.json(
        { error: 'Name, email, and password are required' },
        { status: 400 }
      );
    }

    // Initialize Payload
    const payload = await getPayload({ config: configPromise });

    try {
      // Create the user
      const user = await payload.create({
        collection: 'users',
        data: {
          email,
          password,
          name,
        },
      });

      // Login the user after successful registration
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
    } catch (registerError: any) {
      console.error('Registration error:', registerError);
      
      // Handle duplicate email error
      if (registerError.message && registerError.message.includes('duplicate')) {
        return NextResponse.json(
          { error: 'A user with this email already exists' },
          { status: 409 }
        );
      }

      return NextResponse.json(
        { error: registerError.message || 'Failed to register user' },
        { status: 400 }
      );
    }
  } catch (error) {
    console.error('Server error during registration:', error);
    return NextResponse.json(
      { error: 'An unexpected error occurred' },
      { status: 500 }
    );
  }
}
