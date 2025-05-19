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
    size: sizeFromProps,
    src: srcFromProps,
    loading: loadingFromProps,
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
    // Initialize image source based on resource
    if (!srcFromProps && resource && typeof resource === 'object') {
      const { alt: altFromResource, height: fullHeight, url, width: fullWidth } = resource

      width = fullWidth!
      height = fullHeight!
      alt = altFromResource || ''

      try {
        const baseUrl = getClientSideURL()

        // Ensure URL is absolute if it starts with /api
        if (url && url.startsWith('/api')) {
          const finalUrl = `${baseUrl}${url}`
          setImgSrc(finalUrl)
        } else if (url) {
          setImgSrc(`${baseUrl}${url}`)
        } else {
          // Use placeholder if no URL provided instead of empty string
          setImgSrc(placeholderBlur)
          console.warn('No URL provided for image resource')
        }
      } catch (error) {
        console.error('Error constructing image URL:', error)
        setImgSrc(placeholderBlur)
      }
    }
  }, [resource, srcFromProps])

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
          const baseUrl = getClientSideURL()
          // Try without Next.js image optimization
          const directUrl = `${baseUrl}${resource.url}`
          setImgSrc(directUrl)
        } catch (error) {
          console.error('Error setting direct URL:', error)
          setImgSrc(placeholderBlur)
          setImgError(true)
        }
      } else {
        setImgError(true)
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
