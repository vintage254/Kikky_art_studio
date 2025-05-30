/**
 * Custom path alias resolver for Vercel deployments
 * This script helps resolve @/ path aliases during the build process
 */

import path from 'path';
import { fileURLToPath } from 'url';
import fs from 'fs';

// Get the directory name equivalent to __dirname in CommonJS
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export default function resolveAliases(config) {
  // Ensure the resolve.alias object exists
  if (!config.resolve) config.resolve = {};
  if (!config.resolve.alias) config.resolve.alias = {};
  
  // Add the @ alias to point to the src directory
  config.resolve.alias['@'] = path.resolve(__dirname, 'src');
  
  // Add @payload-config alias
  config.resolve.alias['@payload-config'] = path.resolve(__dirname, 'src/payload.config.ts');
  
  // Add specific module resolutions for problematic imports
  config.resolve.alias['@/providers/HeaderTheme'] = path.resolve(__dirname, 'src/providers/HeaderTheme');
  config.resolve.alias['@/components/ProductCarousel'] = path.resolve(__dirname, 'src/components/ProductCarousel');
  config.resolve.alias['@/components/AboutSection'] = path.resolve(__dirname, 'src/components/AboutSection');
  config.resolve.alias['@/components/ui/WhatsAppIcon'] = path.resolve(__dirname, 'src/components/ui/WhatsAppIcon');
  config.resolve.alias['@/utilities/getURL'] = path.resolve(__dirname, 'src/utilities/getURL');
  config.resolve.alias['@/blocks/CallToAction/Component'] = path.resolve(__dirname, 'src/blocks/CallToAction/Component');
  config.resolve.alias['@/components/animations/FadeInView'] = path.resolve(__dirname, 'src/components/animations/FadeInView');
  config.resolve.alias['@/components/animations/StaggeredList'] = path.resolve(__dirname, 'src/components/animations/StaggeredList');
  config.resolve.alias['@/components/animations/PageTransition'] = path.resolve(__dirname, 'src/components/animations/PageTransition');
  config.resolve.alias['@/providers/AnimationProvider'] = path.resolve(__dirname, 'src/providers/AnimationProvider');
  
  // Add fallback patterns for resolution
  config.resolve.fallback = {
    ...config.resolve.fallback,
    path: 'path-browserify',
  };
  
  return config;
};
