'use client';

import React from 'react';
import dynamic from 'next/dynamic';

// Dynamically import the client component with SSR disabled in a client component wrapper
const CheckoutSuccessContent = dynamic(() => import('./CheckoutSuccessContent'), {
  ssr: false,
  loading: () => (
    <div className="text-center py-12 animate-pulse">
      Loading order details...
    </div>
  )
});

/**
 * Checkout Success Client Wrapper
 * This is a client component that imports the main client component with SSR disabled
 */
export default function CheckoutSuccessWrapper() {
  return <CheckoutSuccessContent />;
}
