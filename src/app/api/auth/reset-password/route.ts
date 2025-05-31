import { NextRequest, NextResponse } from 'next/server';
import { getPayload } from 'payload';
import configPromise from '@payload-config';

// Request a password reset - sends email
export async function POST(request: NextRequest) {
  try {
    // Get the email from the request body
    const { email } = await request.json();

    if (!email) {
      return NextResponse.json(
        { error: 'Email is required' },
        { status: 400 }
      );
    }

    // Initialize Payload
    const payload = await getPayload({ config: configPromise });

    try {
      // Request password reset
      await payload.forgotPassword({
        collection: 'users',
        data: {
          email,
        },
      });

      // Always return success for security reasons
      // (don't reveal whether email exists or not)
      return NextResponse.json({ success: true });
    } catch (resetError) {
      console.error('Error requesting password reset:', resetError);
      
      // Still return success for security reasons
      return NextResponse.json({ success: true });
    }
  } catch (error) {
    console.error('Server error during password reset request:', error);
    return NextResponse.json(
      { error: 'An unexpected error occurred' },
      { status: 500 }
    );
  }
}
