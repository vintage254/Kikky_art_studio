'use client';

import React, { useEffect, useState } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import type { Order, User, Product } from '@/payload-types';

// Extend the Order type with currency property
type ExtendedOrder = Order & {
  currency?: string;
};

// Define more specific types for order items
type OrderItem = {
  product: Product | string | number;
  price: number;
  quantity: number;
};
import { format } from 'date-fns';
import { Package, Eye } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Gutter } from '@/components/ui/Gutter';

// Define a type for order display
type OrderWithDetails = ExtendedOrder & {
  formattedDate: string;
  statusColor: string;
  statusText: string;
  orderNumber: string;
  currency: string;
  items?: Array<OrderItem>;
  total?: number;
};

/**
 * Orders Client Component
 * 
 * Handles all client-side logic for the orders page including:
 * - User authentication state
 * - Fetching orders data
 * - Order status display
 * - Routing and navigation
 */
export default function OrdersClient() {
  const router = useRouter();
  const [user, setUser] = useState<User | null>(null);
  const [orders, setOrders] = useState<OrderWithDetails[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  
  useEffect(() => {
    async function fetchOrders() {
      try {
        setIsLoading(true);
        
        // Get the current user using client-side fetch
        const userRes = await fetch('/api/users/me');
        if (!userRes.ok) {
          throw new Error('Please log in to view your orders');
        }
        
        const userData = await userRes.json();
        setUser(userData.user);
        
        // Get orders for this user
        const ordersRes = await fetch('/api/orders?user=' + userData.user.id);
        
        if (!ordersRes.ok) {
          throw new Error('Failed to load orders');
        }
        
        const ordersData = await ordersRes.json();
        
        // Process orders with formatting and status information
        const processedOrders = ordersData.docs.map((order: ExtendedOrder) => {
          // Ensure created date exists
          const createdDate = order.createdAt ? new Date(order.createdAt) : new Date();
          
          // Format order number
          const orderNumber = `ORD-${String(order.id).slice(-6).padStart(6, '0')}`;
          
          // Ensure currency has a default value
          const currency = order.currency || 'USD';
          
          // Generate status display
          let statusColor = 'bg-gray-100 text-gray-800';
          let statusText = 'Processing';
          
          if (order.status === 'delivered') {
            statusColor = 'bg-green-100 text-green-800';
            statusText = 'Completed';
          } else if (order.status === 'canceled') {
            statusColor = 'bg-red-100 text-red-800';
            statusText = 'Cancelled';
          } else if (order.status === 'shipped') {
            statusColor = 'bg-blue-100 text-blue-800';
            statusText = 'Shipped';
          }
          
          return {
            ...order,
            formattedDate: format(createdDate, 'MMM d, yyyy'),
            statusColor,
            statusText,
            orderNumber,
            currency,
          };
        });
        
        setOrders(processedOrders);
      } catch (err: any) {
        console.error('Error fetching orders:', err);
        setError(err.message || 'An error occurred while loading your orders');
        
        // Redirect to login if not authenticated
        if (err.message === 'Please log in to view your orders') {
          router.push('/login?redirect=/account/orders');
        }
      } finally {
        setIsLoading(false);
      }
    }
    
    fetchOrders();
  }, [router]);
  
  if (isLoading) {
    return (
      <div className="min-h-[400px] flex items-center justify-center">
        <div className="animate-pulse flex flex-col items-center">
          <Package className="h-12 w-12 text-gray-300 mb-4" />
          <p className="text-gray-500">Loading your orders...</p>
        </div>
      </div>
    );
  }
  
  if (error) {
    return (
      <div className="min-h-[400px] flex items-center justify-center">
        <div className="text-center max-w-md mx-auto">
          <p className="text-red-500 mb-4">{error}</p>
          <Button asChild>
            <Link href="/account">Return to Account</Link>
          </Button>
        </div>
      </div>
    );
  }
  
  if (orders.length === 0) {
    return (
      <div className="py-12">
        <div className="text-center max-w-md mx-auto">
          <Package className="h-16 w-16 text-gray-300 mx-auto mb-4" />
          <h2 className="text-2xl font-medium mb-2">No orders yet</h2>
          <p className="text-gray-500 mb-6">
            You haven't placed any orders yet. Check out our products and place your first order!
          </p>
          <Button asChild>
            <Link href="/products">Browse Products</Link>
          </Button>
        </div>
      </div>
    );
  }
  
  return (
    <div className="py-6">
      <h1 className="text-2xl font-bold mb-6">Your Orders</h1>
      
      <div className="space-y-6">
        {orders.map((order) => (
          <div 
            key={order.id} 
            className="bg-white rounded-lg border border-gray-200 overflow-hidden shadow-sm"
          >
            <div className="border-b border-gray-200 bg-gray-50 p-4 flex flex-wrap items-center justify-between gap-4">
              <div>
                <p className="text-sm text-gray-500">Order placed</p>
                <p className="font-medium">{order.formattedDate}</p>
              </div>
              <div>
                <p className="text-sm text-gray-500">Order number</p>
                <p className="font-medium">{order.orderNumber}</p>
              </div>
              <div>
                <p className="text-sm text-gray-500">Total</p>
                <p className="font-medium">
                  {new Intl.NumberFormat('en-US', {
                    style: 'currency',
                    currency: order.currency || 'USD',
                  }).format((order.total || 0) / 100)}
                </p>
              </div>
              <div>
                <p className="text-sm text-gray-500">Status</p>
                <span className={`inline-flex text-xs px-2 py-1 rounded-full ${order.statusColor}`}>
                  {order.statusText}
                </span>
              </div>
            </div>
            
            <div className="p-4">
              <div className="mb-4">
                <h3 className="font-medium mb-2">Items</h3>
                <div className="space-y-2">
                  {order.items?.map((item, i) => (
                    <div key={i} className="flex items-center justify-between py-2 border-b border-gray-100">
                      <div className="flex items-center">
                        <div className="ml-3">
                          <p className="font-medium">{typeof item.product === 'object' && item.product?.title ? item.product.title : 'Product'}</p>
                          <p className="text-sm text-gray-500">Qty: {item.quantity}</p>
                        </div>
                      </div>
                      <div className="text-right">
                        <p className="font-medium">
                          {new Intl.NumberFormat('en-US', {
                            style: 'currency',
                            currency: order.currency || 'USD',
                          }).format((item.price || 0) / 100)}
                        </p>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
              
              <div className="mt-4 flex justify-end">
                <Button variant="outline" size="sm" asChild>
                  <Link href={`/account/orders/${order.id || ''}`}>
                    <Eye className="h-4 w-4 mr-2" />
                    View Details
                  </Link>
                </Button>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
