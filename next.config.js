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
      // Local development
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
      // Cloudinary patterns
      {
        protocol: 'https',
        hostname: 'res.cloudinary.com',
        port: '',
        pathname: `/${process.env.CLOUDINARY_CLOUD_NAME}/**`,
      },
      {
        protocol: 'https',
        hostname: 'cloudinary.com',
        port: '',
        pathname: '/**',
      },
      // Production server
      process.env.NEXT_PUBLIC_SERVER_URL ? {
        protocol: 'https',
        hostname: process.env.NEXT_PUBLIC_SERVER_URL.replace(/^https?:\/\//, '').split(':')[0],
        port: '',
        pathname: '/api/media/**',
      } : null,
      // Payload URL
      {
        protocol: 'https',
        hostname: PAYLOAD_URL_OBJECT.hostname,
        port: PAYLOAD_URL_OBJECT.port || '',
        pathname: '/api/media/**',
      }
    ].filter(Boolean), // Remove null entries
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
  // External packages configuration for serverless components
  serverExternalPackages: [
    'cloudflare:sockets',
    '@neondatabase/serverless',
    'file-type', // Add file-type to external packages
  ],
  
  // Import customization
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
    // Add serverComponentsExternalPackages for better control
    serverComponentsExternalPackages: [
      'file-type',
      'sharp',
      'cloudinary'
    ],
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
      // Make certain Node.js modules external on the server
      config.externals = [...(config.externals || []), 
        'pg-native',
        'file-type', // Make file-type external to use our adapter
      ];
    }
    
    // For Neon PostgreSQL support on Vercel - apply to both server and client
    if (process.env.VERCEL) {
      // Use our custom adapters
      config.resolve.alias = {
        ...config.resolve.alias,
        // Replace pg with our custom adapter
        'pg': path.resolve(__dirname, 'pg-default-export.js'),
        // Replace file-type with our custom adapter
        'file-type': path.resolve(__dirname, 'file-type-adapter.js'),
        // Add polyfills for Node.js modules
        'worker_threads': path.resolve(__dirname, 'worker-threads-polyfill.js'),
        'readline': path.resolve(__dirname, 'readline-polyfill.js'),
        'cloudflare:sockets': path.resolve(__dirname, 'cloudflare-sockets-polyfill.js'),
        // Handle node: protocol imports
        'node:assert': path.resolve(__dirname, 'node-assert-polyfill.js'),
        'node:fs': path.resolve(__dirname, 'node-fs-polyfill.js'),
        'node:module': path.resolve(__dirname, 'node-module-polyfill.js'),
        'node:os': path.resolve(__dirname, 'node-os-polyfill.js'),
        'node:buffer': 'buffer',
        'node:crypto': 'crypto-browserify',
        'node:events': 'events',
        'node:path': 'path-browserify',
        'node:stream': 'stream-browserify',
        'node:util': 'util'
      };
    }

    // For client-side builds
    if (!isServer) {
      config.resolve.fallback = {
        ...config.resolve.fallback,
        'dns': false,
        'net': false,
        'tls': false,
        'fs': false,
        'child_process': false,
        'worker_threads': false,
        'readline': false,
        'file-type': path.resolve(__dirname, 'file-type-adapter.js'), // Use our adapter on client
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
    
    return config;
  },
  
  // Ensure aliases are resolved correctly
  eslint: {
    ignoreDuringBuilds: true,
  },
  typescript: {
    ignoreBuildErrors: true,
  },
  
  // Add Turbopack config
  turbopack: {
    resolveAlias: {
      'payload-mock-package': 'payload-mock-package',
      'file-type': path.resolve(__dirname, 'file-type-adapter.js'),
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
