import React, { Suspense } from 'react';
import { Gutter } from '@/components/ui/Gutter';
import dynamic from 'next/dynamic';

// Use dynamic import for the client component
const CheckoutSuccessContent = dynamic(() => import('./CheckoutSuccessContent'), {
  loading: () => <div className="text-center py-12">Loading order details...</div>
});

export default function CheckoutSuccessPage() {
  return (
    <div className="py-12">
      <Gutter>
        <h1 className="text-3xl font-bold mb-8">Order Confirmation</h1>
        
        {/* Using dynamically imported client component */}
        <CheckoutSuccessContent />
      </Gutter>
    </div>
  );
}
