import type { CollectionConfig } from 'payload'

import { authenticated } from '../access/authenticated'
import { isAdminOrSelf } from '../access/isAdminOrSelf'

export const Orders: CollectionConfig = {
  slug: 'orders',
  access: {
    create: authenticated,
    delete: authenticated,
    read: isAdminOrSelf,
    update: isAdminOrSelf,
  },
  admin: {
    useAsTitle: 'id',
    defaultColumns: ['user', 'total', 'status', 'paymentStatus', 'deliveryStatus', 'createdAt'],
    group: 'E-commerce',
  },
  fields: [
    {
      name: 'user',
      type: 'relationship',
      relationTo: 'users',
      required: true,
      hasMany: false,
      index: true,
    },
    {
      name: 'items',
      type: 'array',
      required: true,
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
          admin: {
            description: 'Price at time of purchase (in smallest currency unit)',
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
        description: 'Total amount charged (in smallest currency unit)',
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
        { label: 'Failed', value: 'failed' },
        { label: 'Shipped', value: 'shipped' },
        { label: 'Delivered', value: 'delivered' },
        { label: 'Canceled', value: 'canceled' },
        { label: 'Refunded', value: 'refunded' },
      ],
      index: true,
    },
    {
      name: 'paymentMethod',
      type: 'select',
      required: true,
      options: [
        { label: 'Stripe', value: 'stripe' },
        { label: 'M-Pesa', value: 'mpesa' },
        { label: 'Pay on Delivery', value: 'pod' },
      ],
    },
    {
      name: 'paymentStatus',
      type: 'select',
      required: true,
      defaultValue: 'pending',
      options: [
        { label: 'Pending', value: 'pending' },
        { label: 'Paid', value: 'paid' },
      ],
      access: {
        update: ({ req: { user } }) => {
          return user?.role === 'admin'
        },
      },
      admin: {
        description: 'For POD orders, mark as paid only when payment is received',
        position: 'sidebar',
      },
      index: true,
    },
    {
      name: 'deliveryStatus',
      type: 'select',
      required: true,
      defaultValue: 'processing',
      options: [
        { label: 'Processing', value: 'processing' },
        { label: 'Shipped', value: 'shipped' },
        { label: 'Delivered', value: 'delivered' },
        { label: 'Cancelled', value: 'cancelled' },
      ],
      access: {
        update: ({ req: { user } }) => {
          return user?.role === 'admin'
        },
      },
      admin: {
        description: 'Track the fulfillment status of the order',
        position: 'sidebar',
      },
      index: true,
    },
    {
      name: 'transactionID',
      type: 'text',
      admin: {
        description: 'Payment processor transaction ID (not applicable for POD)',
        condition: (data) => data.paymentMethod !== 'pod',
      },
    },
    {
      name: 'shippingAddress',
      type: 'group',
      fields: [
        {
          name: 'name',
          type: 'text',
        },
        {
          name: 'line1',
          type: 'text',
        },
        {
          name: 'line2',
          type: 'text',
        },
        {
          name: 'city',
          type: 'text',
        },
        {
          name: 'state',
          type: 'text',
        },
        {
          name: 'postalCode',
          type: 'text',
        },
        {
          name: 'country',
          type: 'text',
        },
      ],
    },
    {
      name: 'notes',
      type: 'textarea',
      admin: {
        description: 'Additional order notes or comments',
      },
    },
  ],
  hooks: {
    beforeChange: [
      // Adjust initial statuses based on payment method
      ({ data }) => {
        // For POD orders, payment status should always start as pending
        if (data.paymentMethod === 'pod') {
          data.paymentStatus = 'pending'
        }
        // For online payments like Stripe/M-Pesa, this might be set in the webhook
        return data
      }
    ],
    afterChange: [
      // You could add notification hooks here (email to admin for POD orders)
    ],
  },
} 