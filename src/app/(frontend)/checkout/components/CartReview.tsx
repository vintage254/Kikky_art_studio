'use client';

import React, { useEffect, useState } from 'react';
import Image from 'next/image';
import Link from 'next/link';
import { useCart } from '@/providers/CartProvider';
import { formatPrice } from '@/utilities/formatPrice';
import { Trash2, Plus, Minus } from 'lucide-react';

type CartReviewProps = {
  readOnly?: boolean;
};

export const CartReview: React.FC<CartReviewProps> = ({ readOnly = false }) => {
  const { items, updateItemQuantity, removeItem, calculateTotal } = useCart();
  const [isClient, setIsClient] = useState(false);

  useEffect(() => {
    setIsClient(true);
  }, []);

  if (!isClient) {
    return (
      <div className="animate-pulse">
        <div className="h-16 bg-gray-200 rounded mb-4"></div>
        <div className="h-16 bg-gray-200 rounded mb-4"></div>
        <div className="h-16 bg-gray-200 rounded"></div>
      </div>
    );
  }

  if (items.length === 0) {
    return (
      <div className="text-center py-8">
        <p className="text-gray-600 mb-4">Your cart is empty</p>
        <Link 
          href="/products" 
          className="inline-block bg-black text-white py-2 px-4 rounded hover:bg-gray-800 transition-colors"
        >
          Browse Products
        </Link>
      </div>
    );
  }

  return (
    <div>
      <div className="divide-y divide-gray-200">
        {items.map((item) => (
          <div key={item.product.id} className="flex py-4">
            <div className="h-24 w-24 flex-shrink-0 overflow-hidden rounded-md border border-gray-200">
              {item.product.images && item.product.images[0]?.image?.url ? (
                <Image
                  src={item.product.images[0].image.url}
                  alt={item.product.title}
                  width={96}
                  height={96}
                  className="h-full w-full object-cover object-center"
                />
              ) : (
                <div className="h-full w-full bg-gray-200 flex items-center justify-center">
                  <span className="text-xs text-gray-500">No image</span>
                </div>
              )}
            </div>

            <div className="ml-4 flex flex-1 flex-col">
              <div>
                <div className="flex justify-between text-base font-medium text-gray-900">
                  <h3>
                    <Link href={`/products/${item.product.slug}`} className="hover:underline">
                      {item.product.title}
                    </Link>
                  </h3>
                  <p className="ml-4">
                    {formatPrice(
                      item.product.price.value * item.quantity,
                      item.product.price.currency
                    )}
                  </p>
                </div>
              </div>

              <div className="flex flex-1 items-end justify-between mt-2">
                {!readOnly ? (
                  <div className="flex items-center">
                    <button
                      onClick={() => updateItemQuantity(item.product.id, Math.max(1, item.quantity - 1))}
                      className="text-gray-500 hover:text-black p-1"
                      aria-label="Decrease quantity"
                    >
                      <Minus className="h-4 w-4" />
                    </button>
                    <span className="mx-2 text-gray-700 w-8 text-center">{item.quantity}</span>
                    <button
                      onClick={() => updateItemQuantity(item.product.id, item.quantity + 1)}
                      className="text-gray-500 hover:text-black p-1"
                      aria-label="Increase quantity"
                    >
                      <Plus className="h-4 w-4" />
                    </button>
                  </div>
                ) : (
                  <p className="text-gray-500">Qty: {item.quantity}</p>
                )}

                {!readOnly && (
                  <button
                    type="button"
                    onClick={() => removeItem(item.product.id)}
                    className="font-medium text-red-600 hover:text-red-500 flex items-center"
                  >
                    <Trash2 className="h-4 w-4 mr-1" />
                    <span>Remove</span>
                  </button>
                )}
              </div>
            </div>
          </div>
        ))}
      </div>

      <div className="border-t border-gray-200 pt-4 mt-6">
        <div className="flex justify-between text-base font-medium text-gray-900 mb-2">
          <p>Subtotal</p>
          <p>{formatPrice(calculateTotal(), items[0]?.product.price.currency || 'USD')}</p>
        </div>
        <p className="text-sm text-gray-500">Shipping and taxes calculated at checkout.</p>
      </div>
    </div>
  );
};
