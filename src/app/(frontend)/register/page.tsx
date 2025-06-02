import React, { Suspense } from 'react';
import { Gutter } from '@/components/ui/Gutter';

/**
 * Register Page (Server Component)
 * 
 * This server component provides the layout and wraps the client component
 * in a Suspense boundary to properly handle React hooks used in the form.
 */
export default function RegisterPage() {
  return (
    <Gutter className="py-10">
      <div className="max-w-md mx-auto bg-white p-8 rounded-lg shadow-md">
        <h1 className="text-2xl font-bold mb-6 text-center">Create an Account</h1>
        
        {/* Client component wrapped in Suspense boundary */}
        <Suspense fallback={<div className="text-center py-8">Loading registration form...</div>}>
          {/* @ts-expect-error - Component will be created in a separate file */}
          <RegisterClient />
        </Suspense>
      </div>
    </Gutter>
  );
}
