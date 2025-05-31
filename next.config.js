import { withPayload } from '@payloadcms/next/withPayload'
import redirects from './redirects.js'
import path from 'path'
import { fileURLToPath } from 'url'
// Import using ES Module pattern
import neonResolver from './neon-module-resolver.js'
// Import the alias resolver
import aliasResolver from './alias-resolver.js'

// Create __dirname equivalent for ES modules
const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

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
  // External packages configuration for serverless components (moved from experimental in Next.js 15.3.0)
  serverExternalPackages: [
    'cloudflare:sockets',
    '@neondatabase/serverless',
  ],
  
  // Import customization (moved from experimental in Next.js 15.3.0)
  modularizeImports: {
    '@neondatabase/serverless': {
      transform: '@neondatabase/serverless/{{member}}',
    },
  },
  
  experimental: {
    // These settings should remain in experimental
    staticGenerationRetryCount: parseInt(process.env.NEXT_STATIC_GENERATION_RETRY_COUNT || '3'),
    staticGenerationMaxConcurrency: parseInt(process.env.NEXT_STATIC_GENERATION_MAX_CONCURRENCY || '2'),
    staticGenerationMinPagesPerWorker: parseInt(process.env.NEXT_STATIC_GENERATION_MIN_PAGES_PER_WORKER || '25'),
  },
  // Handle Node.js modules for PostgreSQL on Vercel
  webpack: (config, { isServer, dev }) => {
    // Debug info for Vercel environment
    if (process.env.VERCEL) {
      console.log('📊 Configuring webpack for Neon on Vercel');
    }

    // Apply custom alias resolver for path aliases
    config = aliasResolver(config);
    
    // Handle Node-specific modules
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
        // Use our custom adapters
        config.resolve.alias = {
          ...config.resolve.alias,
          // Replace pg with our custom adapter that provides a default export
          'pg': path.resolve(__dirname, 'pg-default-export.js'),
          // Replace file-type with our custom adapter that provides fileTypeFromFile
          'file-type': path.resolve(__dirname, 'file-type-adapter.js'),
          // Add polyfills for Node.js modules required by dependencies
          'worker_threads': path.resolve(__dirname, 'worker-threads-polyfill.js'),
          'readline': path.resolve(__dirname, 'readline-polyfill.js'),
          'cloudflare:sockets': path.resolve(__dirname, 'cloudflare-sockets-polyfill.js'),
          // Handle node: protocol imports
          'node:assert': 'assert',
          'node:buffer': 'buffer',
          'node:crypto': 'crypto-browserify',
          'node:events': 'events',
          'node:fs': false,
          'node:path': 'path-browserify',
          'node:stream': 'stream-browserify',
          'node:util': 'util'
        };
      }
    }

    // For client-side builds
    if (!isServer) {
      // Handle Node.js built-in modules properly
      config.resolve.fallback = {
        ...config.resolve.fallback,
        // Provide empty implementations for Node.js modules
        'dns': false,
        'net': false,
        'tls': false,
        'fs': false,
        'child_process': false,
        'worker_threads': false,
        'readline': false,
        // Provide browser-compatible implementations for common modules
        'crypto': 'crypto-browserify',
        'stream': 'stream-browserify',
        'util': 'util',
        'events': 'events',
        'path': 'path-browserify',
        'buffer': 'buffer',
        'os': 'os-browserify',
        'assert': 'assert'
      };
    }
    
    // Ensure packages that use these Node.js modules don't break the client build
    if (!isServer) {
      // Set process.browser flag for client-side code
      config.plugins = [...config.plugins];
    }
    
    return config;
  },
  
  // Ensure aliases are resolved correctly
  eslint: {
    // Warning: This allows production builds to successfully complete even if
    // your project has ESLint errors.
    ignoreDuringBuilds: true,
  },
  typescript: {
    // !! WARN !!
    // Allows production builds to successfully complete even if your project has type errors.
    ignoreBuildErrors: true,
  },
  
  // We'll add experimental config inside the nextConfig variable below
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
