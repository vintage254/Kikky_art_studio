import React from 'react';
import { Gutter } from '@/components/ui/Gutter';
import LoginWrapper from './login-wrapper';

/**
 * Login Page (Server Component)
 * 
 * This server component provides the layout and wraps the client component wrapper
 * to handle client-side dynamic imports properly in Next.js 15.x.
 */
export default function LoginPage() {
  return (
    <div className="py-12">
      <Gutter>
        <h1 className="text-2xl font-bold mb-6 text-center">Login to Your Account</h1>
        <LoginWrapper />
      </Gutter>
    </div>
  );
}
