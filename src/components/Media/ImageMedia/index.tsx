'use client'

import type { StaticImageData } from 'next/image'

import { cn } from '@/utilities/ui'
import NextImage from 'next/image'
import React, { useState, useEffect } from 'react'

import type { Props as MediaProps } from '../types'

import { cssVariables } from '@/cssVariables'
import { getClientSideURL } from '@/utilities/getURL'
import customImageLoader from '@/utilities/customImageLoader'

const { breakpoints } = cssVariables

// A base64 encoded image to use as a placeholder while the image is loading
const placeholderBlur =
  'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+P+/HgAEDQIHq4C+sgAAAABJRU5ErkJggg=='

// Helper function to convert srcFromProps to string
const getInitialSrc = (src: string | StaticImageData | undefined): string | null => {
  if (!src) return null // Return null instead of empty string
  if (typeof src === 'string') return src || null // Return null if it's an empty string
  // Handle StaticImageData objects
  return src.src || null
}

export const ImageMedia: React.FC<MediaProps> = (props) => {
  const {
    alt: altFromProps,
    fill,
    pictureClassName,
    imgClassName,
    priority,
    resource,
    size: sizeFromProps, // This is for next/image sizes attribute
    src: srcFromProps,
    loading: loadingFromProps,
    payloadImageSize, // This is for requesting a specific size from Payload backend
  } = props

  const [imgSrc, setImgSrc] = useState<string | null>(getInitialSrc(srcFromProps))
  const [imgError, setImgError] = useState(false)
  const [attemptCount, setAttemptCount] = useState(0)
  const maxAttempts = 2 // Maximum number of retry attempts

  let width: number | undefined
  let height: number | undefined
  let alt = altFromProps

  // Detect if the source is an SVG
  const isSvg = imgSrc && (imgSrc.endsWith('.svg') || imgSrc.includes('svg'))

  // Define a type-compatible loader that works with Next.js ImageLoader
  const imageLoader = ({ src, width, quality }: { src: string, width: number, quality?: number }) => {
    return customImageLoader({ src, width, quality });
  };

  useEffect(() => {
    if (!srcFromProps && resource && typeof resource === 'object') {
      const { alt: altFromResource, height: fullHeight, url, width: fullWidth, sizes: resourceSizes } = resource;

      // Update local width/height/alt based on the full resource initially
      // These might be overridden if a specific 'sizeFromProps' is found and used
      if (fullWidth) width = fullWidth;
      if (fullHeight) height = fullHeight;
      alt = altFromResource || '';

      try {
        const baseUrl = getClientSideURL();

        // 1. Check if 'sizeFromProps' (for next/image sizes attribute / direct resource.sizes access) is provided
        // and if a corresponding size URL exists in resource.sizes.
        // This logic attempts to use a pre-defined URL from the 'sizes' object in the media resource.
        if (sizeFromProps && resourceSizes && typeof resourceSizes === 'object') {
          const sizeObj = resourceSizes[sizeFromProps as keyof typeof resourceSizes];
          if (sizeObj && typeof sizeObj === 'object' && 'url' in sizeObj && sizeObj.url) {
            const sizeSpecificUrl = sizeObj.url;
            // Determine if the URL from resource.sizes is absolute or needs prepending with baseUrl
            const finalSizeSpecificUrl = sizeSpecificUrl.startsWith('/') || sizeSpecificUrl.startsWith('http')
              ? sizeSpecificUrl
              : `${baseUrl}${sizeSpecificUrl.startsWith('/') ? '' : '/'}${sizeSpecificUrl}`;
            
            setImgSrc(finalSizeSpecificUrl);
            
            // Update width and height if available in this specific size object
            if ('width' in sizeObj && sizeObj.width) width = sizeObj.width;
            if ('height' in sizeObj && sizeObj.height) height = sizeObj.height;
            return; // Exit early as we've found a specific URL from resource.sizes
          }
        }

        // 2. If 'sizeFromProps' didn't lead to a URL, construct the main backend URL
        let constructedBackendUrl: string | null = null;
        if (url) { // Prioritize resource.url
          if (url.startsWith('http')) {
            constructedBackendUrl = url; // Absolute URL
          } else {
            // Relative URL, join with baseUrl
            const cleanBaseUrl = baseUrl.endsWith('/') ? baseUrl.slice(0, -1) : baseUrl;
            const cleanUrlPath = url.startsWith('/') ? url : `/${url}`;
            constructedBackendUrl = `${cleanBaseUrl}${cleanUrlPath}`;
          }
        } else if (resource.filename) { // Fallback to filename for API-based retrieval
          constructedBackendUrl = `${baseUrl}/api/media/file/${resource.filename}`;
        } else {
          constructedBackendUrl = placeholderBlur; // Fallback if no URL or filename
        }

        // 3. Apply 'payloadImageSize' to the constructed backend URL (if not placeholder)
        if (payloadImageSize && constructedBackendUrl && constructedBackendUrl !== placeholderBlur) {
          const separator = constructedBackendUrl.includes('?') ? '&' : '?';
          constructedBackendUrl += `${separator}size=${payloadImageSize}`;
        }

        setImgSrc(constructedBackendUrl);

        if (constructedBackendUrl === placeholderBlur && !(url || resource.filename)) {
          console.warn('No URL or filename provided for image resource; using placeholder.');
        }

      } catch (error) {
        console.error('Error constructing image URL:', error);
        setImgSrc(placeholderBlur);
      }
    } else if (srcFromProps) {
      // If srcFromProps is provided directly (e.g. static import), use it.
      const initialStaticSrc = getInitialSrc(srcFromProps);
      setImgSrc(initialStaticSrc);
    } else {
      // If no resource and no srcFromProps, use placeholder
      setImgSrc(placeholderBlur);
    }
  }, [resource, srcFromProps, sizeFromProps, payloadImageSize]);

  const loading = loadingFromProps || (!priority ? 'lazy' : undefined)

  // NOTE: this is used by the browser to determine which image to download at different screen sizes
  const sizes = sizeFromProps
    ? sizeFromProps
    : Object.entries(breakpoints)
      .map(([, value]) => `(max-width: ${value}px) ${value * 2}w`)
      .join(', ')

  // If image fails to load, try once with direct URL, then show fallback
  const handleError = () => {
    if (attemptCount < maxAttempts && resource && typeof resource === 'object' && resource.url) {
      console.warn(`Retrying image load (attempt ${attemptCount + 1}): ${imgSrc}`)

      // Try direct URL if the optimized one failed
      if (attemptCount === 0 && resource.url) {
        try {
          const baseUrl = getClientSideURL();
          let pathPart = resource.url;

          let finalUrl;

          if (pathPart.startsWith('http')) {
            // resource.url is already absolute, use it directly
            finalUrl = pathPart;
          } else {
            // Join baseUrl and pathPart carefully
            const baseSegments = baseUrl.split('/').filter(Boolean); // Filter out empty segments
            const pathSegments = pathPart.split('/').filter(Boolean); // Filter out empty segments
            
            // Reconstruct, ensuring protocol is handled
            let scheme = '';
            if (baseSegments.length > 0 && (baseSegments[0] === 'http:' || baseSegments[0] === 'https:')) {
              scheme = baseSegments.shift() + '//'; // e.g., "http://" or "https://"
            } else if (baseUrl.startsWith('//')) { // Handle protocol-relative URLs from baseUrl if any
              scheme = '//';
            } else {
              // Attempt to infer scheme if not present and not a protocol-relative URL
              if (typeof window !== 'undefined' && window.location.protocol) {
                  scheme = window.location.protocol + '//';
              } else {
                  scheme = 'https://'; // Default assumption for server-side or unknown client
              }
            }
            
            const fullPathSegments = [...baseSegments, ...pathSegments];
            finalUrl = scheme + fullPathSegments.join('/');
          }
          
          console.log(`[Debug] Retrying with direct URL (v2): ${finalUrl}`);
          setImgSrc(finalUrl);

        } catch (error) {
          console.error('Error setting direct URL (v2):', error);
          setImgSrc(placeholderBlur);
          setImgError(true);
        }
      } else {
        setImgError(true);
      }

      setAttemptCount(prev => prev + 1)
    } else {
      console.warn(`Failed to load image after ${attemptCount} attempts: ${imgSrc}`)
      setImgError(true)
    }
  }

  // Don't render the Image component if we don't have a valid src
  if (!imgSrc && !imgError) {
    return (
      <div
        className={cn(
          "bg-gray-200 flex items-center justify-center text-gray-500 text-xs",
          imgClassName,
          pictureClassName
        )}
        style={{
          position: 'relative',
          display: fill ? 'block' : 'inline-block',
          width: fill ? '100%' : (width ?? 300),
          height: fill ? '100%' : (height ?? 200),
          minHeight: fill ? '300px' : 'auto'
        }}
      >
        <span className="p-4 text-center">Loading...</span>
      </div>
    );
  }

  return (
    <picture
      className={cn(pictureClassName)}
      style={{
        position: 'relative',
        display: fill ? 'block' : 'inline-block',
        width: fill ? '100%' : 'auto',
        height: fill ? '100%' : 'auto',
        minHeight: fill ? '300px' : 'auto'
      }}
    >
      {!imgError && imgSrc ? (
        <NextImage
          alt={alt || ''}
          className={cn(imgClassName)}
          fill={fill}
          height={!fill ? height : undefined}
          placeholder="blur"
          blurDataURL={placeholderBlur}
          priority={priority}
          quality={75} // Reduce quality to improve load times
          loading={loading}
          sizes={sizes}
          src={imgSrc}
          width={!fill ? width : undefined}
          onError={handleError}
          loader={imageLoader} // Use custom loader for Payload media
          unoptimized={Boolean(attemptCount > 0 || isSvg)} // Ensure boolean with Boolean() constructor
        />
      ) : (
        // Fallback when image fails to load
        <div
          className={cn(
            "bg-gray-200 flex items-center justify-center text-gray-500 text-xs",
            imgClassName
          )}
          style={{
            position: fill ? 'absolute' : 'relative',
            inset: fill ? 0 : undefined,
            width: !fill ? width ?? 300 : '100%',
            height: !fill ? height ?? 200 : '100%',
          }}
        >
          <span className="p-4 text-center">Image not available</span>
        </div>
      )}
    </picture>
  )
}
