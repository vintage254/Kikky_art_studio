import type { Field } from 'payload'

import {
  BlocksFeature,
  FixedToolbarFeature,
  HeadingFeature,
  InlineToolbarFeature,
  lexicalEditor,
} from '@payloadcms/richtext-lexical'

import { slugField } from '@/fields/slug'
import { MetaDescriptionField, MetaImageField, MetaTitleField, PreviewField } from '@payloadcms/plugin-seo/fields'

export const productFields: Field[] = [
  {
    name: 'title',
    type: 'text',
    required: true,
    index: true,
    admin: {
      description: 'The display name of the product',
    },
  },
  {
    name: 'description',
    type: 'richText',
    editor: lexicalEditor({
      features: ({ rootFeatures }) => {
        return [
          ...rootFeatures,
          HeadingFeature({ enabledHeadingSizes: ['h2', 'h3', 'h4'] }),
          BlocksFeature({}),
          FixedToolbarFeature(),
          InlineToolbarFeature(),
        ]
      },
    }),
  },
  {
    name: 'price',
    type: 'group',
    admin: {
      description: 'Product pricing information',
    },
    fields: [
      {
        name: 'value',
        type: 'number',
        required: true,
        min: 0,
        admin: {
          description: 'Price in the smallest currency unit (e.g., cents for USD)',
        },
      },
      {
        name: 'currency',
        type: 'select',
        required: true,
        defaultValue: 'USD',
        options: [
          {
            label: 'US Dollar ($)',
            value: 'USD',
          },
          {
            label: 'Euro (€)',
            value: 'EUR',
          },
          {
            label: 'Kenyan Shilling (KSh)',
            value: 'KES',
          },
          {
            label: 'British Pound (£)',
            value: 'GBP',
          },
          {
            label: 'Japanese Yen (¥)',
            value: 'JPY',
          },
          {
            label: 'Canadian Dollar (CA$)',
            value: 'CAD',
          },
        ],
        admin: {
          description: 'Select the currency for this product',
        },
      },
    ],
  },
  {
    name: 'images',
    type: 'array',
    label: 'Product Images',
    admin: {
      description: 'Upload one or more images for this product',
    },
    defaultValue: [],
    fields: [
      {
        name: 'image',
        type: 'upload',
        relationTo: 'media',
        required: true,
        filterOptions: {
          mimeType: { contains: 'image' },
        },
      },
    ],
  },
  {
    name: 'category',
    type: 'relationship',
    relationTo: 'categories',
    hasMany: false,
    required: true,
    index: true,
    admin: {
      description: 'Select the product category',
    },
  },
  {
    name: 'isFeatured',
    type: 'checkbox',
    label: 'Featured Product',
    defaultValue: false,
    admin: {
      description: 'Check to display this product in featured sections',
    },
  },
  {
    name: 'stock',
    type: 'number',
    defaultValue: 0,
    admin: {
      description: 'Current inventory stock level',
    },
  },
  {
    name: 'showStock',
    type: 'checkbox',
    label: 'Show Stock in UI',
    defaultValue: true,
    admin: {
      description: 'Whether to display the stock level on the product page',
      position: 'sidebar',
    },
  },
  {
    name: 'sku',
    type: 'text',
    label: 'SKU',
    index: true,
    admin: {
      description: 'Unique product identifier (Stock Keeping Unit)',
    },
  },
  {
    name: 'stripeProductID',
    type: 'text',
    admin: {
      description: 'ID of the corresponding product in Stripe (automatically populated if Stripe is configured)',
      position: 'sidebar',
    },
  },
  {
    name: 'stripePriceID',
    type: 'text',
    admin: {
      description: 'ID of the corresponding price in Stripe (automatically populated if Stripe is configured)',
      position: 'sidebar',
    },
  },
  {
    name: 'isActive',
    type: 'checkbox',
    defaultValue: true,
    admin: {
      description: 'Controls whether this product is available for purchase',
    },
  },
  {
    name: 'meta',
    type: 'group',
    fields: [
      MetaTitleField({
        hasGenerateFn: true,
      }),
      MetaDescriptionField({
        hasGenerateFn: true,
      }),
      MetaImageField({
        relationTo: 'media',
      }),
      PreviewField({
        hasGenerateFn: true,
        titlePath: 'meta.title',
        descriptionPath: 'meta.description',
      }),
    ],
  },
  {
    name: 'relatedProducts',
    type: 'relationship',
    relationTo: 'products',
    hasMany: true,
    required: false, // Explicitly mark as optional to avoid database issues
    admin: {
      description: 'Select products that relate to this one (optional)',
      position: 'sidebar',
    },
    filterOptions: ({ id }) => {
      return {
        id: {
          not_equals: id,
        },
      }
    },
  },
  // Temporarily commenting out the paywall field until properly configured
  // {
  //   name: 'paywall',
  //   type: 'blocks',
  //   admin: {
  //     description: 'Gated content only accessible after purchase',
  //   },
  //   blocks: [],
  // },
  // Properly spread the slugField array
  ...(slugField('title')),
] 