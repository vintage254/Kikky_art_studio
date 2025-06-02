'use client';

import React from 'react';
import dynamic from 'next/dynamic';

// Dynamically import the client component with SSR disabled in a client component wrapper
const SettingsClient = dynamic(() => import('./settings-client'), {
  ssr: false,
  loading: () => (
    <div className="flex flex-col items-center justify-center min-h-[400px]">
      <div className="animate-pulse text-lg">Loading account settings...</div>
    </div>
  )
});

/**
 * Settings Client Wrapper
 * This is a client component that imports the main client component with SSR disabled
 */
export default function SettingsWrapper() {
  return <SettingsClient />;
}
