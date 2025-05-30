/**
 * Dependency Installation Script for Vercel Deployments
 * 
 * This script explicitly installs critical dependencies needed for
 * the build process in the Vercel environment.
 */

import { execSync } from 'child_process';

console.log('🔧 Starting dependency installation for Vercel deployment...');

try {
  // Install core dependencies first
  console.log('📦 Installing Sharp image processing library...');
  execSync('npm install sharp@0.32.6 --no-save', { stdio: 'inherit' });
  
  // Install TailwindCSS and related packages
  console.log('📦 Installing Tailwind CSS and related dependencies...');
  execSync('npm install tailwindcss postcss autoprefixer @tailwindcss/typography --no-save', { stdio: 'inherit' });
  
  // Install Neon Postgres serverless driver
  console.log('📦 Installing Neon PostgreSQL serverless driver...');
  execSync('npm install @neondatabase/serverless --no-save', { stdio: 'inherit' });
  
  console.log('✅ Dependency installation completed successfully.');
} catch (error) {
  console.error('❌ Error installing dependencies:', error.message);
  process.exit(1);
}
