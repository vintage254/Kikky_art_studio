'use client';

import React from 'react';
import { Gutter } from '@/components/ui/Gutter';
import CheckoutWrapper from './checkout-wrapper';

/**
 * Checkout Page
 * 
 * This is a client component that uses the checkout wrapper
 * to ensure proper client-side rendering with context providers.
 */
export default function CheckoutPage() {
  return (
    <div className="py-12">
      <Gutter>
        <h1 className="text-3xl font-bold mb-8">Checkout</h1>
        <CheckoutWrapper />
      </Gutter>
    </div>
  );
}
