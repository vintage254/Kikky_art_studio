import clsx from 'clsx'
import React from 'react'
import Image from 'next/image'
import { Media as MediaType } from '@/payload-types'
import { getClientSideURL } from '@/utilities/getURL'

interface Props {
  className?: string
  loading?: 'lazy' | 'eager'
  priority?: 'auto' | 'high' | 'low'
  customLogo?: MediaType | number | null
}

export const Logo = (props: Props) => {
  const { loading: loadingFromProps, priority: priorityFromProps, className, customLogo } = props

  const loading = loadingFromProps || 'lazy'
  const priority = priorityFromProps || 'low'
  const baseUrl = getClientSideURL()

  // Default payload logo (fallback)
  const defaultLogo = "https://raw.githubusercontent.com/payloadcms/payload/main/packages/ui/src/assets/payload-logo-light.svg"
  
  // If we have a custom logo that is a full Media object with a url
  if (customLogo && typeof customLogo === 'object' && 'url' in customLogo && customLogo.url) {
    // Calculate dimensions to maintain aspect ratio
    const originalWidth = customLogo.width || 193
    const originalHeight = customLogo.height || 34
    
    // Target height is 40px max
    const targetHeight = 40
    // Calculate proportional width based on original aspect ratio
    const calculatedWidth = Math.round((originalWidth / originalHeight) * targetHeight)
    
    // Check if the logo URL is already an absolute URL (starts with http or https)
    const logoUrl = customLogo.url.startsWith('http') 
      ? customLogo.url 
      : new URL(customLogo.url, baseUrl).toString();
    
    return (
      <Image
        src={logoUrl}
        alt={customLogo.alt || "Site Logo"}
        width={calculatedWidth}
        height={targetHeight}
        priority={priority === 'high'}
        unoptimized={true}
        style={{
          maxHeight: '40px',
          width: 'auto',
          objectFit: 'contain',
          // Don't apply filter effects to custom logos
          filter: 'none'
        }}
        className={clsx('max-w-[180px]', className?.replace('invert', '').replace('dark:invert-0', ''))}
      />
    )
  }

  // Fallback to the default logo
  return (
    /* eslint-disable @next/next/no-img-element */
    <img
      alt="Site Logo"
      width={193}
      height={34}
      loading={loading}
      fetchPriority={priority}
      decoding="async"
      className={clsx('max-w-[9.375rem] w-auto h-[34px]', className)}
      src={defaultLogo}
    />
  )
}
