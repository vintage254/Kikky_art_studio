import React from 'react'
import { cn } from '@/utilities/ui'

import type { CallToActionBlock as CTABlockProps } from '@/payload-types'

import RichText from '@/components/RichText'
import { CMSLink } from '@/components/Link'
import { Media } from '@/components/Media'
import Image from 'next/image'
import { getClientSideURL } from '@/utilities/getURL'

export const CallToActionBlock: React.FC<CTABlockProps & { className?: string }> = ({ 
  links, 
  richText,
  className
}) => {
  const baseUrl = getClientSideURL()

  return (
    <div className={cn("container mx-auto py-6 px-4 md:px-6", className)}>
      {richText && (
        <div className="text-center mb-6 md:mb-8">
          <RichText className="mb-0 text-lg md:text-xl" data={richText} enableGutter={false} />
        </div>
      )}
      
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 md:gap-6 max-w-5xl mx-auto">
        {(links || []).map(({ link }, i) => {
          if (!link) return null;
          
          const { label, description, image, appearance, url, reference } = link || {};
          
          // Determine the link URL based on type
          const href = link?.type === 'reference' && typeof reference?.value === 'object' && reference.value.slug
            ? `${reference?.relationTo !== 'pages' ? `/${reference?.relationTo}` : ''}/${reference.value.slug}`
            : url || '#';
          
          return (
            <div 
              key={i} 
              className="border border-border rounded-lg overflow-hidden bg-card shadow-sm hover:shadow-md transition-shadow flex flex-col h-full"
            >
              {/* Image Section - shorter on mobile */}
              <div className="relative w-full h-28 sm:h-36 md:h-40 bg-muted">
                {image ? (
                  <Media 
                    resource={image} 
                    priority={false} 
                    size="(max-width: 640px) 90vw, (max-width: 768px) 45vw, 30vw"
                    fill
                    imgClassName="object-cover"
                    alt={label || 'Call to action image'}
                  />
                ) : (
                  <div className="w-full h-full flex items-center justify-center text-muted-foreground">
                    <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round">
                      <rect width="18" height="18" x="3" y="3" rx="2" ry="2" />
                      <circle cx="9" cy="9" r="2" />
                      <path d="m21 15-3.086-3.086a2 2 0 0 0-2.828 0L6 21" />
                    </svg>
                  </div>
                )}
              </div>

              {/* Content Section */}
              <div className="p-3 sm:p-4 flex flex-col flex-grow">
                {/* Heading */}
                <h3 className="text-base sm:text-lg font-medium text-center sm:text-left">{label}</h3>
                
                {/* Description - ensure it's displayed by checking it exists properly */}
                {description && description.trim() !== '' && (
                  <p className="mt-1 sm:mt-2 text-sm text-gray-600 line-clamp-2 text-center sm:text-left">{description}</p>
                )}

                {/* Spacer to push button to bottom */}
                <div className="flex-grow min-h-4"></div>

                {/* Button - pushed to bottom with margin-top auto */}
                <div className="mt-3 sm:mt-4 pt-2">
                  <CMSLink 
                    {...link} 
                    className="w-full" 
                    variant={appearance || 'default'}
                    size="sm"
                  />
                </div>
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}
