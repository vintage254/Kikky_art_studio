'use client';

import React, { useState } from 'react';
import { CreditCard, Banknote, Phone, ArrowRight } from 'lucide-react';

export type PaymentMethod = 'stripe' | 'mpesa' | 'pod'; // pod = Pay on Delivery

type PaymentOptionsProps = {
  onSelect: (method: PaymentMethod) => void;
  onProceed: () => void;
  initialMethod?: PaymentMethod;
  isProcessing?: boolean;
};

export const PaymentOptions: React.FC<PaymentOptionsProps> = ({
  onSelect,
  onProceed,
  initialMethod = 'stripe',
  isProcessing = false,
}) => {
  const [selectedMethod, setSelectedMethod] = useState<PaymentMethod>(initialMethod);

  const handleMethodSelect = (method: PaymentMethod) => {
    setSelectedMethod(method);
    onSelect(method);
  };

  const handleProceed = () => {
    onProceed();
  };

  return (
    <div className="space-y-6">
      <div className="space-y-4">
        <div
          className={`border rounded-md p-4 flex items-center cursor-pointer transition-colors ${
            selectedMethod === 'stripe'
              ? 'border-black bg-gray-50'
              : 'border-gray-300 hover:border-gray-400'
          }`}
          onClick={() => handleMethodSelect('stripe')}
        >
          <div
            className={`w-5 h-5 rounded-full border mr-3 flex items-center justify-center ${
              selectedMethod === 'stripe' ? 'border-black' : 'border-gray-300'
            }`}
          >
            {selectedMethod === 'stripe' && (
              <div className="w-3 h-3 rounded-full bg-black" />
            )}
          </div>
          <CreditCard className="w-5 h-5 mr-3 text-gray-600" />
          <div className="flex-1">
            <h3 className="font-medium">Credit Card</h3>
            <p className="text-sm text-gray-500">
              Pay securely with your credit or debit card
            </p>
          </div>
          <div className="ml-4 flex items-center space-x-2">
            <img
              src="https://cdn.jsdelivr.net/gh/danielcohen2/cards-minimal@latest/dist/visa.svg"
              alt="Visa"
              className="h-6"
            />
            <img
              src="https://cdn.jsdelivr.net/gh/danielcohen2/cards-minimal@latest/dist/mastercard.svg"
              alt="Mastercard"
              className="h-6"
            />
            <img
              src="https://cdn.jsdelivr.net/gh/danielcohen2/cards-minimal@latest/dist/amex.svg"
              alt="American Express"
              className="h-6"
            />
          </div>
        </div>

        <div
          className={`border rounded-md p-4 flex items-center cursor-pointer transition-colors ${
            selectedMethod === 'mpesa'
              ? 'border-black bg-gray-50'
              : 'border-gray-300 hover:border-gray-400'
          }`}
          onClick={() => handleMethodSelect('mpesa')}
        >
          <div
            className={`w-5 h-5 rounded-full border mr-3 flex items-center justify-center ${
              selectedMethod === 'mpesa' ? 'border-black' : 'border-gray-300'
            }`}
          >
            {selectedMethod === 'mpesa' && (
              <div className="w-3 h-3 rounded-full bg-black" />
            )}
          </div>
          <Phone className="w-5 h-5 mr-3 text-gray-600" />
          <div className="flex-1">
            <h3 className="font-medium">M-Pesa</h3>
            <p className="text-sm text-gray-500">
              Pay using M-Pesa mobile money service
            </p>
          </div>
          <div className="ml-4">
            <img
              src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/M-PESA_LOGO-01.svg/320px-M-PESA_LOGO-01.svg.png"
              alt="M-Pesa"
              className="h-6"
            />
          </div>
        </div>

        <div
          className={`border rounded-md p-4 flex items-center cursor-pointer transition-colors ${
            selectedMethod === 'pod'
              ? 'border-black bg-gray-50'
              : 'border-gray-300 hover:border-gray-400'
          }`}
          onClick={() => handleMethodSelect('pod')}
        >
          <div
            className={`w-5 h-5 rounded-full border mr-3 flex items-center justify-center ${
              selectedMethod === 'pod' ? 'border-black' : 'border-gray-300'
            }`}
          >
            {selectedMethod === 'pod' && (
              <div className="w-3 h-3 rounded-full bg-black" />
            )}
          </div>
          <Banknote className="w-5 h-5 mr-3 text-gray-600" />
          <div className="flex-1">
            <h3 className="font-medium">Pay on Delivery</h3>
            <p className="text-sm text-gray-500">
              Pay with cash or card when your order is delivered
            </p>
          </div>
        </div>
      </div>

      {selectedMethod === 'mpesa' && (
        <div className="bg-blue-50 border border-blue-200 rounded-md p-4">
          <h4 className="font-medium text-blue-800 mb-2">M-Pesa Instructions</h4>
          <p className="text-sm text-blue-700">
            After clicking "Complete Order", you will receive an M-Pesa push notification on your
            phone. Please follow the instructions to complete the payment.
          </p>
        </div>
      )}

      {selectedMethod === 'pod' && (
        <div className="bg-yellow-50 border border-yellow-200 rounded-md p-4">
          <h4 className="font-medium text-yellow-800 mb-2">Pay on Delivery Information</h4>
          <p className="text-sm text-yellow-700">
            You will pay for your order when it is delivered to your address. Please have the exact
            amount ready, or you can pay by card to our delivery agent.
          </p>
        </div>
      )}

      <div className="pt-4">
        <button
          type="button"
          onClick={handleProceed}
          disabled={isProcessing}
          className="w-full bg-black text-white py-3 px-4 rounded-md hover:bg-gray-800 transition-colors flex items-center justify-center disabled:bg-gray-400 disabled:cursor-not-allowed"
        >
          {isProcessing ? (
            <>
              <span className="mr-2">Processing</span>
              <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-white"></div>
            </>
          ) : (
            <>
              <span className="mr-2">Complete Order</span>
              <ArrowRight className="w-4 h-4" />
            </>
          )}
        </button>
      </div>
    </div>
  );
};
