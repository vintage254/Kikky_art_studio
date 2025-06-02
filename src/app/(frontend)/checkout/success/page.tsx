import React from 'react';
import { Gutter } from '@/components/ui/Gutter';
import CheckoutSuccessWrapper from './success-wrapper';

/**
 * Checkout Success Page (Server Component)
 * 
 * This server component provides the layout and wraps the client component wrapper
 * to handle client-side dynamic imports properly in Next.js 15.x.
 */
export default function CheckoutSuccessPage() {
  return (
    <div className="py-12">
      <Gutter>
        <h1 className="text-3xl font-bold mb-8">Order Confirmation</h1>
        <CheckoutSuccessWrapper />
      </Gutter>
    </div>
  );
}
