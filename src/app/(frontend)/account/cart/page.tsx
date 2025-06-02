import React, { Suspense } from 'react';
import { Gutter } from '@/components/ui/Gutter';

// Import the client component
import CartClient from './cart-client';

/**
 * Cart Page (Server Component)
 * 
 * This server component provides the layout and wraps the client component
 * in a Suspense boundary to properly handle React hooks used in the cart.
 */
export default function CartPage() {
  return (
    <Gutter className="py-10">
      <div className="container mx-auto">
        <Suspense fallback={<div className="text-center py-8">Loading cart...</div>}>
          <CartClient />
        </Suspense>
      </div>
    </Gutter>
  );
}
