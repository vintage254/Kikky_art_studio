// Import only the User type definition
import type { User } from '@/payload-types';

// Client-side version of auth utilities
export const TOKEN_COOKIE_NAME = 'payload-token';

// Get the currently logged in user using the /me endpoint
export async function getLoggedInUser(): Promise<User | null> {
  try {
    // Get the server URL from the environment or fallback to the current origin
    const serverUrl = typeof window !== 'undefined' 
      ? process.env.NEXT_PUBLIC_SERVER_URL || window.location.origin
      : process.env.NEXT_PUBLIC_SERVER_URL;
      
    const response = await fetch(`${serverUrl}/api/auth/me`, {
      method: 'GET',
      credentials: 'include', // Important for cookie handling
      headers: {
        'Content-Type': 'application/json',
      },
    });

    if (!response.ok) {
      return null;
    }

    const data = await response.json();
    return data.user || null;
  } catch (error) {
    console.error('Error getting logged in user:', error);
    return null;
  }
}

// Logout the current user - client-side version
export async function logoutUser(): Promise<boolean> {
  try {
    // Get the server URL from the environment or fallback to the current origin
    const serverUrl = typeof window !== 'undefined' 
      ? process.env.NEXT_PUBLIC_SERVER_URL || window.location.origin
      : process.env.NEXT_PUBLIC_SERVER_URL;
    
    const response = await fetch(`${serverUrl}/api/auth/logout`, {
      method: 'POST',
      credentials: 'include', // Important for cookie handling
    });

    if (!response.ok) {
      throw new Error('Logout failed');
    }

    return true;
  } catch (error) {
    console.error('Error logging out user:', error);
    return false;
  }
}

// Login a user with email and password
export async function loginUser(email: string, password: string): Promise<{
  user: User | null;
  token: string | null;
  error?: string;
}> {
  try {
    // Get the server URL from the environment or fallback to the current origin
    const serverUrl = typeof window !== 'undefined' 
      ? process.env.NEXT_PUBLIC_SERVER_URL || window.location.origin
      : process.env.NEXT_PUBLIC_SERVER_URL;

    const response = await fetch(`${serverUrl}/api/auth/login`, {
      method: 'POST',
      credentials: 'include', // Important for cookie handling
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ email, password }),
    });

    const data = await response.json();
    
    if (!response.ok) {
      return {
        user: null,
        token: null,
        error: data.error || 'Login failed',
      };
    }

    return {
      user: data.user || null,
      token: data.token || null,
    };
  } catch (error) {
    console.error('Error logging in user:', error);
    return {
      user: null,
      token: null,
      error: 'An unexpected error occurred',
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
    // Get the server URL from the environment or fallback to the current origin
    const serverUrl = typeof window !== 'undefined' 
      ? process.env.NEXT_PUBLIC_SERVER_URL || window.location.origin
      : process.env.NEXT_PUBLIC_SERVER_URL;
      
    const response = await fetch(`${serverUrl}/api/auth/register`, {
      method: 'POST',
      credentials: 'include', // Important for cookie handling
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(userData),
    });

    const data = await response.json();
    
    if (!response.ok) {
      return {
        user: null,
        token: null,
        error: data.error || 'Registration failed',
      };
    }

    return {
      user: data.user || null,
      token: data.token || null,
    };
  } catch (error) {
    console.error('Error registering user:', error);
    return {
      user: null,
      token: null,
      error: 'An unexpected error occurred',
    };
  }
}

// Request a password reset
export async function requestPasswordReset(email: string): Promise<{
  success: boolean;
  error?: string;
}> {
  try {
    // Get the server URL from the environment or fallback to the current origin
    const serverUrl = typeof window !== 'undefined' 
      ? process.env.NEXT_PUBLIC_SERVER_URL || window.location.origin
      : process.env.NEXT_PUBLIC_SERVER_URL;
      
    const response = await fetch(`${serverUrl}/api/auth/reset-password`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ email }),
    });

    const data = await response.json();
    
    if (!response.ok) {
      return {
        success: false,
        error: data.error || 'Failed to request password reset',
      };
    }

    return {
      success: true,
    };
  } catch (error) {
    console.error('Error requesting password reset:', error);
    return {
      success: false,
      error: 'An unexpected error occurred',
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
    // Get the server URL from the environment or fallback to the current origin
    const serverUrl = typeof window !== 'undefined' 
      ? process.env.NEXT_PUBLIC_SERVER_URL || window.location.origin
      : process.env.NEXT_PUBLIC_SERVER_URL;
      
    const response = await fetch(`${serverUrl}/api/auth/reset-password/complete`, {
      method: 'POST',
      credentials: 'include', // Important for cookie handling
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ token, password }),
    });

    const data = await response.json();
    
    if (!response.ok) {
      return {
        success: false,
        error: data.error || 'Failed to reset password',
      };
    }

    return {
      success: true,
    };
  } catch (error) {
    console.error('Error resetting password:', error);
    return {
      success: false,
      error: 'An unexpected error occurred',
    };
  }
}
