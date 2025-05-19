/**
 * Custom image loader for Next.js that handles timeouts better
 * This loader bypasses Next.js image optimization for Payload media URLs
 * to avoid the timeout issues
 */

export default function customImageLoader({ src, width, quality = 75 }) {
    // Special case for SVG files - bypass optimization completely
    if (src.endsWith('.svg') || src.includes('svg')) {
        return src;
    }
    
    // Check if this is a Payload CMS media URL
    const isPayloadMedia = src.includes('/api/media/') || src.includes('localhost:3001')

    // If it's a Payload media URL, don't optimize through Next.js
    if (isPayloadMedia) {
        // Return the original URL to bypass Next.js image optimization
        return src
    }

    // For all other images, use Next.js image optimization
    const params = [`w=${width}`]

    if (quality) {
        params.push(`q=${quality}`)
    }

    return `/_next/image?url=${encodeURIComponent(src)}&${params.join('&')}`
} 