import React from 'react';
import { Gutter } from '@/components/ui/Gutter';
import dynamic from 'next/dynamic';

// Use dynamic import for the client component with login logic
const LoginContent = dynamic(() => import('./LoginContent'), {
  loading: () => <div className="text-center py-12">Loading login form...</div>
});

export default function LoginPage() {
  return (
    <div className="py-12">
      <Gutter>
        <h1 className="text-2xl font-bold mb-6 text-center">Login to Your Account</h1>
        
        {/* Using dynamically imported client component */}
        <LoginContent />
      </Gutter>
    </div>
  );
}
