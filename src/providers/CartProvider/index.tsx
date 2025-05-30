'use client';

import React, { createContext, useContext, useEffect, useState } from 'react';
import type { Product, User } from '@/payload-types';

// Define the cart item type
export type CartItem = {
  product: Product;
  quantity: number;
};

// Define the cart context type
type CartContextType = {
  items: CartItem[];
  addItem: (product: Product, quantity?: number) => void;
  updateQuantity: (productId: string, quantity: number) => void;
  removeItem: (productId: string) => void;
  clearCart: () => void;
  isLoading: boolean;
  subtotal: number;
  itemCount: number;
};

// Create the cart context
const CartContext = createContext<CartContextType | undefined>(undefined);

// Cart provider props
type CartProviderProps = {
  children: React.ReactNode;
};

// Local storage key for the cart
const CART_STORAGE_KEY = 'kikky-art-studio-cart';

export function CartProvider({ children }: CartProviderProps) {
  const [items, setItems] = useState<CartItem[]>([]);
  const [isLoading, setIsLoading] = useState<boolean>(true);
  const [user, setUser] = useState<any>(null);

  // Calculate subtotal
  const subtotal = items.reduce((total, item) => {
    const price = typeof item.product.price === 'number' ? item.product.price : 0;
    return total + price * item.quantity;
  }, 0);

  // Calculate total item count
  const itemCount = items.reduce((count, item) => count + item.quantity, 0);

  // Load cart from localStorage on mount
  useEffect(() => {
    async function initializeCart() {
      try {
        setIsLoading(true);
        
        // Check if user is logged in using client-side fetch
        try {
          const response = await fetch('/api/users/me', {
            method: 'GET',
            credentials: 'include',
            headers: {
              'Content-Type': 'application/json',
            },
          });
          
          if (response.ok) {
            const data = await response.json();
            setUser(data.user);
          }
        } catch (authError) {
          console.error('Error fetching user:', authError);
          // Continue with the local cart even if user auth fails
        }
        
        // Load cart from localStorage
        const storedCart = localStorage.getItem(CART_STORAGE_KEY);
        if (storedCart) {
          setItems(JSON.parse(storedCart));
        }
        
        // If user is logged in, we would fetch their cart from the API
        // and merge with local cart (future implementation)
        if (user) {
          // For now, just use localStorage
          // In a full implementation, we would fetch the user's cart from the API
          // and merge it with the local cart
        }
      } catch (error) {
        console.error('Error initializing cart:', error);
      } finally {
        setIsLoading(false);
      }
    }
    
    initializeCart();
  }, []);

  // Save cart to localStorage whenever it changes
  useEffect(() => {
    if (!isLoading) {
      localStorage.setItem(CART_STORAGE_KEY, JSON.stringify(items));
      
      // If user is logged in, we would sync their cart with the API
      // (future implementation)
      if (user) {
        // Call API to update user's cart
      }
    }
  }, [items, isLoading, user]);

  // Add an item to the cart
  const addItem = (product: Product, quantity = 1) => {
    setItems(currentItems => {
      const existingItemIndex = currentItems.findIndex(
        item => item.product.id === product.id
      );
      
      if (existingItemIndex > -1) {
        // Item already exists, update quantity
        const updatedItems = [...currentItems];
        updatedItems[existingItemIndex] = {
          ...updatedItems[existingItemIndex],
          quantity: updatedItems[existingItemIndex].quantity + quantity
        };
        return updatedItems;
      } else {
        // Item doesn't exist, add it
        return [...currentItems, { product, quantity }];
      }
    });
  };

  // Update item quantity
  const updateQuantity = (productId: string, quantity: number) => {
    if (quantity < 1) {
      removeItem(productId);
      return;
    }
    
    setItems(currentItems => 
      currentItems.map(item => 
        item.product.id === productId
          ? { ...item, quantity }
          : item
      )
    );
  };

  // Remove an item from the cart
  const removeItem = (productId: string) => {
    setItems(currentItems => 
      currentItems.filter(item => item.product.id !== productId)
    );
  };

  // Clear the cart
  const clearCart = () => {
    setItems([]);
  };

  // Provide the cart context to children
  return (
    <CartContext.Provider
      value={{
        items,
        addItem,
        updateQuantity,
        removeItem,
        clearCart,
        isLoading,
        subtotal,
        itemCount,
      }}
    >
      {children}
    </CartContext.Provider>
  );
}

// Custom hook to use the cart context
export function useCart() {
  const context = useContext(CartContext);
  if (context === undefined) {
    throw new Error('useCart must be used within a CartProvider');
  }
  return context;
}
