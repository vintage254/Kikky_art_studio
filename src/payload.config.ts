// storage-adapter-import-placeholder
import { postgresAdapter } from '@payloadcms/db-postgres'

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
  db: postgresAdapter({
    pool: {
      connectionString: process.env.DATABASE_URI || '',
      max: parseInt(process.env.DATABASE_POOL_MAX || '20'),
      idleTimeoutMillis: parseInt(process.env.DATABASE_IDLE_TIMEOUT_MS || '20000'),
      connectionTimeoutMillis: 10000, // Return an error after 10 seconds if connection not established
      allowExitOnIdle: false, // Don't allow idle clients to exit during long-running operations
      // Add additional timeout settings
      ...(process.env.DATABASE_IDLE_IN_TRANSACTION_TIMEOUT_MS ? {
        idle_in_transaction_session_timeout: parseInt(process.env.DATABASE_IDLE_IN_TRANSACTION_TIMEOUT_MS)
      } : {}),
      ...(process.env.DATABASE_QUERY_TIMEOUT_MS ? {
        query_timeout: parseInt(process.env.DATABASE_QUERY_TIMEOUT_MS)
      } : {})
    },
    onConnect: async (client) => {
      // Optional: Configure some client settings
      // For example, set a statement timeout to avoid long-running queries
      await client.query('SET statement_timeout = 10000'); // 10 second query timeout
    },
  }),
  collections: [Pages, Posts, Products, Orders, Media, Categories, Users],
  cors: [getServerSideURL()].filter(Boolean),
  endpoints: [...paymentWebhooks],
  globals: [Header, Footer],
  plugins: [
    ...plugins,
    // storage-adapter-placeholder
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
