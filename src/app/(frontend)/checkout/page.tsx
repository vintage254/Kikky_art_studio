'use client';

import React from 'react';
import { Gutter } from '@/components/ui/Gutter';

// Separate the main checkout content into a client component
import dynamic from 'next/dynamic';

// Use dynamic import to ensure proper loading of the client component
const CheckoutContent = dynamic(() => import('./CheckoutContent'), {
  loading: () => <div className="text-center py-12">Loading checkout...</div>
});

export default function CheckoutPage() {
  return (
    <div className="py-12">
      <Gutter>
        <h1 className="text-3xl font-bold mb-8">Checkout</h1>
        
        {/* Using dynamically imported component which handles its own loading state */}
        <CheckoutContent />
      </Gutter>
    </div>
  );
}
