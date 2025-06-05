// Storage adapter imports
import { cloudinaryStorage } from 'payload-cloudinary'
import { postgresAdapter } from '@payloadcms/db-postgres'
// Import both client and serverless adapters
import { createNeonServerlessAdapter } from './utilities/database/neon-serverless-adapter'

import sharp from 'sharp' // sharp-import
import path from 'path'
import { buildConfig, PayloadRequest } from 'payload'
import { fileURLToPath } from 'url'

import { Categories } from './collections/Categories'
import { Media } from './collections/Media'
import { Pages } from './collections/Pages'
import { Posts } from './collections/Posts'
import { Products } from './collections/Products'
import { Orders } from './collections/Orders'
import { Carts } from './collections/Carts'
import { Users } from './collections/Users'
import { Footer } from './Footer/config'
import { Header } from './Header/config'
import { plugins } from './plugins'
import { paymentWebhooks } from './endpoints'
import { defaultLexical } from '@/fields/defaultLexical'
import { getServerSideURL } from './utilities/getURL'

const filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(filename)

export default buildConfig({
  serverURL: getServerSideURL(),

  // Configure CSRF protection (array of trusted origins)
  csrf: [
    // Allow same-origin requests
    'http://localhost:3000',
    'http://localhost:3001',
    // Add your production URL
    'https://kikky-art-studio.vercel.app',
    // Also include the environment variable if it exists
    ...(process.env.NEXT_PUBLIC_SERVER_URL ? [process.env.NEXT_PUBLIC_SERVER_URL] : []),
  ],

  // Update CORS configuration to allow requests from both frontend and admin
  cors: [
    // Development URLs
    'http://localhost:3000',
    'http://localhost:3001',
    // Production URL
    'https://kikky-art-studio.vercel.app',
    // Also include the environment variable if it exists
    ...(process.env.NEXT_PUBLIC_SERVER_URL ? [process.env.NEXT_PUBLIC_SERVER_URL] : []),
  ],

  admin: {
    components: {
      // The `BeforeLogin` component renders a message that you see while logging into your admin panel.
      // Feel free to delete this at any time. Simply remove the line below and the import `BeforeLogin` statement on line 15.
      beforeLogin: ['@/components/BeforeLogin'],
      // The `BeforeDashboard` component renders the 'welcome' block that you see after logging into your admin panel.
      // Feel free to delete this at any time. Simply remove the line below and the import `BeforeDashboard` statement on line 15.
      beforeDashboard: ['@/components/BeforeDashboard'],
    },
    importMap: {
      baseDir: path.resolve(dirname),
    },
    user: Users.slug,
    livePreview: {
      breakpoints: [
        {
          label: 'Mobile',
          name: 'mobile',
          width: 375,
          height: 667,
        },
        {
          label: 'Tablet',
          name: 'tablet',
          width: 768,
          height: 1024,
        },
        {
          label: 'Desktop',
          name: 'desktop',
          width: 1440,
          height: 900,
        },
      ],
    },
  },
  // This config helps us configure global or default features that the other editors can inherit
  editor: defaultLexical,
  // Use Neon serverless adapter when in production (Vercel), or regular PostgreSQL adapter in development
  db: process.env.VERCEL
    ? createNeonServerlessAdapter()
    : postgresAdapter({
      pool: {
        // Get the connection string from environment
        connectionString: process.env.DATABASE_URI,
        // Minimal pooling settings to prevent connection issues
        max: 2,
        idleTimeoutMillis: 5000,
        connectionTimeoutMillis: 5000,
        allowExitOnIdle: true
      }
    }),
  collections: [Pages, Posts, Products, Orders, Carts, Media, Categories, Users],
  endpoints: [...paymentWebhooks],
  globals: [Header, Footer],
  plugins: [
    ...plugins,
    // Configure Cloudinary storage adapter for media uploads
    cloudinaryStorage({
      config: {
        cloud_name: process.env.CLOUDINARY_CLOUD_NAME || '',
        api_key: process.env.CLOUDINARY_API_KEY || '',
        api_secret: process.env.CLOUDINARY_API_SECRET || '',

        secure: process.env.NODE_ENV === 'production',
      },
      collections: {
        'media': {
          // Configure upload options specifically for media collection
          uploadOptions: {
            folder: 'kikky-art-studio',
            // Let Cloudinary handle format optimization
            format: 'auto',
            quality: 'auto',
            // Enable automatic image optimization
            fetch_format: 'auto',
          },
          // Configure transformation options
          transformationOptions: {
            quality: 'auto:best',
            fetch_format: 'auto',
          },
        },
      },
      // Global folder for all uploads
      folder: 'kikky-art-studio',
      // Disable local storage completely in production
      disableLocalStorage: process.env.NODE_ENV === 'production',
      // Enable the plugin
      enabled: true,
    })
  ],
  secret: process.env.PAYLOAD_SECRET,
  sharp,
  typescript: {
    outputFile: path.resolve(dirname, 'payload-types.ts'),
  },
  jobs: {
    access: {
      run: ({ req }: { req: PayloadRequest }): boolean => {
        // Allow logged in users to execute this endpoint (default)
        if (req.user) return true

        // If there is no logged in user, then check
        // for the Vercel Cron secret to be present as an
        // Authorization header:
        const authHeader = req.headers.get('authorization')
        return authHeader === `Bearer ${process.env.CRON_SECRET}`
      },
    },
    tasks: [],
  },
})
