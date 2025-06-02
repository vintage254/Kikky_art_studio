import React, { Suspense } from 'react';
import { Gutter } from '@/components/ui/Gutter';

// Import the client component that will be wrapped in Suspense
import ResetPasswordClient from './reset-password-client';

/**
 * Reset Password Page (Server Component)
 * 
 * This server component provides the layout and wraps the client component
 * in a Suspense boundary to handle useSearchParams() which can only be used
 * in client components. This pattern follows Next.js best practices for
 * static generation.
 */
export default function ResetPasswordPage() {
  return (
    <Gutter className="py-12">
      <div className="max-w-md mx-auto">
        <h1 className="text-3xl font-bold text-center mb-6">Reset Password</h1>
        
        {/* Wrap client component in Suspense to handle useSearchParams() */}
        <Suspense fallback={<div className="text-center py-8">Loading...</div>}>
          <ResetPasswordClient />
        </Suspense>
      </div>
    </Gutter>
  );
}
