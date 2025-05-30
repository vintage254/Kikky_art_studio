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
      
    const response = await fetch(`${serverUrl}/api/users/me`, {
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
    
    const response = await fetch(`${serverUrl}/api/users/logout`, {
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
