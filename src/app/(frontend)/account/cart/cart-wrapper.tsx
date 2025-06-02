'use client';

import React from 'react';
import dynamic from 'next/dynamic';

// Dynamically import the client component with SSR disabled in a client component wrapper
const CartClient = dynamic(() => import('./cart-client'), {
  ssr: false,
  loading: () => (
    <div className="text-center py-8 animate-pulse">
      Loading cart...
    </div>
  )
});

/**
 * Cart Client Wrapper
 * This is a client component that imports the main client component with SSR disabled
 * ensuring CartProvider context is properly initialized
 */
export default function CartWrapper() {
  return <CartClient />;
}
