'use client';

import React from 'react';
import { z } from 'zod';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { getLoggedInUser } from '@/utilities/auth/client';
import { useEffect, useState } from 'react';

// Form validation schema
const shippingSchema = z.object({
  name: z.string().min(2, 'Full name is required'),
  email: z.string().email('Please enter a valid email'),
  phone: z.string().min(10, 'Please enter a valid phone number'),
  address: z.string().min(5, 'Address is required'),
  city: z.string().min(2, 'City is required'),
  state: z.string().min(2, 'State/Province is required'),
  zipCode: z.string().min(4, 'Postal/Zip code is required'),
  country: z.string().min(2, 'Country is required'),
});

export type ShippingFormData = z.infer<typeof shippingSchema>;

type ShippingFormProps = {
  onSubmit: (data: ShippingFormData) => void;
  initialData?: Partial<ShippingFormData>;
};

export const ShippingForm: React.FC<ShippingFormProps> = ({ 
  onSubmit,
  initialData = {},
}) => {
  const [isLoading, setIsLoading] = useState(true);
  
  // Fix for TypeScript excessive depth error by using a more direct approach
  // Create form without the complex resolver typing
  const form = useForm({
    // @ts-ignore - Ignoring type checking for the resolver to avoid TS depth issues
    resolver: zodResolver(shippingSchema),
    defaultValues: initialData as any,
  });
  
  // Extract needed methods and properties
  const { register, handleSubmit, formState, reset } = form;
  const { errors } = formState;

  // Fetch user data to pre-fill the form
  useEffect(() => {
    async function fetchUserData() {
      try {
        setIsLoading(true);
        const user = await getLoggedInUser();
        
        if (user) {
          // Set default values from user data (handle potential missing address fields)
          reset({
            name: user.name || '',
            email: user.email || '',
            phone: user.phone || '',
            // Handle cases where User type might not have address properties
            address: (user as any).address?.street || '',
            city: (user as any).address?.city || '',
            state: (user as any).address?.state || '',
            zipCode: (user as any).address?.zipCode || '',
            country: (user as any).address?.country || 'KE',
            ...initialData,
          });
        } else {
          reset(initialData);
        }
      } catch (error) {
        console.error('Error fetching user data:', error);
      } finally {
        setIsLoading(false);
      }
    }
    
    fetchUserData();
  }, [reset, initialData]);

  const submitHandler = (data: ShippingFormData) => {
    onSubmit(data);
  };

  if (isLoading) {
    return (
      <div className="animate-pulse space-y-4">
        <div className="h-10 bg-gray-200 rounded"></div>
        <div className="h-10 bg-gray-200 rounded"></div>
        <div className="h-10 bg-gray-200 rounded"></div>
      </div>
    );
  }

  return (
    <form onSubmit={handleSubmit(submitHandler)} className="space-y-6">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Full Name*
          </label>
          <input
            type="text"
            {...register('name')}
            className={`w-full p-2 border rounded-md focus:ring-2 focus:ring-black focus:border-transparent ${
              errors.name?.message ? 'border-red-500' : 'border-gray-300'
            }`}
            placeholder="Enter your full name"
          />
          {errors.name?.message && (
            <p className="mt-1 text-sm text-red-600">{errors.name.message}</p>
          )}
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Email Address*
          </label>
          <input
            type="email"
            {...register('email')}
            className={`w-full p-2 border rounded-md focus:ring-2 focus:ring-black focus:border-transparent ${
              errors.email?.message ? 'border-red-500' : 'border-gray-300'
            }`}
            placeholder="Enter your email"
          />
          {errors.email?.message && (
            <p className="mt-1 text-sm text-red-600">{errors.email.message}</p>
          )}
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Phone Number*
          </label>
          <input
            type="tel"
            {...register('phone')}
            className={`w-full p-2 border rounded-md focus:ring-2 focus:ring-black focus:border-transparent ${
              errors.phone?.message ? 'border-red-500' : 'border-gray-300'
            }`}
            placeholder="Enter your phone number"
          />
          {errors.phone?.message && (
            <p className="mt-1 text-sm text-red-600">{errors.phone.message}</p>
          )}
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Country*
          </label>
          <select
            {...register('country')}
            className={`w-full p-2 border rounded-md focus:ring-2 focus:ring-black focus:border-transparent ${
              errors.country?.message ? 'border-red-500' : 'border-gray-300'
            }`}
          >
            <option value="">Select a country</option>
            <option value="KE">Kenya</option>
            <option value="US">United States</option>
            <option value="GB">United Kingdom</option>
            <option value="CA">Canada</option>
            <option value="AU">Australia</option>
            <option value="DE">Germany</option>
            <option value="FR">France</option>
            <option value="IT">Italy</option>
            <option value="ES">Spain</option>
            <option value="JP">Japan</option>
          </select>
          {errors.country?.message && (
            <p className="mt-1 text-sm text-red-600">{errors.country.message}</p>
          )}
        </div>

        <div className="md:col-span-2">
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Address*
          </label>
          <input
            type="text"
            {...register('address')}
            className={`w-full p-2 border rounded-md focus:ring-2 focus:ring-black focus:border-transparent ${
              errors.address?.message ? 'border-red-500' : 'border-gray-300'
            }`}
            placeholder="Street address"
          />
          {errors.address?.message && (
            <p className="mt-1 text-sm text-red-600">{errors.address.message}</p>
          )}
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            City*
          </label>
          <input
            type="text"
            {...register('city')}
            className={`w-full p-2 border rounded-md focus:ring-2 focus:ring-black focus:border-transparent ${
              errors.city?.message ? 'border-red-500' : 'border-gray-300'
            }`}
            placeholder="City"
          />
          {errors.city?.message && (
            <p className="mt-1 text-sm text-red-600">{errors.city.message}</p>
          )}
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            State/Province*
          </label>
          <input
            type="text"
            {...register('state')}
            className={`w-full p-2 border rounded-md focus:ring-2 focus:ring-black focus:border-transparent ${
              errors.state?.message ? 'border-red-500' : 'border-gray-300'
            }`}
            placeholder="State/Province"
          />
          {errors.state?.message && (
            <p className="mt-1 text-sm text-red-600">{errors.state.message}</p>
          )}
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Postal/ZIP Code*
          </label>
          <input
            type="text"
            {...register('zipCode')}
            className={`w-full p-2 border rounded-md focus:ring-2 focus:ring-black focus:border-transparent ${
              errors.zipCode?.message ? 'border-red-500' : 'border-gray-300'
            }`}
            placeholder="Postal/ZIP code"
          />
          {errors.zipCode?.message && (
            <p className="mt-1 text-sm text-red-600">{errors.zipCode.message}</p>
          )}
        </div>
      </div>

      <div className="pt-4">
        <button
          type="submit"
          className="w-full bg-black text-white py-3 px-4 rounded-md hover:bg-gray-800 transition-colors"
        >
          Continue to Payment
        </button>
      </div>
    </form>
  );
};
