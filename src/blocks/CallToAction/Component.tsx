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
    <div className={cn("container mx-auto py-8 px-4 md:px-6", className)}>
      {richText && (
        <div className="text-center mb-8">
          <RichText className="mb-0 text-lg md:text-xl" data={richText} enableGutter={false} />
        </div>
      )}
      
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6 md:gap-8 max-w-5xl mx-auto">
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
              className="rounded-xl overflow-hidden bg-white shadow-md hover:shadow-lg transition-all duration-300 flex flex-col h-full"
            >
              {/* Image Section - Top aligned as in design */}
              <div className="relative w-full aspect-[4/3] bg-[#e5f9ef]">
                {image ? (
                  <Media 
                    resource={image} 
                    priority={false} 
                    size="(max-width: 640px) 100vw, (max-width: 768px) 50vw, 33vw"
                    fill
                    imgClassName="object-cover"
                    alt={label || 'Call to action image'}
                  />
                ) : (
                  <div className="w-full h-full flex items-center justify-center text-gray-400">
                    <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round">
                      <rect width="18" height="18" x="3" y="3" rx="2" ry="2" />
                      <circle cx="9" cy="9" r="2" />
                      <path d="m21 15-3.086-3.086a2 2 0 0 0-2.828 0L6 21" />
                    </svg>
                  </div>
                )}
              </div>

              {/* Content Section - Clear hierarchy with proper spacing */}
              <div className="p-5 flex flex-col flex-grow">
                {/* Heading - More prominent and accessible */}
                <h3 className="text-xl font-semibold text-gray-800">{label}</h3>
                
                {/* Description - Clear, readable with proper contrast */}
                {description && description.trim() !== '' && (
                  <p className="mt-2 text-sm text-gray-600">{description}</p>
                )}

                {/* Spacer to push button to bottom */}
                <div className="flex-grow min-h-6"></div>

                {/* Button - Clean positioning with proper spacing */}
                <div className="mt-4">
                  <CMSLink 
                    type={link.type}
                    label={label || ''}
                    url={url}
                    newTab={link.newTab}
                    reference={link.reference}
                    className="w-full rounded-md py-2 flex justify-center items-center text-center" 
                    appearance={'default'}
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
