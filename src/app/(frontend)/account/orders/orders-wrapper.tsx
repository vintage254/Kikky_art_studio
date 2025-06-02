'use client';

import React from 'react';
import dynamic from 'next/dynamic';

// Dynamically import the client component with SSR disabled in a client component wrapper
const OrdersClient = dynamic(() => import('./orders-client'), {
  ssr: false,
  loading: () => (
    <div className="flex flex-col items-center justify-center min-h-[400px]">
      <div className="animate-pulse text-lg">Loading orders...</div>
    </div>
  )
});

/**
 * Orders Client Wrapper
 * This is a client component that imports the main client component with SSR disabled
 */
export default function OrdersWrapper() {
  return <OrdersClient />;
}
