'use client';

import React, { useState, useEffect, useRef } from 'react';
import Link from 'next/link';
import { motion, AnimatePresence } from 'framer-motion';
import { User, ShoppingBag, Package, Settings, LogOut } from 'lucide-react';
import { getUserData, logout } from './api';
import type { User as UserType } from '@/payload-types';
import { useRouter } from 'next/navigation';

export const UserMenu: React.FC = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [user, setUser] = useState<UserType | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const menuRef = useRef<HTMLDivElement>(null);
  const router = useRouter();

  // Fetch user on mount
  useEffect(() => {
    async function fetchUser() {
      try {
        const userData = await getUserData();
        setUser(userData);
      } catch (error) {
        console.error('Error fetching user:', error);
      } finally {
        setIsLoading(false);
      }
    }
    
    fetchUser();
  }, []);

  // Close menu when clicking outside
  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (menuRef.current && !menuRef.current.contains(event.target as Node)) {
        setIsOpen(false);
      }
    }

    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  // Handle logout
  const handleLogout = async () => {
    try {
      await logout();
      setUser(null);
      setIsOpen(false);
      router.push('/');
      router.refresh();
    } catch (error) {
      console.error('Error logging out:', error);
    }
  };

  // Animation variants
  const menuVariants = {
    hidden: { 
      opacity: 0,
      y: -5,
      scale: 0.95,
      transition: { 
        duration: 0.2,
        ease: "easeInOut" 
      }
    },
    visible: { 
      opacity: 1,
      y: 0,
      scale: 1,
      transition: { 
        duration: 0.2,
        ease: "easeOut" 
      }
    }
  };

  // If not authenticated or still loading, don't render anything
  if (isLoading) {
    return (
      <div className="w-8 h-8 flex items-center justify-center">
        <div className="w-5 h-5 rounded-full border-2 border-gray-300 border-t-transparent animate-spin"></div>
      </div>
    );
  }

  if (!user) {
    return (
      <Link 
        href="/login" 
        className="p-2 hover:bg-gray-100 rounded-full transition-colors duration-200"
        aria-label="Login"
      >
        <User className="w-5 h-5 text-primary" />
      </Link>
    );
  }

  return (
    <div className="relative" ref={menuRef}>
      <button
        onClick={() => setIsOpen(!isOpen)}
        className={`p-2 rounded-full transition-colors duration-200 ${isOpen ? 'bg-gray-100' : 'hover:bg-gray-100'}`}
        aria-label="Account menu"
        aria-expanded={isOpen}
        aria-haspopup="true"
      >
        <User className="w-5 h-5 text-primary" />
      </button>

      <AnimatePresence>
        {isOpen && (
          <motion.div
            initial="hidden"
            animate="visible"
            exit="hidden"
            variants={menuVariants}
            className="absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 z-50"
          >
            <div className="py-2 px-4 border-b border-gray-100">
              <p className="font-medium text-sm">{user.name || 'User'}</p>
              <p className="text-xs text-gray-500 truncate">{user.email}</p>
            </div>
            <div className="py-1">
              <Link 
                href="/account/cart" 
                className="flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                onClick={() => setIsOpen(false)}
              >
                <ShoppingBag className="mr-3 h-4 w-4" />
                Cart
              </Link>
              <Link 
                href="/account/orders" 
                className="flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                onClick={() => setIsOpen(false)}
              >
                <Package className="mr-3 h-4 w-4" />
                Orders
              </Link>
              <Link 
                href="/account/settings" 
                className="flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                onClick={() => setIsOpen(false)}
              >
                <Settings className="mr-3 h-4 w-4" />
                Settings
              </Link>
            </div>
            <div className="py-1 border-t border-gray-100">
              <button 
                onClick={handleLogout}
                className="flex w-full items-center px-4 py-2 text-sm text-red-600 hover:bg-gray-100"
              >
                <LogOut className="mr-3 h-4 w-4" />
                Logout
              </button>
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
};
