'use client';

import React, { useState } from 'react';
import Link from 'next/link';
import { useRouter, useSearchParams } from 'next/navigation';
import { z } from 'zod';
import { Button } from '@/components/ui/button';

// Form validation schema for request
const requestSchema = z.object({
  email: z.string().email('Please enter a valid email address'),
});

// Form validation schema for reset
const resetSchema = z.object({
  password: z.string().min(8, 'Password must be at least 8 characters'),
  confirmPassword: z.string(),
}).refine(data => data.password === data.confirmPassword, {
  message: "Passwords don't match",
  path: ['confirmPassword'],
});

interface ResetPasswordResponse {
  success: boolean;
  error?: string;
}

// Helper functions for authentication
const requestPasswordReset = async (email: string): Promise<ResetPasswordResponse> => {
  try {
    const res = await fetch('/api/users/forgot-password', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ email }),
    });
    
    const data = await res.json();
    return data;
  } catch (error) {
    console.error('Error requesting password reset:', error);
    return { success: false, error: 'Failed to connect to server' };
  }
};

const resetPassword = async (token: string, password: string): Promise<ResetPasswordResponse> => {
  try {
    const res = await fetch('/api/users/reset-password', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ token, password }),
    });
    
    const data = await res.json();
    return data;
  } catch (error) {
    console.error('Error resetting password:', error);
    return { success: false, error: 'Failed to connect to server' };
  }
};

export default function ResetPasswordClient() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const token = searchParams.get('token');
  
  // Determine if we're in request mode or reset mode
  const isResetMode = !!token;
  
  // Form state
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  
  // UI state
  const [errors, setErrors] = useState<Record<string, string>>({});
  const [serverError, setServerError] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const [isSuccess, setIsSuccess] = useState<boolean>(false);
  
  // Validate the request form
  const validateRequestForm = (): boolean => {
    try {
      requestSchema.parse({ email });
      setErrors({});
      return true;
    } catch (error) {
      if (error instanceof z.ZodError) {
        const newErrors: Record<string, string> = {};
        error.errors.forEach((err) => {
          if (err.path[0]) {
            newErrors[err.path[0] as string] = err.message;
          }
        });
        setErrors(newErrors);
      }
      return false;
    }
  };
  
  // Validate the reset form
  const validateResetForm = (): boolean => {
    try {
      resetSchema.parse({ password, confirmPassword });
      setErrors({});
      return true;
    } catch (error) {
      if (error instanceof z.ZodError) {
        const newErrors: Record<string, string> = {};
        error.errors.forEach((err) => {
          if (err.path[0]) {
            newErrors[err.path[0] as string] = err.message;
          }
        });
        setErrors(newErrors);
      }
      return false;
    }
  };
  
  // Handle request form submission
  const handleRequestSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    
    // Validate form
    if (!validateRequestForm()) return;
    
    setIsLoading(true);
    setServerError(null);
    
    try {
      const { success, error } = await requestPasswordReset(email);
      
      if (!success) {
        setServerError(error || 'Failed to request password reset. Please try again.');
        return;
      }
      
      setIsSuccess(true);
    } catch (error) {
      console.error('Password reset request error:', error);
      setServerError('An unexpected error occurred. Please try again later.');
    } finally {
      setIsLoading(false);
    }
  };
  
  // Handle reset form submission
  const handleResetSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    
    // Validate form
    if (!validateResetForm()) return;
    
    setIsLoading(true);
    setServerError(null);
    
    try {
      if (!token) {
        setServerError('Reset token is missing. Please use the link from your email.');
        return;
      }
      
      const { success, error } = await resetPassword(token, password);
      
      if (!success) {
        setServerError(error || 'Failed to reset password. The link may have expired.');
        return;
      }
      
      setIsSuccess(true);
      
      // Redirect to login after a delay
      setTimeout(() => {
        router.push('/login');
      }, 3000);
    } catch (error) {
      console.error('Password reset error:', error);
      setServerError('An unexpected error occurred. Please try again later.');
    } finally {
      setIsLoading(false);
    }
  };
  
  return (
    <div className="bg-white p-8 rounded-lg shadow-md">
      <h2 className="text-2xl font-bold mb-6 text-center">
        {isResetMode ? 'Reset Your Password' : 'Forgot Your Password?'}
      </h2>
      
      {isSuccess ? (
        <div className="bg-green-100 border border-green-400 text-green-700 p-4 rounded mb-4">
          {isResetMode
            ? 'Your password has been reset successfully! Redirecting to login...'
            : 'A password reset link has been sent to your email. Please check your inbox.'}
        </div>
      ) : (
        <>
          {serverError && (
            <div className="bg-red-100 border border-red-400 text-red-700 p-4 rounded mb-4">
              {serverError}
            </div>
          )}
          
          {isResetMode ? (
            // Reset password form
            <form onSubmit={handleResetSubmit} className="space-y-4">
              <div>
                <label htmlFor="password" className="block text-sm font-medium text-gray-700 mb-1">
                  New Password
                </label>
                <input
                  id="password"
                  name="password"
                  type="password"
                  autoComplete="new-password"
                  required
                  value={password}
                  onChange={(e) => {
                    setPassword(e.target.value);
                    if (errors.password) setErrors({ ...errors, password: '' });
                  }}
                  className={`w-full px-3 py-2 border rounded-md ${
                    errors.password ? 'border-red-500' : 'border-gray-300'
                  } focus:outline-none focus:ring-2 focus:ring-blue-500`}
                />
                {errors.password && (
                  <p className="mt-1 text-sm text-red-600">{errors.password}</p>
                )}
              </div>
              
              <div>
                <label htmlFor="confirmPassword" className="block text-sm font-medium text-gray-700 mb-1">
                  Confirm New Password
                </label>
                <input
                  id="confirmPassword"
                  name="confirmPassword"
                  type="password"
                  autoComplete="new-password"
                  required
                  value={confirmPassword}
                  onChange={(e) => {
                    setConfirmPassword(e.target.value);
                    if (errors.confirmPassword) setErrors({ ...errors, confirmPassword: '' });
                  }}
                  className={`w-full px-3 py-2 border rounded-md ${
                    errors.confirmPassword ? 'border-red-500' : 'border-gray-300'
                  } focus:outline-none focus:ring-2 focus:ring-blue-500`}
                />
                {errors.confirmPassword && (
                  <p className="mt-1 text-sm text-red-600">{errors.confirmPassword}</p>
                )}
              </div>
              
              <div>
                <Button 
                  type="submit" 
                  className="w-full flex justify-center"
                  disabled={isLoading}
                >
                  {isLoading ? 'Resetting Password...' : 'Reset Password'}
                </Button>
              </div>
            </form>
          ) : (
            // Request password reset form
            <form onSubmit={handleRequestSubmit} className="space-y-4">
              <div>
                <label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-1">
                  Email Address
                </label>
                <input
                  id="email"
                  name="email"
                  type="email"
                  autoComplete="email"
                  required
                  value={email}
                  onChange={(e) => {
                    setEmail(e.target.value);
                    if (errors.email) setErrors({ ...errors, email: '' });
                  }}
                  className={`w-full px-3 py-2 border rounded-md ${
                    errors.email ? 'border-red-500' : 'border-gray-300'
                  } focus:outline-none focus:ring-2 focus:ring-blue-500`}
                />
                {errors.email && (
                  <p className="mt-1 text-sm text-red-600">{errors.email}</p>
                )}
              </div>
              
              <div>
                <Button 
                  type="submit" 
                  className="w-full flex justify-center"
                  disabled={isLoading}
                >
                  {isLoading ? 'Sending Reset Link...' : 'Send Reset Link'}
                </Button>
              </div>
            </form>
          )}
        </>
      )}
      
      <div className="mt-6 text-center">
        <p className="text-sm text-gray-600">
          Remember your password?{' '}
          <Link href="/login" className="text-blue-600 hover:text-blue-800 font-medium">
            Log in here
          </Link>
        </p>
      </div>
    </div>
  );
}