'use client';

import React, { useState } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { registerUser } from '@/utilities/auth/client';
import { z } from 'zod';
import { Gutter } from '@/components/ui/Gutter';
import { Button } from '@/components/ui/button';

// Form validation schema using Zod
const registerSchema = z.object({
  name: z.string().min(2, 'Name must be at least 2 characters'),
  email: z.string().email('Please enter a valid email address'),
  password: z.string().min(8, 'Password must be at least 8 characters'),
  confirmPassword: z.string(),
}).refine(data => data.password === data.confirmPassword, {
  message: "Passwords don't match",
  path: ['confirmPassword'],
});

type RegisterFormValues = z.infer<typeof registerSchema>;

export default function RegisterPage() {
  const router = useRouter();
  
  // Form state
  const [formValues, setFormValues] = useState<RegisterFormValues>({
    name: '',
    email: '',
    password: '',
    confirmPassword: '',
  });
  
  // Error and loading states
  const [errors, setErrors] = useState<Partial<RegisterFormValues>>({});
  const [serverError, setServerError] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState<boolean>(false);
  
  // Handle input changes
  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFormValues({
      ...formValues,
      [e.target.name]: e.target.value,
    });
    
    // Clear field error when user starts typing
    if (errors[e.target.name as keyof RegisterFormValues]) {
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
      registerSchema.parse(formValues);
      setErrors({});
      return true;
    } catch (error) {
      if (error instanceof z.ZodError) {
        const newErrors: Partial<RegisterFormValues> = {};
        error.errors.forEach((err) => {
          if (err.path[0]) {
            newErrors[err.path[0] as keyof RegisterFormValues] = err.message;
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
      const { user, token, error } = await registerUser({
        name: formValues.name,
        email: formValues.email,
        password: formValues.password,
      });
      
      if (error || !user || !token) {
        setServerError(error || 'Registration failed. Please try again with a different email.');
        return;
      }
      
      // Set the auth token in cookies (handled by the registerUser function)
      
      // Redirect to the account page
      router.push('/account');
    } catch (error) {
      console.error('Registration error:', error);
      setServerError('An unexpected error occurred. Please try again later.');
    } finally {
      setIsLoading(false);
    }
  };
  
  return (
    <Gutter className="py-10">
      <div className="max-w-md mx-auto bg-white p-8 rounded-lg shadow-md">
        <h1 className="text-2xl font-bold mb-6 text-center">Create an Account</h1>
        
        {serverError && (
          <div className="mb-4 p-3 bg-red-100 border border-red-400 text-red-700 rounded">
            {serverError}
          </div>
        )}
        
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label htmlFor="name" className="block text-sm font-medium text-gray-700 mb-1">
              Full Name
            </label>
            <input
              id="name"
              name="name"
              type="text"
              autoComplete="name"
              required
              value={formValues.name}
              onChange={handleChange}
              className={`w-full px-3 py-2 border rounded-md ${
                errors.name ? 'border-red-500' : 'border-gray-300'
              } focus:outline-none focus:ring-2 focus:ring-blue-500`}
            />
            {errors.name && (
              <p className="mt-1 text-sm text-red-600">{errors.name}</p>
            )}
          </div>
          
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
              autoComplete="new-password"
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
          
          <div>
            <label htmlFor="confirmPassword" className="block text-sm font-medium text-gray-700 mb-1">
              Confirm Password
            </label>
            <input
              id="confirmPassword"
              name="confirmPassword"
              type="password"
              autoComplete="new-password"
              required
              value={formValues.confirmPassword}
              onChange={handleChange}
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
              {isLoading ? 'Creating account...' : 'Register'}
            </Button>
          </div>
        </form>
        
        <div className="mt-6 text-center">
          <p className="text-sm text-gray-600">
            Already have an account?{' '}
            <Link href="/login" className="text-blue-600 hover:text-blue-800 font-medium">
              Log in here
            </Link>
          </p>
        </div>
      </div>
    </Gutter>
  );
}
