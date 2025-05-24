import type { CollectionConfig } from 'payload';

export const Carts: CollectionConfig = {
  slug: 'carts',
  admin: {
    useAsTitle: 'id',
    defaultColumns: ['id', 'user', 'updatedAt', 'items.length'],
    group: 'Shop',
  },
  access: {
    // Carts should only be accessed by their owners or admins
    create: ({ req: { user } }) => Boolean(user),
    read: ({ req: { user } }) => {
      // Admins can read all carts
      if (user?.role === 'admin') return true;
      
      // Logged in users can only access their own cart
      if (user) {
        return {
          user: {
            equals: user.id,
          },
        };
      }
      
      // No access if not logged in
      return false;
    },
    update: ({ req: { user } }) => {
      // Admins can update all carts
      if (user?.role === 'admin') return true;
      
      // Logged in users can only update their own cart
      if (user) {
        return {
          user: {
            equals: user.id,
          },
        };
      }
      
      // No access if not logged in
      return false;
    },
    delete: ({ req: { user } }) => user?.role === 'admin',
  },
  fields: [
    {
      name: 'user',
      type: 'relationship',
      relationTo: 'users',
      required: true,
      admin: {
        description: 'User who owns this cart',
      },
    },
    {
      name: 'items',
      type: 'array',
      admin: {
        description: 'Items in this cart',
      },
      fields: [
        {
          name: 'product',
          type: 'relationship',
          relationTo: 'products',
          required: true,
        },
        {
          name: 'quantity',
          type: 'number',
          required: true,
          min: 1,
          defaultValue: 1,
        },
        {
          name: 'addedAt',
          type: 'date',
          defaultValue: () => new Date(),
        },
      ],
    },
    {
      name: 'sessionId',
      type: 'text',
      admin: {
        description: 'Session ID for guest carts',
        condition: (data) => !data.user,
      },
    },
    {
      name: 'metadata',
      type: 'json',
      admin: {
        description: 'Additional metadata for the cart',
      },
    },
  ],
  timestamps: true,
  hooks: {
    beforeChange: [
      ({ data, req }) => {
        // Automatically set the user to the current user if logged in
        if (req.user && !data.user) {
          data.user = req.user.id;
        }
        return data;
      },
    ],
  },
};
