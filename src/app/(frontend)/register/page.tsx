import React from 'react';
import { Gutter } from '@/components/ui/Gutter';
import RegisterWrapper from './register-wrapper';

/**
 * Register Page (Server Component)
 * 
 * This server component provides the layout and wraps the client component wrapper
 * to handle client-side dynamic imports properly in Next.js 15.x.
 */
export default function RegisterPage() {
  return (
    <Gutter className="py-10">
      <div className="max-w-md mx-auto bg-white p-8 rounded-lg shadow-md">
        <h1 className="text-2xl font-bold mb-6 text-center">Create an Account</h1>
        <RegisterWrapper />
      </div>
    </Gutter>
  );
}
