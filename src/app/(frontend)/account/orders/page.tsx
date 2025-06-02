import React from 'react';
import { Gutter } from '@/components/ui/Gutter';
import dynamic from 'next/dynamic';

// Dynamically import the client component with SSR disabled
const OrdersClient = dynamic(() => import('./orders-client'), {
  ssr: false,
  loading: () => (
    <div className="flex flex-col items-center justify-center min-h-[400px]">
      <div className="animate-pulse text-lg">Loading orders...</div>
    </div>
  )
});

/**
 * Orders Page (Server Component)
 * 
 * This server component provides the layout and wraps the client component
 * with dynamic import to prevent SSR hydration issues.
 */
export default function OrdersPage() {
  return (
    <Gutter className="py-8">
      <OrdersClient />
    </Gutter>
  );
}
