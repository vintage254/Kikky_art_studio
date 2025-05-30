'use client';

import React from 'react';
import Image from 'next/image';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { useCart } from '@/providers/CartProvider';
import { Trash2, Plus, Minus } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { getClientSideURL } from '@/utilities/getURL';

export default function CartPage() {
  const router = useRouter();
  const { items, updateQuantity, removeItem, subtotal, isLoading, itemCount } = useCart();
  const baseUrl = getClientSideURL();
  
  // Handle checkout button click
  const handleCheckout = () => {
    router.push('/checkout');
  };
  
  // Handle continue shopping button click
  const handleContinueShopping = () => {
    router.push('/products');
  };
  
  if (isLoading) {
    return (
      <div className="flex flex-col items-center justify-center min-h-[400px]">
        <div className="animate-pulse text-lg">Loading your cart...</div>
      </div>
    );
  }
  
  if (items.length === 0) {
    return (
      <div className="flex flex-col items-center justify-center min-h-[400px] space-y-6">
        <h1 className="text-2xl font-bold">Your Cart</h1>
        <p className="text-gray-500">Your cart is currently empty.</p>
        <Button onClick={handleContinueShopping}>
          Continue Shopping
        </Button>
      </div>
    );
  }
  
  return (
    <div className="space-y-8">
      <h1 className="text-2xl font-bold">Your Cart</h1>
      
      <div className="divide-y divide-gray-200">
        {items.map((item) => {
          const product = item.product;
          const price = typeof product.price === 'number' ? product.price : 0;
          const itemTotal = price * item.quantity;
          
          // Get the product image URL
          let imageUrl = '';
          // Check if product has images and use the first one
          if (product.images && Array.isArray(product.images) && product.images.length > 0) {
            const firstImage = product.images[0]?.image;
            if (typeof firstImage === 'object' && firstImage !== null && 'url' in firstImage) {
              imageUrl = `${baseUrl}${firstImage.url}`;
            }
          }
          
          return (
            <div key={product.id} className="py-6 flex flex-wrap md:flex-nowrap gap-4">
              {/* Product Image */}
              <div className="w-full md:w-1/4 lg:w-1/5 aspect-square relative">
                {imageUrl ? (
                  <Image 
                    src={imageUrl} 
                    alt={product.title || 'Product Image'} 
                    fill
                    className="object-cover rounded-md"
                  />
                ) : (
                  <div className="w-full h-full bg-gray-200 rounded-md flex items-center justify-center">
                    <span className="text-gray-400">No image</span>
                  </div>
                )}
              </div>
              
              {/* Product Info */}
              <div className="flex-1 flex flex-col">
                <h2 className="text-lg font-medium text-gray-900">
                  <Link href={`/products/${String(product.id)}`}>{product.title}</Link>
                </h2>
                
                {/* Price Info */}
                <div className="mt-2 text-sm text-gray-500">
                  {typeof price === 'number' && (
                    <span>Ksh {price.toLocaleString('en-US')}</span>
                  )}
                </div>
                
                <div className="mt-auto pt-4 flex flex-wrap justify-between items-end gap-4">
                  {/* Quantity Controls */}
                  <div className="flex items-center border border-gray-300 rounded-md">
                    <button
                      onClick={() => updateQuantity(String(product.id), Math.max(1, item.quantity - 1))}
                      className="p-2 text-gray-500 hover:text-gray-700"
                      aria-label="Decrease quantity"
                    >
                      <Minus className="h-4 w-4" />
                    </button>
                    
                    <span className="px-4 py-2 border-x border-gray-300">
                      {item.quantity}
                    </span>
                    
                    <button
                      onClick={() => updateQuantity(String(product.id), item.quantity + 1)}
                      className="p-2 text-gray-500 hover:text-gray-700"
                      aria-label="Increase quantity"
                    >
                      <Plus className="h-4 w-4" />
                    </button>
                  </div>
                  
                  {/* Subtotal and Remove Button */}
                  <div className="flex items-center gap-4">
                    <span className="font-medium">
                      Ksh {itemTotal.toLocaleString('en-US')}
                    </span>
                    
                    <button
                      onClick={() => removeItem(String(product.id))}
                      className="p-2 text-red-500 hover:text-red-700"
                      aria-label="Remove item"
                    >
                      <Trash2 className="h-5 w-5" />
                    </button>
                  </div>
                </div>
              </div>
            </div>
          );
        })}
      </div>
      
      {/* Cart Summary */}
      <div className="bg-gray-50 p-6 rounded-lg mt-8">
        <div className="space-y-4">
          <div className="flex justify-between items-center font-medium">
            <span>Subtotal ({itemCount} {itemCount === 1 ? 'item' : 'items'})</span>
            <span>Ksh {subtotal.toLocaleString('en-US')}</span>
          </div>
          
          <div className="flex justify-between items-center text-gray-500 text-sm">
            <span>Shipping</span>
            <span>Calculated at checkout</span>
          </div>
          
          <div className="border-t border-gray-200 pt-4 flex justify-between items-center font-bold text-lg">
            <span>Total</span>
            <span>Ksh {subtotal.toLocaleString('en-US')}</span>
          </div>
        </div>
        
        <div className="mt-6 space-y-3">
          <Button
            onClick={handleCheckout}
            className="w-full justify-center py-3"
            disabled={items.length === 0}
          >
            Proceed to Checkout
          </Button>
          
          <Button
            onClick={handleContinueShopping}
            variant="outline"
            className="w-full justify-center py-3"
          >
            Continue Shopping
          </Button>
        </div>
      </div>
    </div>
  );
}
