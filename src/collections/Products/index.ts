import type { CollectionConfig } from 'payload'

import { anyone } from '../../access/anyone'
import { authenticated } from '../../access/authenticated'
import { slugField } from '@/fields/slug'
import { productFields } from './fields'
import { afterChangeHook } from './hooks'
import { productsAccess } from './access'

export const Products: CollectionConfig = {
  slug: 'products',
  access: productsAccess,
  admin: {
    useAsTitle: 'title',
    defaultColumns: ['title', 'price', 'category', 'isFeatured', 'stock', 'createdAt'],
    group: 'E-commerce',
    description: 'Product catalog. Stripe integration is optional and only active when STRIPE_SECRET_KEY is configured.',
  },
  versions: {
    drafts: true,
  },
  fields: productFields,
  hooks: {
    afterChange: [afterChangeHook],
  },
} 