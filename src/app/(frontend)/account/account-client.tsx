'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';

/**
 * Account Client Component
 * 
 * Handles client-side redirection to the cart page.
 * This separates the client-side logic (with hooks) from the server component.
 */
export default function AccountClient() {
  const router = useRouter();
  
  useEffect(() => {
    // Redirect to the cart page by default
    router.push('/account/cart');
  }, [router]);
  
  return (
    <div className="animate-pulse">Redirecting to your account...</div>
  );
}
