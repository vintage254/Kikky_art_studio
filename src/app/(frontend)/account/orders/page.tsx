import React from 'react';
import { Gutter } from '@/components/ui/Gutter';
import OrdersWrapper from './orders-wrapper';

/**
 * Orders Page (Server Component)
 * 
 * This server component provides the layout and wraps the client component wrapper
 * to handle dynamic imports in a client context.
 */
export default function OrdersPage() {
  return (
    <Gutter className="py-8">
      <OrdersWrapper />
    </Gutter>
  );
}
