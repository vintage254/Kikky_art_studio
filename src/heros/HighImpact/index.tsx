'use client'
import { useHeaderTheme } from '@/providers/HeaderTheme'
import React, { useEffect } from 'react'

import type { Page } from '@/payload-types'

import { CMSLink } from '@/components/Link'
import { Media } from '@/components/Media'
import RichText from '@/components/RichText'

export const HighImpactHero: React.FC<Page['hero']> = ({ links, media, richText }) => {
  const { setHeaderTheme } = useHeaderTheme()

  useEffect(() => {
    setHeaderTheme('light')
  }, [setHeaderTheme])

  return (
    <div
      className="relative pt-24 flex items-center min-h-[80vh]"
      data-theme="light"
    >
      {/* Media background positioned absolute to fill the container */}
      {media && typeof media === 'object' && (
        <div className="absolute inset-0 w-full h-full">
          <Media fill imgClassName="object-cover" priority resource={media} />
          {/* Semi-transparent gradient overlay to ensure text is readable */}
          <div className="absolute inset-0 bg-gradient-to-r from-white/80 via-white/60 to-transparent md:from-white/70 md:via-white/50 md:to-transparent"></div>
        </div>
      )}
      
      {/* Content positioned directly over the image */}
      <div className="container z-10 relative py-10 md:py-16">
        <div className="max-w-[36.5rem] mx-4 md:mx-0 md:ml-12 lg:ml-24">
          {richText && 
            <div className="mb-8">
              <RichText 
                className="prose prose-lg prose-strong:font-bold text-shadow-sm" 
                data={richText} 
                enableGutter={false} 
              />
            </div>
          }
          
          {Array.isArray(links) && links.length > 0 && (
            <div className="flex flex-wrap gap-3 md:gap-4">
              {links.map(({ link }, i) => (
                <CMSLink 
                  key={i}
                  {...link} 
                  className={i === 0 
                    ? "px-5 py-3 bg-black text-white rounded-md transition-all hover:bg-gray-800 font-medium text-sm md:text-base"
                    : "px-5 py-3 border border-black rounded-md transition-all hover:bg-black hover:text-white font-medium text-sm md:text-base"
                  }
                  overrideClassName={true}
                />
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
