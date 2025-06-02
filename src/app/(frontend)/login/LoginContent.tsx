'use client';

import React, { useState } from 'react';
import Link from 'next/link';
import { useRouter, useSearchParams } from 'next/navigation';
import { loginUser } from '@/utilities/auth/client';
import { z } from 'zod';
import { Button } from '@/components/ui/button';

// Form validation schema using Zod
const loginSchema = z.object({
  email: z.string().email('Please enter a valid email address'),
  password: z.string().min(6, 'Password must be at least 6 characters'),
});

type LoginFormValues = z.infer<typeof loginSchema>;

export default function LoginContent() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const redirectTo = searchParams.get('redirect') || '/account';
  
  // Form state
  const [formValues, setFormValues] = useState<LoginFormValues>({
    email: '',
    password: '',
  });
  
  // Error and loading states
  const [errors, setErrors] = useState<Partial<LoginFormValues>>({});
  const [serverError, setServerError] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState<boolean>(false);
  
  // Handle input changes
  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFormValues({
      ...formValues,
      [e.target.name]: e.target.value,
    });
    
    // Clear field error when user starts typing
    if (errors[e.target.name as keyof LoginFormValues]) {
      setErrors({
        ...errors,
        [e.target.name]: undefined,
      });
    }
    
    // Clear server error when user changes anything
    if (serverError) {
      setServerError(null);
    }
  };
  
  // Validate the form
  const validateForm = (): boolean => {
    try {
      loginSchema.parse(formValues);
      setErrors({});
      return true;
    } catch (error) {
      if (error instanceof z.ZodError) {
        const newErrors: Partial<LoginFormValues> = {};
        error.errors.forEach((err) => {
          if (err.path[0]) {
            newErrors[err.path[0] as keyof LoginFormValues] = err.message;
          }
        });
        setErrors(newErrors);
      }
      return false;
    }
  };
  
  // Handle form submission
  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    
    // Validate form
    if (!validateForm()) return;
    
    setIsLoading(true);
    setServerError(null);
    
    try {
      const { user, token, error } = await loginUser(formValues.email, formValues.password);
      
      if (error || !user || !token) {
        setServerError(error || 'Login failed. Please check your credentials and try again.');
        return;
      }
      
      // Set the auth token in cookies (handled by the loginUser function)
      
      // Redirect to the intended destination
      router.push(redirectTo);
    } catch (error) {
      console.error('Login error:', error);
      setServerError('An unexpected error occurred. Please try again later.');
    } finally {
      setIsLoading(false);
    }
  };
  
  return (
    <div className="max-w-md mx-auto bg-white p-8 rounded-lg shadow-md">
      {serverError && (
        <div className="mb-4 p-3 bg-red-100 border border-red-400 text-red-700 rounded">
          {serverError}
        </div>
      )}
      
      <form onSubmit={handleSubmit} className="space-y-4">
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
            value={formValues.email}
            onChange={handleChange}
            className={`w-full px-3 py-2 border rounded-md ${
              errors.email ? 'border-red-500' : 'border-gray-300'
            } focus:outline-none focus:ring-2 focus:ring-blue-500`}
          />
          {errors.email && (
            <p className="mt-1 text-sm text-red-600">{errors.email}</p>
          )}
        </div>
        
        <div>
          <label htmlFor="password" className="block text-sm font-medium text-gray-700 mb-1">
            Password
          </label>
          <input
            id="password"
            name="password"
            type="password"
            autoComplete="current-password"
            required
            value={formValues.password}
            onChange={handleChange}
            className={`w-full px-3 py-2 border rounded-md ${
              errors.password ? 'border-red-500' : 'border-gray-300'
            } focus:outline-none focus:ring-2 focus:ring-blue-500`}
          />
          {errors.password && (
            <p className="mt-1 text-sm text-red-600">{errors.password}</p>
          )}
        </div>
        
        <div className="flex items-center justify-between">
          <div className="flex items-center">
            <input
              id="remember-me"
              name="remember-me"
              type="checkbox"
              className="h-4 w-4 text-blue-600 border-gray-300 rounded focus:ring-blue-500"
            />
            <label htmlFor="remember-me" className="ml-2 block text-sm text-gray-700">
              Remember me
            </label>
          </div>
          
          <div className="text-sm">
            <Link href="/reset-password" className="text-blue-600 hover:text-blue-800">
              Forgot your password?
            </Link>
          </div>
        </div>
        
        <div>
          <Button 
            type="submit" 
            className="w-full flex justify-center"
            disabled={isLoading}
          >
            {isLoading ? 'Logging in...' : 'Log in'}
          </Button>
        </div>
      </form>
      
      <div className="mt-6 text-center">
        <p className="text-sm text-gray-600">
          Don't have an account?{' '}
          <Link href="/register" className="text-blue-600 hover:text-blue-800 font-medium">
            Register here
          </Link>
        </p>
      </div>
    </div>
  );
}
