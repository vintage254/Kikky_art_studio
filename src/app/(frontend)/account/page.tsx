'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { Gutter } from '@/components/ui/Gutter';

// Default account page redirects to the cart section
export default function AccountPage() {
  const router = useRouter();
  
  useEffect(() => {
    // Redirect to the cart page by default
    router.push('/account/cart');
  }, [router]);
  
  return (
    <Gutter>
      <div className="flex items-center justify-center py-12">
        <div className="animate-pulse">Redirecting to your account...</div>
      </div>
    </Gutter>
  );
}
