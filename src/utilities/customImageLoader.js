/**
 * Custom image loader for Next.js that handles timeouts better
 * This loader bypasses Next.js image optimization for Payload media URLs
 * to avoid the timeout issues and properly handles Payload CMS preview sizes
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
        // Check if the URL already has parameters (like cache tags)
        const hasParams = src.includes('?');
        
        // Handle preview size by adding the width parameter to the URL
        // This will use Payload's built-in image resizing instead of relying on static files
        if (width) {
            // Determine the appropriate size name based on width for better compatibility
            let sizeName = 'thumbnail';
            if (width > 1400) sizeName = 'xlarge';
            else if (width > 900) sizeName = 'large';
            else if (width > 600) sizeName = 'medium';
            else if (width > 300) sizeName = 'small';
            
            // If the URL already has parameters, append the width parameter with &
            // Otherwise, add it with ?
            const sizeParam = `size=${sizeName}`;
            return `${src}${hasParams ? '&' : '?'}${sizeParam}`;
        }
        
        // Return the original URL to bypass Next.js image optimization
        return src;
    }

    // For all other images, use Next.js image optimization
    const params = [`w=${width}`]

    if (quality) {
        params.push(`q=${quality}`)
    }

    return `/_next/image?url=${encodeURIComponent(src)}&${params.join('&')}`
} 