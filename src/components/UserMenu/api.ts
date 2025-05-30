'use client';

import type { User } from '@/payload-types';

// API utilities for the UserMenu component
export async function getUserData(): Promise<User | null> {
  try {
    // Get the server URL from the environment or fallback to the current origin
    const serverUrl = typeof window !== 'undefined' 
      ? process.env.NEXT_PUBLIC_SERVER_URL || window.location.origin
      : '';
      
    // If we're not in a browser environment, return null
    if (!serverUrl) return null;
    
    const response = await fetch(`${serverUrl}/api/users/me`, {
      method: 'GET',
      credentials: 'include',
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
    console.error('Error fetching user data:', error);
    return null;
  }
}

export async function logout(): Promise<boolean> {
  try {
    // Get the server URL from the environment or fallback to the current origin
    const serverUrl = typeof window !== 'undefined' 
      ? process.env.NEXT_PUBLIC_SERVER_URL || window.location.origin
      : '';
    
    // If we're not in a browser environment, return false
    if (!serverUrl) return false;
    
    const response = await fetch(`${serverUrl}/api/users/logout`, {
      method: 'POST',
      credentials: 'include',
    });

    if (!response.ok) {
      throw new Error('Logout failed');
    }

    return true;
  } catch (error) {
    console.error('Error logging out:', error);
    return false;
  }
}
