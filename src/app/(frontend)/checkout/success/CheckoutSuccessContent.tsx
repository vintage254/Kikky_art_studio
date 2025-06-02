'use client';

import React, { useEffect, useState } from 'react';
import { useSearchParams, useRouter } from 'next/navigation';
import { CheckCircle, AlertCircle } from 'lucide-react';
import { Gutter } from '@/components/ui/Gutter';
import Link from 'next/link';
import { useCart } from '@/providers/CartProvider';

export default function CheckoutSuccessContent() {
  const searchParams = useSearchParams();
  const router = useRouter();
  const { clearCart } = useCart();
  
  const [orderNumber, setOrderNumber] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    async function processCheckoutSuccess() {
      try {
        setLoading(true);
        
        // Get session ID from URL
        const sessionId = searchParams.get('session_id');
        
        if (!sessionId) {
          setError('Missing session information');
          setLoading(false);
          return;
        }
        
        // Verify the Stripe session and create an order via API route
        // The server-side logic is handled in /api/checkout/verify
        const response = await fetch('/api/checkout/verify', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ sessionId }),
        });

        if (!response.ok) {
          const errorData = await response.json();
          throw new Error(errorData.error || 'Failed to verify payment');
        }

        const { orderNumber: newOrderNumber } = await response.json();
        
        // Set the order number for display
        setOrderNumber(newOrderNumber);
        
        // Clear the cart after successful order
        clearCart();
      } catch (err) {
        console.error('Error processing checkout success:', err);
        setError('Unable to process your order. Please contact customer support.');
      } finally {
        setLoading(false);
      }
    }

    processCheckoutSuccess();
  }, [searchParams, clearCart]);

  if (loading) {
    return (
      <div className="max-w-4xl mx-auto text-center">
        <div className="animate-pulse mb-6">
          <div className="h-8 bg-gray-200 rounded w-3/4 mx-auto mb-4"></div>
          <div className="h-4 bg-gray-200 rounded w-1/2 mx-auto"></div>
        </div>
        <p className="text-gray-600">Processing your order...</p>
      </div>
    );
  }

  if (error) {
    return (
      <div className="max-w-4xl mx-auto text-center">
        <div className="mb-8 flex justify-center">
          <AlertCircle size={64} className="text-red-500" />
        </div>
        <h1 className="text-3xl font-bold mb-4">There was a problem</h1>
        <p className="text-gray-600 mb-8">{error}</p>
        <div className="flex justify-center gap-4">
          <Link 
            href="/account/cart" 
            className="bg-black text-white py-3 px-6 rounded-md hover:bg-gray-800 transition-colors"
          >
            Return to Cart
          </Link>
          <Link 
            href="/products" 
            className="border border-gray-300 py-3 px-6 rounded-md hover:bg-gray-50 transition-colors"
          >
            Continue Shopping
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto text-center">
      <div className="mb-8 flex justify-center">
        <CheckCircle size={64} className="text-green-500" />
      </div>
      <h1 className="text-3xl font-bold mb-4">Thank you for your order!</h1>
      
      {orderNumber && (
        <p className="text-lg mb-2">
          Order Number: <span className="font-semibold">{orderNumber}</span>
        </p>
      )}
      
      <p className="text-gray-600 mb-8">
        We've received your order and will begin processing it right away.
        You will receive a confirmation email shortly.
      </p>
      
      <div className="flex justify-center gap-4">
        <Link 
          href="/account/orders" 
          className="bg-black text-white py-3 px-6 rounded-md hover:bg-gray-800 transition-colors"
        >
          View Orders
        </Link>
        <Link 
          href="/products" 
          className="border border-gray-300 py-3 px-6 rounded-md hover:bg-gray-50 transition-colors"
        >
          Continue Shopping
        </Link>
      </div>
    </div>
  );
}
