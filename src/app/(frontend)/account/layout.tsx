'use client';

import React, { useState, useEffect } from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import type { User } from '@/payload-types';
import { Gutter } from '@/components/ui/Gutter';
import { ShoppingBag, User as UserIcon, Package, Settings, X, Menu } from 'lucide-react';

// Account navigation items
const accountNavItems = [
  {
    href: '/account/cart',
    label: 'Cart',
    icon: <ShoppingBag className="h-5 w-5" />,
  },
  {
    href: '/account/orders',
    label: 'Orders',
    icon: <Package className="h-5 w-5" />,
  },
  {
    href: '/account/settings',
    label: 'Settings',
    icon: <Settings className="h-5 w-5" />,
  },
];

export default function AccountLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const pathname = usePathname();
  const [user, setUser] = useState<User | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [isMobileNavOpen, setIsMobileNavOpen] = useState(false);
  
  // Fetch user on mount
  useEffect(() => {
    async function fetchUser() {
      try {
        // Client-side fetch of user data
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
        } else {
          setUser(null);
        }
      } catch (error) {
        console.error('Error fetching user:', error);
        setUser(null);
      } finally {
        setIsLoading(false);
      }
    }
    
    fetchUser();
  }, []);
  
  // Close mobile nav when pathname changes
  useEffect(() => {
    setIsMobileNavOpen(false);
  }, [pathname]);
  
  // Check if a nav item is active
  const isActive = (href: string) => {
    return pathname === href || pathname.startsWith(`${href}/`);
  };
  
  return (
    <div className="flex flex-col min-h-screen">
      {/* Mobile Header with Hamburger */}
      <div className="md:hidden border-b border-gray-200">
        <Gutter className="py-4 flex items-center justify-between">
          <h1 className="text-xl font-bold">My Account</h1>
          <button
            onClick={() => setIsMobileNavOpen(!isMobileNavOpen)}
            className="p-2 text-gray-500 hover:text-gray-700 focus:outline-none"
            aria-label="Toggle navigation menu"
          >
            {isMobileNavOpen ? (
              <X className="h-6 w-6" />
            ) : (
              <Menu className="h-6 w-6" />
            )}
          </button>
        </Gutter>
      </div>
      
      <div className="flex flex-grow">
        {/* Sidebar Navigation - Desktop (visible) and Mobile (conditional) */}
        <div 
          className={`
            ${isMobileNavOpen ? 'block' : 'hidden'} 
            md:block
            w-full md:w-64 md:min-h-screen bg-gray-50 border-r border-gray-200
            fixed md:static top-0 left-0 h-screen md:h-auto z-40
            transition-all duration-300 ease-in-out
          `}
        >
          {/* Mobile Close Button */}
          <div className="md:hidden p-4 border-b border-gray-200 flex justify-between items-center">
            <h2 className="font-bold">Account Menu</h2>
            <button
              onClick={() => setIsMobileNavOpen(false)}
              className="p-2 text-gray-500 hover:text-gray-700 focus:outline-none"
              aria-label="Close navigation menu"
            >
              <X className="h-5 w-5" />
            </button>
          </div>
          
          {/* User Info Section */}
          <div className="p-6 border-b border-gray-200">
            <div className="flex items-center gap-3">
              <div className="bg-gray-200 rounded-full p-2">
                <UserIcon className="h-6 w-6 text-gray-600" />
              </div>
              <div>
                <h2 className="font-medium">
                  {isLoading ? 'Loading...' : user?.name || 'Guest'}
                </h2>
                <p className="text-sm text-gray-500">
                  {isLoading ? '' : user?.email || ''}
                </p>
              </div>
            </div>
          </div>
          
          {/* Navigation Links */}
          <nav className="p-4">
            <ul className="space-y-2">
              {accountNavItems.map((item) => (
                <li key={item.href}>
                  <Link
                    href={item.href}
                    className={`
                      flex items-center gap-3 px-4 py-3 rounded-md
                      ${isActive(item.href)
                        ? 'bg-black text-white'
                        : 'text-gray-700 hover:bg-gray-100'
                      }
                      transition-colors duration-200
                    `}
                  >
                    {item.icon}
                    <span>{item.label}</span>
                  </Link>
                </li>
              ))}
            </ul>
          </nav>
        </div>
        
        {/* Mobile Overlay */}
        {isMobileNavOpen && (
          <div 
            className="md:hidden fixed inset-0 bg-black bg-opacity-50 z-30"
            onClick={() => setIsMobileNavOpen(false)}
          />
        )}
        
        {/* Main Content */}
        <div className="flex-1 p-4 md:p-6">
          <Gutter className="mx-auto max-w-4xl">
            {children}
          </Gutter>
        </div>
      </div>
    </div>
  );
}
