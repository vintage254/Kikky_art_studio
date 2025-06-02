import React from 'react';
import { Gutter } from '@/components/ui/Gutter';

// Import the client component with dynamic import to prevent SSR hydration issues
import dynamic from 'next/dynamic';

// Dynamically import the client component with SSR disabled
const SettingsClient = dynamic(() => import('./settings-client'), {
  ssr: false,
  loading: () => <div className="flex flex-col items-center justify-center min-h-[400px]">
    <div className="animate-pulse text-lg">Loading account settings...</div>
  </div>
});

/**
 * Account Settings Page (Server Component)
 * 
 * Renders the account settings interface with profile and password management
 * wrapped in a client component for interactive forms.
 */
export default function SettingsPage() {
  return (
    <Gutter>
      <SettingsClient />
    </Gutter>
  );
}
