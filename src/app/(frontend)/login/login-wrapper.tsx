'use client';

import React from 'react';
import dynamic from 'next/dynamic';

// Dynamically import the client component with SSR disabled in a client component wrapper
const LoginContent = dynamic(() => import('./LoginContent'), {
  ssr: false,
  loading: () => (
    <div className="text-center py-12 animate-pulse">
      Loading login form...
    </div>
  )
});

/**
 * Login Client Wrapper
 * This is a client component that imports the main client component with SSR disabled
 */
export default function LoginWrapper() {
  return <LoginContent />;
}
