import React, { Suspense } from 'react';
import { Gutter } from '@/components/ui/Gutter';

// Import the client component
import AccountClient from './account-client';

/**
 * Account Page (Server Component)
 * 
 * This server component provides the layout and wraps the client component
 * in a Suspense boundary to handle client-side routing.
 */
export default function AccountPage() {
  return (
    <Gutter>
      <div className="flex items-center justify-center py-12">
        <Suspense fallback={<div className="animate-pulse">Loading account...</div>}>
          <AccountClient />
        </Suspense>
      </div>
    </Gutter>
  );
}
