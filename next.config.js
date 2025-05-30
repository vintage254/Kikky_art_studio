import { withPayload } from '@payloadcms/next/withPayload'

import redirects from './redirects.js'
// Import using CommonJS pattern for compatibility
const neonResolver = require('./next-neon-resolver.js')

const NEXT_PUBLIC_SERVER_URL = process.env.VERCEL_PROJECT_PRODUCTION_URL
  ? `https://${process.env.VERCEL_PROJECT_PRODUCTION_URL}`
  : undefined || process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000'

// Get Payload URL from environment with fallback
const PAYLOAD_URL = process.env.NEXT_PUBLIC_PAYLOAD_URL || 'http://localhost:3001'
const PAYLOAD_URL_OBJECT = new URL(PAYLOAD_URL)

/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    remotePatterns: [
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '3000',
        pathname: '/api/media/**',
      },
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '3001',
        pathname: '/api/media/**',
      },
      // Ensure we have a valid hostname for the production URL
      process.env.NEXT_PUBLIC_SERVER_URL ? {
        protocol: 'https',
        hostname: process.env.NEXT_PUBLIC_SERVER_URL.replace(/^https?:\/\//, '').split(':')[0],
        port: '',
        pathname: '/api/media/**',
      } : null,
      // Add your production domain if needed
      {
        protocol: 'https',
        hostname: PAYLOAD_URL_OBJECT.hostname,
        port: PAYLOAD_URL_OBJECT.port || '',
        pathname: '/api/media/**',
      }
    ],
    deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
    imageSizes: [16, 32, 48, 64, 96, 128, 256, 384],
    formats: ['image/webp'],
    dangerouslyAllowSVG: true,
    contentDispositionType: 'attachment',
    contentSecurityPolicy: "default-src 'self'; script-src 'none'; sandbox;",
    minimumCacheTTL: 60,
  },
  reactStrictMode: true,
  productionBrowserSourceMaps: true,
  redirects,
  experimental: {
    // These settings should remain in experimental
    staticGenerationRetryCount: parseInt(process.env.NEXT_STATIC_GENERATION_RETRY_COUNT || '3'),
    staticGenerationMaxConcurrency: parseInt(process.env.NEXT_STATIC_GENERATION_MAX_CONCURRENCY || '2'),
    staticGenerationMinPagesPerWorker: parseInt(process.env.NEXT_STATIC_GENERATION_MIN_PAGES_PER_WORKER || '25'),
  },
  // Handle Node.js modules for PostgreSQL on Vercel
  webpack: (config, { isServer, dev }) => {
    // Handle Node-specific modules in server build
    if (isServer) {
      // Mark these modules as external to prevent bundling
      config.externals = [...(config.externals || []), 
        // Tell webpack these are external modules that should not be bundled
        'cloudflare:sockets',
        'pg-native',
        'pg-cloudflare',
        // Treat all node: protocol imports as external
        /^node:/,
      ];
      
      // For Neon PostgreSQL support on Vercel
      if (process.env.VERCEL) {
        console.log('📊 Configuring webpack for Neon on Vercel');
        // Use our custom neon-serverless.js adapter
        config.resolve.alias = {
          ...config.resolve.alias,
          // Replace pg with neon serverless
          'pg': '@neondatabase/serverless',
        };
      }
    }

    // For client-side builds, provide empty modules
    if (!isServer) {
      config.resolve.fallback = {
        ...config.resolve.fallback,
        'cloudflare:sockets': false,
        'pg-native': false,
        'pg-cloudflare': false,
        'fs': false,
        'path': false,
      };
    }
    
    return config;
  },
  
  // Use our custom module resolver
  experimental: {
    ...nextConfig.experimental || {},
    serverComponentsExternalPackages: [
      'cloudflare:sockets',
      '@neondatabase/serverless',
    ],
    // Use the custom resolver
    modularizeImports: {
      '@neondatabase/serverless': {
        transform: '@neondatabase/serverless/{{member}}',
      },
    },
  },
  // Add Turbopack config
  turbopack: {
    // Migrate the resolveAlias that Payload would add to experimental.turbo
    resolveAlias: {
      'payload-mock-package': 'payload-mock-package'
    }
  },
  // Configure connection to Payload CMS
  serverRuntimeConfig: {
    payloadURL: PAYLOAD_URL,
  },
  publicRuntimeConfig: {
    payloadURL: PAYLOAD_URL,
  },
  // Configure HTTP agent options
  httpAgentOptions: {
    keepAlive: true
  }
}

// Set an environment variable to prevent Payload from adding experimental.turbo
process.env.PAYLOAD_PATCH_TURBOPACK_WARNINGS = 'true'

export default withPayload(nextConfig, { devBundleServerPackages: false })
