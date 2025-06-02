'use client';

import React from 'react';
import dynamic from 'next/dynamic';

// Dynamically import the client component with SSR disabled in a client component wrapper
const RegisterClient = dynamic(() => import('./register-client'), {
  ssr: false,
  loading: () => (
    <div className="text-center py-8 animate-pulse">
      Loading registration form...
    </div>
  )
});

/**
 * Register Client Wrapper
 * This is a client component that imports the main client component with SSR disabled
 */
export default function RegisterWrapper() {
  return <RegisterClient />;
}
