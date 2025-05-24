'use client';

import React, { useState, useEffect } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import Link from 'next/link';
import { Gutter } from '@/components/ui/Gutter';
import { CheckoutSteps } from './components/CheckoutSteps';
import { CartReview } from './components/CartReview';
import { ShippingForm, ShippingFormData } from './components/ShippingForm';
import { PaymentOptions, PaymentMethod } from './components/PaymentOptions';
import { useCart } from '@/providers/CartProvider';
import { getPayload } from 'payload';
import configPromise from '@payload-config';
import { getLoggedInUser } from '@/utilities/auth';
import { AlertCircle } from 'lucide-react';

// Define the checkout steps
const steps = [
  {
    id: 'cart',
    name: 'Review Cart',
    description: 'Review your items',
  },
  {
    id: 'shipping',
    name: 'Shipping',
    description: 'Delivery details',
  },
  {
    id: 'payment',
    name: 'Payment',
    description: 'Complete your order',
  },
];

export default function CheckoutPage() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const { items, subtotal, clearCart } = useCart();
  
  // Get potential canceled parameter from Stripe
  const canceled = searchParams.get('canceled');
  
  // State for checkout flow
  const [currentStep, setCurrentStep] = useState('cart');
  const [completedSteps, setCompletedSteps] = useState<string[]>([]);
  const [shippingData, setShippingData] = useState<ShippingFormData | null>(null);
  const [paymentMethod, setPaymentMethod] = useState<PaymentMethod>('stripe');
  const [isProcessing, setIsProcessing] = useState(false);
  const [error, setError] = useState<string | null>(null);
  
  // Redirect to products page if cart is empty
  useEffect(() => {
    if (items.length === 0 && !canceled) {
      router.push('/products');
    }
  }, [items.length, router, canceled]);
  
  // Handle potential payment cancellation from Stripe
  useEffect(() => {
    if (canceled) {
      setError('Your payment was canceled. Please try again.');
    }
  }, [canceled]);
  
  // Handle shipping form submission
  const handleShippingSubmit = (data: ShippingFormData) => {
    setShippingData(data);
    setCompletedSteps([...completedSteps, 'shipping']);
    setCurrentStep('payment');
  };
  
  // Handle payment method selection
  const handlePaymentSelect = (method: PaymentMethod) => {
    setPaymentMethod(method);
  };
  
  // Handle order completion
  const handleCompleteOrder = async () => {
    try {
      setIsProcessing(true);
      setError(null);
      
      if (!shippingData) {
        throw new Error('Shipping information is missing');
      }
      
      // Process payment based on selected method
      switch (paymentMethod) {
        case 'stripe':
          await processStripePayment();
          break;
        case 'mpesa':
          await processMpesaPayment();
          break;
        case 'pod':
          await processPayOnDelivery();
          break;
        default:
          throw new Error('Invalid payment method');
      }
    } catch (err) {
      console.error('Error completing order:', err);
      setError(err instanceof Error ? err.message : 'Failed to process your order');
      setIsProcessing(false);
    }
  };
  
  // Process Stripe payment
  const processStripePayment = async () => {
    try {
      // Check if Stripe is properly configured
      const response = await fetch('/api/checkout/stripe', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          items,
          shippingDetails: shippingData,
        }),
      });
      
      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || 'Failed to create checkout session');
      }
      
      const { url } = await response.json();
      
      // Redirect to Stripe checkout
      if (url) {
        window.location.href = url;
      } else {
        throw new Error('No checkout URL returned');
      }
    } catch (err) {
      console.error('Stripe payment error:', err);
      throw err;
    }
  };
  
  // Process M-Pesa payment
  const processMpesaPayment = async () => {
    try {
      // Initialize Payload
      const payload = await getPayload({ config: configPromise });
      const user = await getLoggedInUser();
      
      if (!user && !shippingData) {
        throw new Error('User information is required');
      }
      
      // Prepare order items
      const orderItems = items.map(item => ({
        product: item.product.id,
        title: item.product.title,
        quantity: item.quantity,
        price: item.product.price.value,
        currency: item.product.price.currency,
      }));
      
      // Calculate total
      const total = calculateTotal();
      
      // Create order with pending payment status
      const order = await payload.create({
        collection: 'orders',
        data: {
          user: user?.id,
          customerEmail: shippingData.email,
          customerName: shippingData.name,
          items: orderItems,
          total,
          status: 'pending',
          paymentStatus: 'pending',
          paymentMethod: 'mpesa',
          shippingAddress: {
            name: shippingData.name,
            address: shippingData.address,
            city: shippingData.city,
            state: shippingData.state,
            zip: shippingData.zipCode,
            country: shippingData.country,
          },
        },
      });
      
      // Clear cart and redirect to success page
      clearCart();
      router.push(`/checkout/success?orderId=${order.id}`);
    } catch (err) {
      console.error('M-Pesa payment error:', err);
      throw err;
    }
  };
  
  // Process Pay on Delivery
  const processPayOnDelivery = async () => {
    try {
      // Initialize Payload
      const payload = await getPayload({ config: configPromise });
      const user = await getLoggedInUser();
      
      if (!user && !shippingData) {
        throw new Error('User information is required');
      }
      
      // Prepare order items
      const orderItems = items.map(item => ({
        product: item.product.id,
        title: item.product.title,
        quantity: item.quantity,
        price: item.product.price.value,
        currency: item.product.price.currency,
      }));
      
      // Calculate total
      const total = calculateTotal();
      
      // Create order with pending payment status
      const order = await payload.create({
        collection: 'orders',
        data: {
          user: user?.id,
          customerEmail: shippingData.email,
          customerName: shippingData.name,
          items: orderItems,
          total,
          status: 'processing',
          paymentStatus: 'pending',
          paymentMethod: 'pod',
          shippingAddress: {
            name: shippingData.name,
            address: shippingData.address,
            city: shippingData.city,
            state: shippingData.state,
            zip: shippingData.zipCode,
            country: shippingData.country,
          },
        },
      });
      
      // Clear cart and redirect to success page
      clearCart();
      router.push(`/checkout/success?orderId=${order.id}`);
    } catch (err) {
      console.error('Pay on Delivery error:', err);
      throw err;
    }
  };
  
  // Go back to previous step
  const handleBack = () => {
    if (currentStep === 'shipping') {
      setCurrentStep('cart');
    } else if (currentStep === 'payment') {
      setCurrentStep('shipping');
      setCompletedSteps(completedSteps.filter(step => step !== 'shipping'));
    }
  };
  
  // Move to shipping step
  const handleContinueToShipping = () => {
    setCompletedSteps([...completedSteps, 'cart']);
    setCurrentStep('shipping');
  };

  return (
    <div className="py-12">
      <Gutter>
        <div className="max-w-4xl mx-auto">
          <h1 className="text-4xl font-bold mb-8">Checkout</h1>
          
          {error && (
            <div className="bg-red-50 border border-red-200 rounded-md p-4 mb-6 flex items-start">
              <AlertCircle className="h-5 w-5 text-red-500 mt-0.5 mr-2" />
              <div>
                <h3 className="text-red-800 font-medium">There was a problem</h3>
                <p className="text-red-700">{error}</p>
              </div>
            </div>
          )}
          
          {/* Checkout Progress */}
          <CheckoutSteps
            steps={steps}
            currentStep={currentStep}
            completedSteps={completedSteps}
          />
          
          {/* Cart Review Step */}
          {currentStep === 'cart' && (
            <div className="bg-white rounded-lg shadow-lg p-6 mb-8">
              <h2 className="text-2xl font-semibold mb-4">Your Cart</h2>
              <div className="border-t border-gray-200 pt-4">
                <CartReview />
              </div>
              
              <div className="flex justify-between items-center mt-8 pt-6 border-t border-gray-200">
                <Link 
                  href="/products" 
                  className="text-black hover:underline"
                >
                  ← Return to Shopping
                </Link>
                <button 
                  onClick={handleContinueToShipping}
                  className="bg-black text-white py-3 px-8 rounded-md hover:bg-gray-800 transition-colors"
                  disabled={items.length === 0}
                >
                  Continue to Shipping
                </button>
              </div>
            </div>
          )}
          
          {/* Shipping Step */}
          {currentStep === 'shipping' && (
            <div className="bg-white rounded-lg shadow-lg p-6 mb-8">
              <h2 className="text-2xl font-semibold mb-4">Shipping Information</h2>
              <div className="border-t border-gray-200 pt-4">
                <ShippingForm 
                  onSubmit={handleShippingSubmit}
                  initialData={shippingData || undefined}
                />
              </div>
              
              <div className="flex items-center mt-8 pt-6 border-t border-gray-200">
                <button 
                  onClick={handleBack}
                  className="text-black hover:underline"
                >
                  ← Back to Cart
                </button>
              </div>
            </div>
          )}
          
          {/* Payment Step */}
          {currentStep === 'payment' && (
            <div className="bg-white rounded-lg shadow-lg p-6 mb-8">
              <h2 className="text-2xl font-semibold mb-4">Payment Method</h2>
              
              <div className="border-t border-gray-200 pt-4 mb-6">
                <div className="mb-6">
                  <h3 className="font-medium mb-2">Order Summary</h3>
                  <CartReview readOnly />
                </div>
                
                <div className="pt-6 border-t border-gray-200">
                  <h3 className="font-medium mb-4">Select Payment Method</h3>
                  <PaymentOptions
                    onSelect={handlePaymentSelect}
                    onProceed={handleCompleteOrder}
                    initialMethod={paymentMethod}
                    isProcessing={isProcessing}
                  />
                </div>
              </div>
              
              <div className="flex items-center mt-8 pt-6 border-t border-gray-200">
                <button 
                  onClick={handleBack}
                  className="text-black hover:underline"
                  disabled={isProcessing}
                >
                  ← Back to Shipping
                </button>
              </div>
            </div>
          )}
        </div>
      </Gutter>
    </div>
  );
}
