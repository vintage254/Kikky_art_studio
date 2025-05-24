import type { CollectionConfig } from 'payload'
import { authenticated } from '../../access/authenticated'

export const Users: CollectionConfig = {
  slug: 'users',
  access: {
    admin: authenticated,
    // Allow anyone to create an account (registration)
    create: () => true,
    delete: authenticated,
    // Allow users to read their own document
    read: ({ req: { user } }) => {
      if (user?.role === 'admin') return true
      return {
        id: {
          equals: user?.id,
        },
      }
    },
    // Allow users to update their own document
    update: ({ req: { user } }) => {
      if (user?.role === 'admin') return true
      return {
        id: {
          equals: user?.id,
        },
      }
    },
  },
  admin: {
    defaultColumns: ['name', 'email', 'role'],
    useAsTitle: 'name',
    group: 'Shop',
  },
  auth: {
    // Enable email/password authentication
    tokenExpiration: 7 * 24 * 60 * 60, // 7 days
    verify: true,
    maxLoginAttempts: 5,
    lockTime: 10 * 60 * 1000, // 10 minutes
    // We'll implement Google OAuth separately via next-auth
  },
  fields: [
    {
      name: 'name',
      type: 'text',
      required: true,
    },
    {
      name: 'firstName',
      type: 'text',
      admin: {
        description: 'First name for shipping and billing',
      },
    },
    {
      name: 'lastName',
      type: 'text',
      admin: {
        description: 'Last name for shipping and billing',
      },
    },
    {
      name: 'phone',
      type: 'text',
      admin: {
        description: 'Phone number for order notifications',
      },
    },
    {
      name: 'orders',
      type: 'relationship',
      relationTo: 'orders',
      hasMany: true,
      admin: {
        description: 'Orders placed by this user',
        readOnly: true,
      },
    },
    {
      name: 'role',
      type: 'select',
      defaultValue: 'customer',
      options: [
        { label: 'Admin', value: 'admin' },
        { label: 'Customer', value: 'customer' },
      ],
      access: {
        // Only admins can change roles
        update: ({ req: { user } }) => {
          return user?.role === 'admin'
        },
      },
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'shippingAddresses',
      type: 'array',
      admin: {
        description: 'Saved shipping addresses',
      },
      fields: [
        {
          name: 'addressName',
          type: 'text',
          admin: {
            description: 'Name for this address (e.g. Home, Work)',
          },
        },
        {
          name: 'street',
          type: 'text',
        },
        {
          name: 'city',
          type: 'text',
        },
        {
          name: 'county',
          type: 'text',
        },
        {
          name: 'isDefault',
          type: 'checkbox',
          defaultValue: false,
        },
      ],
    },
  ],
  timestamps: true,
  hooks: {
    afterChange: [
      // You can add hooks here for password reset, verification emails, etc.
    ],
  },
}
