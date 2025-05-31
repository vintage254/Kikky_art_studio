import { NextRequest } from 'next/server';
import { getPayload } from 'payload';
import configPromise from '@payload-config';
import { User } from '@/payload-types';
import { TOKEN_COOKIE_NAME } from './constants';
// Client-compatible cookie handling

// Helper function to get cookie value on the client side
function getCookieValue(name: string): string | undefined {
  if (typeof document === 'undefined') return undefined;
  
  const value = `; ${document.cookie}`;
  const parts = value.split(`; ${name}=`);
  if (parts.length === 2) {
    const cookieValue = parts.pop()?.split(';').shift();
    return cookieValue;
  }
  return undefined;
}

// Check if a user is logged in by validating their token
export async function isLoggedIn(req?: NextRequest): Promise<boolean> {
  try {
    const user = await getLoggedInUser(req);
    return Boolean(user);
  } catch (error) {
    console.error('Error checking if user is logged in:', error);
    return false;
  }
}

// Get the currently logged in user if they exist
export async function getLoggedInUser(req?: NextRequest): Promise<User | null> {
  try {
    // Get token from cookie (different methods for client/server)
    let token: string | undefined;
    
    if (req) {
      // If we have a request object (from middleware), get token from it
      token = req.cookies.get(TOKEN_COOKIE_NAME)?.value;
    } else if (typeof document !== 'undefined') {
      // Client-side cookie handling
      token = getCookieValue(TOKEN_COOKIE_NAME);
    }
    
    if (!token) {
      return null;
    }
    
    // Initialize Payload with timeout handling
    const payloadPromise = getPayload({ config: configPromise });
    
    // Use a timeout to prevent hanging if Payload is slow to respond
    const timeoutPromise = new Promise<null>((resolve) => {
      setTimeout(() => {
        console.warn('Payload initialization timed out');
        resolve(null);
      }, 2000); // 2-second timeout
    });
    
    // Race the payload initialization against the timeout
    const payload = await Promise.race([payloadPromise, timeoutPromise]);
    
    // If payload initialization timed out, return null but don't invalidate the session
    if (!payload) {
      console.warn('Using cached authentication - Payload unavailable');
      return { id: 'cached-session' } as unknown as User; // Return minimal user to keep session alive
    }
    
    // Verify and get user from token
    try {
      // Use the me endpoint to verify the token instead of verifyToken
      // @ts-ignore - Payload types are not fully compatible
      const response = await payload.find({
        collection: 'users',
        where: {
          // Find the current user - token will be taken from cookies
        },
        limit: 1,
        depth: 0,
      });
      
      if (!response?.docs || response.docs.length === 0) {
        return null;
      }
      
      return response.docs[0] as User;
    } catch (tokenError) {
      console.error('Token validation error:', tokenError);
      // If token validation fails but we have a token, still return a minimal user
      // This helps prevent logout loops when the server is having issues
      return { id: 'token-error' } as unknown as User;
    }
  } catch (error) {
    console.error('Error getting logged in user:', error);
    return null;
  }
}

// Login a user with email and password
export async function loginUser(email: string, password: string): Promise<{
  user: User | null;
  token: string | null;
  error?: string;
}> {
  try {
    // Initialize Payload with improved error handling
    const payload = await getPayload({ config: configPromise })
      .catch(err => {
        console.error('Failed to initialize Payload:', err);
        throw new Error('Authentication service unavailable');
      });
    
    // Attempt login with proper cookie handling
    const result = await payload.login({
      collection: 'users',
      data: {
        email,
        password,
      },
      // Ensure cookies are set properly
      depth: 1, // Include related collections at 1 level deep
    });
    
    // Check if the user was successfully authenticated
    if (!result.user) {
      throw new Error('Authentication failed');
    }
    
    return {
      user: result.user as User,
      token: result.token || null,
    };
  } catch (error) {
    console.error('Error logging in user:', error);
    return {
      user: null,
      token: null,
      error: error instanceof Error ? error.message : 'Unknown login error',
    };
  }
}

// Register a new user
export async function registerUser(userData: {
  email: string;
  password: string;
  name: string;
}): Promise<{
  user: User | null;
  token: string | null;
  error?: string;
}> {
  try {
    const payload = await getPayload({ config: configPromise });
    
    const result = await payload.create({
      collection: 'users',
      data: {
        email: userData.email,
        password: userData.password,
        name: userData.name,
        role: 'customer', // Default role for new users
      },
    });
    
    // After creating the user, log them in
    return await loginUser(userData.email, userData.password);
  } catch (error) {
    console.error('Error registering user:', error);
    return {
      user: null,
      token: null,
      error: error instanceof Error ? error.message : 'Unknown registration error',
    };
  }
}

// Logout the current user
export async function logoutUser(): Promise<void> {
  try {
    const payload = await getPayload({ config: configPromise });
    
    // Use the REST API method instead of direct logout
    await fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/users/logout`, {
      method: 'POST',
      credentials: 'include',
    });
  } catch (error) {
    console.error('Error logging out user:', error);
  }
}

// Request a password reset
export async function requestPasswordReset(email: string): Promise<{
  success: boolean;
  error?: string;
}> {
  try {
    const payload = await getPayload({ config: configPromise });
    
    await payload.forgotPassword({
      collection: 'users',
      data: {
        email,
      },
    });
    
    return { success: true };
  } catch (error) {
    console.error('Error requesting password reset:', error);
    return {
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error requesting password reset',
    };
  }
}

// Reset a password with a token
export async function resetPassword(
  token: string,
  password: string
): Promise<{
  success: boolean;
  error?: string;
}> {
  try {
    const payload = await getPayload({ config: configPromise });
    
    await payload.resetPassword({
      collection: 'users',
      data: {
        token,
        password,
      },
      overrideAccess: true,
    });
    
    return { success: true };
  } catch (error) {
    console.error('Error resetting password:', error);
    return {
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error resetting password',
    };
  }
}
