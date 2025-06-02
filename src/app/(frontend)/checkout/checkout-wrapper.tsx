'use client';

import React from 'react';
import dynamic from 'next/dynamic';

// Dynamically import the client component with SSR disabled in a client component wrapper
const CheckoutContent = dynamic(() => import('./CheckoutContent'), {
  ssr: false,
  loading: () => (
    <div className="text-center py-12 animate-pulse">
      Loading checkout...
    </div>
  )
});

/**
 * Checkout Client Wrapper
 * This is a client component that imports the main client component with SSR disabled
 * ensuring CartProvider context is properly initialized
 */
export default function CheckoutWrapper() {
  return <CheckoutContent />;
}
