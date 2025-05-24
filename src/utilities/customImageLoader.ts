/**
 * Custom image loader for Next.js that properly handles URL construction
 * for Payload CMS media items
 */

import { getClientSideURL } from './getURL';

interface ImageLoaderProps {
  src: string;
  width?: number;
  quality?: number;
}

/**
 * Custom image loader for Next.js that handles both absolute and relative URLs
 */
export default function customImageLoader({ src, width, quality }: ImageLoaderProps): string {
  // Don't process data URLs or SVGs
  if (src.startsWith('data:') || src.endsWith('.svg')) {
    return src;
  }

  // If it's already an absolute URL, use it directly
  if (src.startsWith('http')) {
    return src;
  }

  // Otherwise safely join with the base URL
  try {
    const baseUrl = getClientSideURL();
    
    // If the src already starts with the baseUrl, don't concatenate
    if (src.startsWith(baseUrl)) {
      return src;
    }
    
    // Ensure we don't have double slashes
    const cleanSrc = src.startsWith('/') ? src : `/${src}`;
    const cleanBaseUrl = baseUrl.endsWith('/') ? baseUrl.slice(0, -1) : baseUrl;
    
    return `${cleanBaseUrl}${cleanSrc}`;
  } catch (error) {
    console.error('Error in custom image loader:', error);
    // Return original src as fallback
    return src;
  }
}
