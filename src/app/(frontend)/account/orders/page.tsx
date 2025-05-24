'use client';

import React, { useEffect, useState } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { getLoggedInUser } from '@/utilities/auth';
import { getPayload } from 'payload';
import configPromise from '@payload-config';
import { Order, User } from '@/payload-types';
import { format } from 'date-fns';
import { Package, Eye } from 'lucide-react';
import { Button } from '@/components/ui/Button';

// Define a type for order display
type OrderWithDetails = Order & {
  formattedDate: string;
  statusColor: string;
  statusText: string;
};

export default function OrdersPage() {
  const router = useRouter();
  const [user, setUser] = useState<User | null>(null);
  const [orders, setOrders] = useState<OrderWithDetails[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  
  useEffect(() => {
    async function fetchOrders() {
      try {
        setIsLoading(true);
        
        // Get the current user
        const currentUser = await getLoggedInUser();
        if (!currentUser) {
          router.push('/login');
          return;
        }
        
        setUser(currentUser);
        
        // Initialize Payload client
        const payload = await getPayload({ config: configPromise });
        
        // Fetch user's orders
        const { docs: userOrders } = await payload.find({
          collection: 'orders',
          where: {
            customer: {
              equals: currentUser.id,
            },
          },
          sort: '-createdAt',
          depth: 1, // To get product details
        });
        
        // Process orders for display
        const processedOrders = userOrders.map((order: any) => {
          // Determine status color and text
          let statusColor = 'bg-gray-500';
          let statusText = 'Unknown';
          
          switch (order.status) {
            case 'pending':
              statusColor = 'bg-yellow-500';
              statusText = 'Pending';
              break;
            case 'processing':
              statusColor = 'bg-blue-500';
              statusText = 'Processing';
              break;
            case 'paid':
              statusColor = 'bg-green-500';
              statusText = 'Paid';
              break;
            case 'shipped':
              statusColor = 'bg-purple-500';
              statusText = 'Shipped';
              break;
            case 'delivered':
              statusColor = 'bg-green-700';
              statusText = 'Delivered';
              break;
            case 'cancelled':
              statusColor = 'bg-red-500';
              statusText = 'Cancelled';
              break;
          }
          
          // Format date
          const formattedDate = order.createdAt
            ? format(new Date(order.createdAt), 'MMM d, yyyy')
            : 'Unknown date';
          
          return {
            ...order,
            formattedDate,
            statusColor,
            statusText,
          };
        });
        
        setOrders(processedOrders);
      } catch (err) {
        console.error('Error fetching orders:', err);
        setError('Failed to load your orders. Please try again later.');
      } finally {
        setIsLoading(false);
      }
    }
    
    fetchOrders();
  }, [router]);
  
  if (isLoading) {
    return (
      <div className="flex flex-col items-center justify-center min-h-[400px]">
        <div className="animate-pulse text-lg">Loading your orders...</div>
      </div>
    );
  }
  
  if (error) {
    return (
      <div className="bg-red-50 border border-red-200 text-red-700 p-4 rounded-lg">
        <h2 className="text-lg font-medium mb-2">Error</h2>
        <p>{error}</p>
        <Button 
          onClick={() => router.refresh()} 
          className="mt-4"
          variant="outline"
        >
          Try Again
        </Button>
      </div>
    );
  }
  
  if (orders.length === 0) {
    return (
      <div className="flex flex-col items-center justify-center min-h-[400px] space-y-6">
        <Package className="h-16 w-16 text-gray-300" />
        <h1 className="text-2xl font-bold">No Orders Yet</h1>
        <p className="text-gray-500 text-center">
          You haven't placed any orders yet. Start shopping to see your orders here.
        </p>
        <Button onClick={() => router.push('/products')}>
          Shop Now
        </Button>
      </div>
    );
  }
  
  return (
    <div className="space-y-8">
      <h1 className="text-2xl font-bold">Your Orders</h1>
      
      <div className="space-y-6">
        {orders.map((order) => (
          <div
            key={order.id}
            className="border border-gray-200 rounded-lg overflow-hidden"
          >
            {/* Order Header */}
            <div className="bg-gray-50 p-4 sm:px-6 flex flex-wrap gap-4 justify-between">
              <div>
                <h3 className="font-medium">Order #{order.orderNumber}</h3>
                <p className="text-sm text-gray-500">{order.formattedDate}</p>
              </div>
              
              <div className="flex items-center gap-4">
                <div className="flex items-center">
                  <div className={`w-3 h-3 rounded-full ${order.statusColor} mr-2`}></div>
                  <span className="text-sm font-medium">{order.statusText}</span>
                </div>
                
                <Link 
                  href={`/account/orders/${order.id}`} 
                  className="inline-flex items-center text-sm text-blue-600 hover:text-blue-800"
                >
                  <Eye className="h-4 w-4 mr-1" />
                  View
                </Link>
              </div>
            </div>
            
            {/* Order Items Summary */}
            <div className="p-4 sm:px-6">
              <div className="space-y-3">
                {/* Show up to 3 items */}
                {order.items?.slice(0, 3).map((item: any, index: number) => (
                  <div key={index} className="flex items-center justify-between">
                    <div className="flex items-center">
                      <span className="text-gray-600 text-sm font-medium mr-2">
                        {item.quantity}x
                      </span>
                      <span className="text-sm">
                        {item.product?.title || 'Product'}
                      </span>
                    </div>
                    <span className="text-sm font-medium">
                      Ksh {(item.price * item.quantity).toLocaleString('en-US')}
                    </span>
                  </div>
                ))}
                
                {/* Show a message if there are more items */}
                {order.items && order.items.length > 3 && (
                  <div className="text-sm text-gray-500 italic">
                    + {order.items.length - 3} more items
                  </div>
                )}
              </div>
              
              {/* Order Total */}
              <div className="mt-4 pt-4 border-t border-gray-200 flex justify-between">
                <span className="font-medium">Total</span>
                <span className="font-bold">
                  Ksh {order.total?.toLocaleString('en-US') || 'N/A'}
                </span>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
