import type { CollectionConfig } from 'payload'

import {
  FixedToolbarFeature,
  InlineToolbarFeature,
  lexicalEditor,
} from '@payloadcms/richtext-lexical'

import { anyone } from '../access/anyone'
import { authenticated } from '../access/authenticated'
import { setCorrectMimeType, validateMimeType } from '../hooks/mediaHooks'

export const Media: CollectionConfig = {
  slug: 'media',
  access: {
    create: authenticated,
    delete: authenticated,
    read: anyone,
    update: authenticated,
  },
  hooks: {
    beforeChange: [setCorrectMimeType, validateMimeType],
  },
  fields: [
    {
      name: 'alt',
      type: 'text',
      required: false,
    },
    {
      name: 'caption',
      type: 'richText',
      editor: lexicalEditor({
        features: ({ rootFeatures }) => {
          return [...rootFeatures, FixedToolbarFeature(), InlineToolbarFeature()]
        },
      }),
    },
  ],
  upload: {
    adminThumbnail: 'thumbnail',
    mimeTypes: ['image/*', 'video/*'],
    cacheTags: false,
    focalPoint: true, // Corrected from { enabled: true }
    imageSizes: [
      {
        name: 'thumbnail',
        width: 300,
        height: 300,
        position: 'centre',
      },
      {
        name: 'square',
        width: 500,
        height: 500,
        position: 'centre',
      },
      {
        name: 'small',
        width: 600,
        height: 400,
        position: 'centre',
      },
      {
        name: 'medium',
        width: 900,
        height: 600,
        position: 'centre',
      },
      {
        name: 'large',
        width: 1400,
        height: 933,
        position: 'centre',
      },
      {
        name: 'xlarge',
        width: 1920,
        height: 1280,
        position: 'centre',
      },
      {
        name: 'og',
        width: 1200,
        height: 630,
        position: 'centre',
      },
    ],
  },
}
