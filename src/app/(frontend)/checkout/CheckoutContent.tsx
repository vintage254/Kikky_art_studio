'use client';

import React, { useState, useEffect } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import Link from 'next/link';
import { CheckoutSteps } from './components/CheckoutSteps';
import { CartReview } from './components/CartReview';
import { ShippingForm, ShippingFormData } from './components/ShippingForm';
import { PaymentOptions, PaymentMethod } from './components/PaymentOptions';
import { useCart } from '@/providers/CartProvider';
import { AlertCircle } from 'lucide-react';
import { Gutter } from '@/components/ui/Gutter';

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

export default function CheckoutContent() {
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
  const handlePaymentMethodSelect = (method: PaymentMethod) => {
    setPaymentMethod(method);
  };
  
  // Handle payment form submission
  const handlePaymentSubmit = async () => {
    setIsProcessing(true);
    setError(null);
    
    try {
      if (!shippingData) {
        throw new Error('Shipping information is required');
      }
      
      if (paymentMethod === 'stripe') {
        // Handle Stripe checkout
        const response = await fetch('/api/create-checkout-session', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            items,
            shippingInfo: {
              name: shippingData.name,
              email: shippingData.email,
              address: shippingData.address,
              city: shippingData.city,
              state: shippingData.state,
              postalCode: shippingData.zipCode,
              country: shippingData.country,
              phone: shippingData.phone,
            }
          }),
        });
        
        if (!response.ok) {
          throw new Error('Something went wrong with checkout');
        }
        
        const { url } = await response.json();
        
        // Redirect to Stripe checkout
        window.location.href = url;
      } else if (paymentMethod === 'mpesa') {
        // Handle PayPal checkout (placeholder)
        setError('PayPal integration coming soon');
        setIsProcessing(false);
      } else if (paymentMethod === 'pod') {
        // Handle cash on delivery
        const response = await fetch('/api/orders', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            items,
            shippingInfo: {
              name: shippingData.name,
              email: shippingData.email,
              address: shippingData.address,
              city: shippingData.city,
              state: shippingData.state,
              postalCode: shippingData.zipCode,
              country: shippingData.country,
              phone: shippingData.phone,
            },
            paymentMethod: 'pod',
            paymentStatus: 'unpaid',
          }),
        });
        
        if (!response.ok) {
          throw new Error('Something went wrong placing your order');
        }
        
        // Handle successful order
        clearCart();
        router.push('/thank-you?method=pod');
      }
    } catch (err: any) {
      console.error('Payment error:', err);
      setError(err.message || 'Something went wrong with checkout');
      setIsProcessing(false);
    }
  };
  
  // Function to calculate order total
  const calculateTotal = () => {
    // This would include subtotal + shipping + tax
    // For now just return subtotal as a placeholder
    return subtotal;
  };
  
  // Handle navigation between steps
  const goToStep = (step: string) => {
    if (step === 'shipping' && currentStep === 'cart') {
      setCurrentStep(step);
      if (!completedSteps.includes('cart')) {
        setCompletedSteps([...completedSteps, 'cart']);
      }
    } else if (step === 'payment' && currentStep === 'shipping' && shippingData) {
      setCurrentStep(step);
      if (!completedSteps.includes('shipping')) {
        setCompletedSteps([...completedSteps, 'shipping']);
      }
    } else if (completedSteps.includes(step)) {
      setCurrentStep(step);
    }
  };
  
  // Function to go back to previous step
  const goToPreviousStep = () => {
    if (currentStep === 'shipping') {
      setCurrentStep('cart');
    } else if (currentStep === 'payment') {
      setCurrentStep('shipping');
    }
  };

  return (
    <>
      {/* Show error banner if error exists */}
      {error && (
        <div className="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded mb-6 flex items-center">
          <AlertCircle className="h-5 w-5 mr-2" />
          <span>{error}</span>
        </div>
      )}
      
      {/* Checkout steps indicator */}
      <div className="mb-8">
        <CheckoutSteps
          steps={steps}
          currentStep={currentStep}
          completedSteps={completedSteps}
        />
      </div>
      
      {/* Cart review step */}
      {currentStep === 'cart' && (
        <div>
          <CartReview />
          
          <div className="mt-6 flex justify-end">
            <button
              type="button"
              className="bg-black text-white px-6 py-2 rounded hover:bg-gray-800 disabled:opacity-50"
              onClick={() => goToStep('shipping')}
              disabled={items.length === 0}
            >
              Continue to Shipping
            </button>
          </div>
        </div>
      )}
      
      {/* Shipping form step */}
      {currentStep === 'shipping' && (
        <div>
          <ShippingForm
            initialData={shippingData || undefined}
            onSubmit={handleShippingSubmit}
          />
        </div>
      )}
      
      {/* Payment step */}
      {currentStep === 'payment' && (
        <div>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div className="md:col-span-2">
              <PaymentOptions
                initialMethod={paymentMethod}
                onSelect={handlePaymentMethodSelect}
                onProceed={handlePaymentSubmit}
                isProcessing={isProcessing}
              />
              
              <div className="mt-8 flex justify-between">
                <button
                  type="button"
                  className="border border-gray-300 px-6 py-2 rounded hover:bg-gray-50"
                  onClick={goToPreviousStep}
                  disabled={isProcessing}
                >
                  Back to Shipping
                </button>
                
                <button
                  type="button"
                  className="bg-black text-white px-6 py-2 rounded hover:bg-gray-800 disabled:opacity-50"
                  onClick={handlePaymentSubmit}
                  disabled={isProcessing}
                >
                  {isProcessing ? 'Processing...' : 'Complete Order'}
                </button>
              </div>
            </div>
            
            <div className="bg-gray-50 p-6 rounded">
              <h3 className="text-lg font-semibold mb-4">Order Summary</h3>
              
              <div className="space-y-2 mb-4">
                <div className="flex justify-between">
                  <span>Subtotal</span>
                  <span>${subtotal.toFixed(2)}</span>
                </div>
                <div className="flex justify-between">
                  <span>Shipping</span>
                  <span>Calculated at next step</span>
                </div>
              </div>
              
              <div className="border-t border-gray-200 pt-2 mt-2">
                <div className="flex justify-between font-semibold">
                  <span>Total</span>
                  <span>${calculateTotal().toFixed(2)}</span>
                </div>
              </div>
              
              {shippingData && (
                <div className="mt-6 text-sm">
                  <h4 className="font-semibold mb-2">Shipping to:</h4>
                  <p>{shippingData.name}</p>
                  <p>{shippingData.address}</p>
                  <p>{shippingData.city}, {shippingData.state} {shippingData.zipCode}</p>
                  <p>{shippingData.country}</p>
                  <p>{shippingData.email}</p>
                  <p>{shippingData.phone}</p>
                </div>
              )}
            </div>
          </div>
        </div>
      )}
    </>
  );
}
