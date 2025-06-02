import React from 'react';
import { Gutter } from '@/components/ui/Gutter';
import CartWrapper from './cart-wrapper';

/**
 * Cart Page (Server Component)
 * 
 * This server component provides the layout and wraps the client component wrapper
 * to handle client-side dynamic imports properly in Next.js 15.x.
 */
export default function CartPage() {
  return (
    <Gutter className="py-10">
      <div className="container mx-auto">
        <CartWrapper />
      </div>
    </Gutter>
  );
}
