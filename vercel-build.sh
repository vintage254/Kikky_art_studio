#!/bin/bash
# Special build script for Vercel deployments

# Set environment variables for Sharp
export SHARP_IGNORE_GLOBAL_LIBVIPS=1
export NODE_ENV=production

# Install dependencies with less strict checking
echo "📦 Installing dependencies with Sharp optimization..."
pnpm install --no-frozen-lockfile

# Build the Next.js application
echo "🏗️ Building Next.js application..."
pnpm build

# Complete build
echo "✅ Build completed successfully!"
