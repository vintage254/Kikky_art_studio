import type { CollectionConfig } from 'payload';

export const Orders: CollectionConfig = {
  slug: 'orders',
  admin: {
    useAsTitle: 'orderNumber',
    defaultColumns: ['orderNumber', 'customer', 'status', 'createdAt', 'total'],
    group: 'Shop',
  },
  access: {
    // Admin can do everything
    create: ({ req: { user } }) => user?.role === 'admin',
    read: ({ req: { user } }) => {
      // Admin can read all orders
      if (user?.role === 'admin') return true;
      
      // Customers can only read their own orders
      if (user) {
        return {
          customer: {
            equals: user.id,
          },
        };
      }
      
      // No access if not logged in
      return false;
    },
    update: ({ req: { user } }) => user?.role === 'admin',
    delete: ({ req: { user } }) => user?.role === 'admin',
  },
  fields: [
    {
      name: 'orderNumber',
      type: 'text',
      admin: {
        description: 'Unique order identifier',
      },
      hooks: {
        beforeValidate: [
          ({ data }) => {
            if (data && !data.orderNumber) {
              // Generate unique order number with prefix 'ORD-' followed by timestamp and random string
              return `ORD-${Date.now().toString(36)}-${Math.random().toString(36).substring(2, 7).toUpperCase()}`;
            }
            return data?.orderNumber || '';
          }
        ]
      }
    },
    {
      name: 'customer',
      type: 'relationship',
      relationTo: 'users',
      required: true,
      admin: {
        description: 'Customer who placed this order',
      },
    },
    {
      name: 'items',
      type: 'array',
      required: true,
      admin: {
        description: 'Products included in this order',
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
          name: 'price',
          type: 'number',
          required: true,
          min: 0,
        },
        {
          name: 'productSnapshot',
          type: 'json',
          admin: {
            description: 'Snapshot of product at time of purchase (in case product changes later)',
          },
        },
      ],
    },
    {
      name: 'total',
      type: 'number',
      required: true,
      min: 0,
      admin: {
        description: 'Total amount for this order',
      },
    },
    {
      name: 'status',
      type: 'select',
      required: true,
      defaultValue: 'pending',
      options: [
        { label: 'Pending', value: 'pending' },
        { label: 'Processing', value: 'processing' },
        { label: 'Paid', value: 'paid' },
        { label: 'Shipped', value: 'shipped' },
        { label: 'Delivered', value: 'delivered' },
        { label: 'Cancelled', value: 'cancelled' },
      ],
    },
    {
      name: 'paymentMethod',
      type: 'select',
      required: true,
      options: [
        { label: 'M-Pesa', value: 'mpesa' },
        { label: 'Pay on Delivery', value: 'pod' },
      ],
    },
    {
      name: 'paymentDetails',
      type: 'group',
      admin: {
        description: 'Payment details for this order',
        condition: (data) => data.paymentMethod === 'mpesa',
      },
      fields: [
        {
          name: 'transactionId',
          type: 'text',
          admin: {
            description: 'M-Pesa transaction ID',
          },
        },
        {
          name: 'phoneNumber',
          type: 'text',
          admin: {
            description: 'Phone number used for payment',
          },
        },
        {
          name: 'paidAt',
          type: 'date',
          admin: {
            description: 'When payment was confirmed',
          },
        },
      ],
    },
    {
      name: 'shippingAddress',
      type: 'group',
      admin: {
        description: 'Where to ship this order',
      },
      fields: [
        {
          name: 'name',
          type: 'text',
          required: true,
        },
        {
          name: 'street',
          type: 'text',
          required: true,
        },
        {
          name: 'city',
          type: 'text',
          required: true,
        },
        {
          name: 'county',
          type: 'text',
          required: true,
        },
        {
          name: 'phoneNumber',
          type: 'text',
          required: true,
        },
      ],
    },
    {
      name: 'notes',
      type: 'textarea',
      admin: {
        description: 'Additional notes for this order',
      },
    },
  ],
  timestamps: true,
  hooks: {
    afterChange: [
      // Here you could add hooks for:
      // - Sending order confirmation emails
      // - Updating inventory
      // - Notifying admins of new orders
    ],
  },
};
