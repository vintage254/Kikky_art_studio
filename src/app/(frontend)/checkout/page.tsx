'use client';

import React, { Suspense } from 'react';
import { Gutter } from '@/components/ui/Gutter';

// Separate the main checkout content into a client component
import CheckoutContent from './CheckoutContent';

export default function CheckoutPage() {
  return (
    <div className="py-12">
      <Gutter>
        <h1 className="text-3xl font-bold mb-8">Checkout</h1>
        
        {/* Wrap the component that uses useSearchParams in a Suspense boundary */}
        <Suspense fallback={<div className="text-center py-12">Loading checkout...</div>}>
          <CheckoutContent />
        </Suspense>
      </Gutter>
    </div>
  );
}
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
