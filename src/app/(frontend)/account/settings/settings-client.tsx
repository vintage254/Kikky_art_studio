'use client';

import React, { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import type { User } from '@/payload-types';
import { z } from 'zod';
import { Button } from '@/components/ui/button';
import { AlertCircle, Check } from 'lucide-react';

// Import these from existing utilities or recreate them here
const getPayload = async ({ config }: { config: any }) => {
  // Mock implementation - this would need to be properly implemented
  const response = await fetch('/api/users/me', {
    credentials: 'include',
  });
  return {
    update: async ({ collection, id, data }: any) => {
      return fetch(`/api/${collection}/${id}`, {
        method: 'PATCH',
        credentials: 'include',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      }).then(res => res.json());
    },
    login: async ({ collection, data }: any) => {
      return fetch(`/api/${collection}/login`, {
        method: 'POST',
        credentials: 'include',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      }).then(res => res.json());
    }
  };
};

// This would need to be properly implemented
const getLoggedInUser = async (): Promise<User | null> => {
  const response = await fetch('/api/users/me', {
    credentials: 'include',
  });
  if (!response.ok) return null;
  const data = await response.json();
  return data.user;
};

// Mock for config promise
const configPromise = {};

// Form validation schema
const profileSchema = z.object({
  name: z.string().min(2, 'Name must be at least 2 characters'),
  email: z.string().email('Please enter a valid email address'),
  firstName: z.string().optional(),
  lastName: z.string().optional(),
  phone: z.string().optional(),
});

const passwordSchema = z.object({
  currentPassword: z.string().min(1, 'Current password is required'),
  newPassword: z.string().min(8, 'New password must be at least 8 characters'),
  confirmPassword: z.string(),
}).refine(data => data.newPassword === data.confirmPassword, {
  message: "Passwords don't match",
  path: ['confirmPassword'],
});

type ProfileFormValues = z.infer<typeof profileSchema>;
type PasswordFormValues = z.infer<typeof passwordSchema>;

/**
 * Settings Client Component
 * 
 * Handles profile and password updates with form validation
 * and user API interactions.
 */
export default function SettingsClient() {
  const router = useRouter();
  const [user, setUser] = useState<User | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [isSaving, setIsSaving] = useState(false);
  const [isChangingPassword, setIsChangingPassword] = useState(false);
  
  // Form states
  const [profileValues, setProfileValues] = useState<ProfileFormValues>({
    name: '',
    email: '',
    firstName: '',
    lastName: '',
    phone: '',
  });
  
  const [passwordValues, setPasswordValues] = useState<PasswordFormValues>({
    currentPassword: '',
    newPassword: '',
    confirmPassword: '',
  });
  
  // Notification states
  const [profileSuccess, setProfileSuccess] = useState(false);
  const [passwordSuccess, setPasswordSuccess] = useState(false);
  const [profileError, setProfileError] = useState<string | null>(null);
  const [passwordError, setPasswordError] = useState<string | null>(null);
  const [formErrors, setFormErrors] = useState<Record<string, string>>({});
  
  // Fetch user data
  useEffect(() => {
    async function fetchUser() {
      try {
        setIsLoading(true);
        
        // Get the current user using client-side fetch
        const response = await fetch('/api/users/me', {
          method: 'GET',
          credentials: 'include',
          headers: {
            'Content-Type': 'application/json',
          },
        });

        if (!response.ok) {
          router.push('/login');
          return;
        }

        const data = await response.json();
        const currentUser = data.user;
        
        if (!currentUser) {
          router.push('/login');
          return;
        }
        
        setUser(currentUser);
        
        // Initialize form values
        setProfileValues({
          name: currentUser.name || '',
          email: currentUser.email || '',
          firstName: currentUser.firstName || '',
          lastName: currentUser.lastName || '',
          phone: currentUser.phone || '',
        });
      } catch (err) {
        console.error('Error fetching user:', err);
      } finally {
        setIsLoading(false);
      }
    }
    
    fetchUser();
  }, [router]);
  
  // Handle profile form change
  const handleProfileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    
    setProfileValues({
      ...profileValues,
      [name]: value,
    });
    
    // Clear success message when form changes
    if (profileSuccess) {
      setProfileSuccess(false);
    }
    
    // Clear error when field changes
    if (formErrors[name]) {
      setFormErrors({
        ...formErrors,
        [name]: '',
      });
    }
    
    // Clear error message
    if (profileError) {
      setProfileError(null);
    }
  };
  
  // Handle password form change
  const handlePasswordChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    
    setPasswordValues({
      ...passwordValues,
      [name]: value,
    });
    
    // Clear success message when form changes
    if (passwordSuccess) {
      setPasswordSuccess(false);
    }
    
    // Clear error when field changes
    if (formErrors[name]) {
      setFormErrors({
        ...formErrors,
        [name]: '',
      });
    }
    
    // Clear error message
    if (passwordError) {
      setPasswordError(null);
    }
  };
  
  // Validate profile form
  const validateProfileForm = (): boolean => {
    try {
      profileSchema.parse(profileValues);
      setFormErrors({});
      return true;
    } catch (error) {
      if (error instanceof z.ZodError) {
        const newErrors: Record<string, string> = {};
        error.errors.forEach((err) => {
          if (err.path[0]) {
            newErrors[err.path[0] as string] = err.message;
          }
        });
        setFormErrors(newErrors);
      }
      return false;
    }
  };
  
  // Validate password form
  const validatePasswordForm = (): boolean => {
    try {
      passwordSchema.parse(passwordValues);
      setFormErrors({});
      return true;
    } catch (error) {
      if (error instanceof z.ZodError) {
        const newErrors: Record<string, string> = {};
        error.errors.forEach((err) => {
          if (err.path[0]) {
            newErrors[err.path[0] as string] = err.message;
          }
        });
        setFormErrors(newErrors);
      }
      return false;
    }
  };
  
  // Handle profile form submit
  const handleProfileSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    
    // Validate form
    if (!validateProfileForm()) return;
    
    setIsSaving(true);
    setProfileError(null);
    
    try {
      if (!user) {
        throw new Error('User not found');
      }
      
      // Initialize Payload client
      const payload = await getPayload({ config: configPromise });
      
      // Update user profile
      await payload.update({
        collection: 'users',
        id: user.id,
        data: {
          name: profileValues.name,
          firstName: profileValues.firstName,
          lastName: profileValues.lastName,
          phone: profileValues.phone,
        },
      });
      
      // Show success message
      setProfileSuccess(true);
      
      // Refresh user data
      const updatedUser = await getLoggedInUser();
      setUser(updatedUser);
      
      // Scroll to top
      window.scrollTo(0, 0);
    } catch (err) {
      console.error('Error updating profile:', err);
      setProfileError('Failed to update profile. Please try again later.');
    } finally {
      setIsSaving(false);
    }
  };
  
  // Handle password form submit
  const handlePasswordSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    
    // Validate form
    if (!validatePasswordForm()) return;
    
    setIsChangingPassword(true);
    setPasswordError(null);
    
    try {
      if (!user) {
        throw new Error('User not found');
      }
      
      // Initialize Payload client
      const payload = await getPayload({ config: configPromise });
      
      // Update user password
      await payload.login({
        collection: 'users',
        data: {
          email: user.email,
          password: passwordValues.currentPassword,
        },
      });
      
      // If login succeeds, update password
      await payload.update({
        collection: 'users',
        id: user.id,
        data: {
          password: passwordValues.newPassword,
        },
      });
      
      // Reset password form
      setPasswordValues({
        currentPassword: '',
        newPassword: '',
        confirmPassword: '',
      });
      
      // Show success message
      setPasswordSuccess(true);
      
      // Scroll to password section
      document.getElementById('password-section')?.scrollIntoView({ behavior: 'smooth' });
    } catch (err) {
      console.error('Error changing password:', err);
      setPasswordError('Failed to change password. Please check your current password and try again.');
    } finally {
      setIsChangingPassword(false);
    }
  };
  
  if (isLoading) {
    return (
      <div className="flex flex-col items-center justify-center min-h-[400px]">
        <div className="animate-pulse text-lg">Loading your profile...</div>
      </div>
    );
  }
  
  return (
    <div className="space-y-12">
      <div>
        <h1 className="text-2xl font-bold mb-2">Account Settings</h1>
        <p className="text-gray-500">
          Manage your profile information and preferences
        </p>
      </div>
      
      {/* Profile Information Section */}
      <div className="bg-white rounded-lg border border-gray-200 overflow-hidden">
        <div className="border-b border-gray-200 bg-gray-50 px-6 py-4">
          <h2 className="font-medium">Profile Information</h2>
        </div>
        
        {profileSuccess && (
          <div className="bg-green-50 p-4 flex items-start">
            <Check className="h-5 w-5 text-green-500 mt-0.5 mr-2" />
            <div>
              <h3 className="text-green-800 font-medium">Profile updated successfully</h3>
              <p className="text-green-700 text-sm">Your profile information has been updated.</p>
            </div>
          </div>
        )}
        
        {profileError && (
          <div className="bg-red-50 p-4 flex items-start">
            <AlertCircle className="h-5 w-5 text-red-500 mt-0.5 mr-2" />
            <div>
              <h3 className="text-red-800 font-medium">Error updating profile</h3>
              <p className="text-red-700 text-sm">{profileError}</p>
            </div>
          </div>
        )}
        
        <div className="p-6">
          <form onSubmit={handleProfileSubmit} className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label htmlFor="name" className="block text-sm font-medium text-gray-700 mb-1">
                  Full Name*
                </label>
                <input
                  id="name"
                  name="name"
                  type="text"
                  required
                  value={profileValues.name}
                  onChange={handleProfileChange}
                  className={`w-full px-3 py-2 border rounded-md ${
                    formErrors.name ? 'border-red-500' : 'border-gray-300'
                  } focus:outline-none focus:ring-2 focus:ring-blue-500`}
                />
                {formErrors.name && (
                  <p className="mt-1 text-sm text-red-600">{formErrors.name}</p>
                )}
              </div>
              
              <div>
                <label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-1">
                  Email Address*
                </label>
                <input
                  id="email"
                  name="email"
                  type="email"
                  required
                  value={profileValues.email}
                  onChange={handleProfileChange}
                  disabled // Email cannot be changed
                  className="w-full px-3 py-2 border rounded-md border-gray-300 bg-gray-50 cursor-not-allowed"
                />
                <p className="mt-1 text-xs text-gray-500">Email address cannot be changed</p>
              </div>
              
              <div>
                <label htmlFor="firstName" className="block text-sm font-medium text-gray-700 mb-1">
                  First Name
                </label>
                <input
                  id="firstName"
                  name="firstName"
                  type="text"
                  value={profileValues.firstName || ''}
                  onChange={handleProfileChange}
                  className="w-full px-3 py-2 border rounded-md border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
              </div>
              
              <div>
                <label htmlFor="lastName" className="block text-sm font-medium text-gray-700 mb-1">
                  Last Name
                </label>
                <input
                  id="lastName"
                  name="lastName"
                  type="text"
                  value={profileValues.lastName || ''}
                  onChange={handleProfileChange}
                  className="w-full px-3 py-2 border rounded-md border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
              </div>
              
              <div>
                <label htmlFor="phone" className="block text-sm font-medium text-gray-700 mb-1">
                  Phone Number
                </label>
                <input
                  id="phone"
                  name="phone"
                  type="tel"
                  value={profileValues.phone || ''}
                  onChange={handleProfileChange}
                  className="w-full px-3 py-2 border rounded-md border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
              </div>
            </div>
            
            <div>
              <Button 
                type="submit" 
                className="py-2 px-4"
                disabled={isSaving}
              >
                {isSaving ? 'Saving...' : 'Save Changes'}
              </Button>
            </div>
          </form>
        </div>
      </div>
      
      {/* Password Section */}
      <div id="password-section" className="bg-white rounded-lg border border-gray-200 overflow-hidden">
        <div className="border-b border-gray-200 bg-gray-50 px-6 py-4">
          <h2 className="font-medium">Change Password</h2>
        </div>
        
        {passwordSuccess && (
          <div className="bg-green-50 p-4 flex items-start">
            <Check className="h-5 w-5 text-green-500 mt-0.5 mr-2" />
            <div>
              <h3 className="text-green-800 font-medium">Password updated successfully</h3>
              <p className="text-green-700 text-sm">Your password has been changed.</p>
            </div>
          </div>
        )}
        
        {passwordError && (
          <div className="bg-red-50 p-4 flex items-start">
            <AlertCircle className="h-5 w-5 text-red-500 mt-0.5 mr-2" />
            <div>
              <h3 className="text-red-800 font-medium">Error changing password</h3>
              <p className="text-red-700 text-sm">{passwordError}</p>
            </div>
          </div>
        )}
        
        <div className="p-6">
          <form onSubmit={handlePasswordSubmit} className="space-y-6">
            <div className="space-y-4">
              <div>
                <label htmlFor="currentPassword" className="block text-sm font-medium text-gray-700 mb-1">
                  Current Password*
                </label>
                <input
                  id="currentPassword"
                  name="currentPassword"
                  type="password"
                  required
                  value={passwordValues.currentPassword}
                  onChange={handlePasswordChange}
                  className={`w-full px-3 py-2 border rounded-md ${
                    formErrors.currentPassword ? 'border-red-500' : 'border-gray-300'
                  } focus:outline-none focus:ring-2 focus:ring-blue-500`}
                />
                {formErrors.currentPassword && (
                  <p className="mt-1 text-sm text-red-600">{formErrors.currentPassword}</p>
                )}
              </div>
              
              <div>
                <label htmlFor="newPassword" className="block text-sm font-medium text-gray-700 mb-1">
                  New Password*
                </label>
                <input
                  id="newPassword"
                  name="newPassword"
                  type="password"
                  required
                  value={passwordValues.newPassword}
                  onChange={handlePasswordChange}
                  className={`w-full px-3 py-2 border rounded-md ${
                    formErrors.newPassword ? 'border-red-500' : 'border-gray-300'
                  } focus:outline-none focus:ring-2 focus:ring-blue-500`}
                />
                {formErrors.newPassword && (
                  <p className="mt-1 text-sm text-red-600">{formErrors.newPassword}</p>
                )}
              </div>
              
              <div>
                <label htmlFor="confirmPassword" className="block text-sm font-medium text-gray-700 mb-1">
                  Confirm New Password*
                </label>
                <input
                  id="confirmPassword"
                  name="confirmPassword"
                  type="password"
                  required
                  value={passwordValues.confirmPassword}
                  onChange={handlePasswordChange}
                  className={`w-full px-3 py-2 border rounded-md ${
                    formErrors.confirmPassword ? 'border-red-500' : 'border-gray-300'
                  } focus:outline-none focus:ring-2 focus:ring-blue-500`}
                />
                {formErrors.confirmPassword && (
                  <p className="mt-1 text-sm text-red-600">{formErrors.confirmPassword}</p>
                )}
              </div>
            </div>
            
            <div>
              <Button 
                type="submit" 
                className="py-2 px-4"
                disabled={isChangingPassword}
              >
                {isChangingPassword ? 'Changing Password...' : 'Change Password'}
              </Button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}
