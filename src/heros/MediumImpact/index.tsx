import React from 'react'

import type { Page } from '@/payload-types'

import { CMSLink } from '@/components/Link'
import { Media } from '@/components/Media'
import RichText from '@/components/RichText'

export const MediumImpactHero: React.FC<Page['hero']> = ({ links, media, richText }) => {
  return (
    <div className="pt-24 pb-12">
      <div className="container">
        <div className="grid md:grid-cols-2 gap-8 items-center">
          {/* Text Content */}
          <div className="order-2 md:order-1">
            {richText && (
              <div className="mb-6">
                <RichText data={richText} enableGutter={false} />
              </div>
            )}

        {Array.isArray(links) && links.length > 0 && (
              <div className="flex flex-wrap gap-4">
                {links.map(({ link }, i) => (
                  <CMSLink 
                    key={i}
                    {...link} 
                    className={i === 0 
                      ? "px-6 py-3 bg-black text-white rounded-md transition-all hover:bg-gray-800 font-medium"
                      : "px-6 py-3 border border-black rounded-md transition-all hover:bg-black hover:text-white font-medium"
                    }
                    overrideClassName={true}
                  />
                ))}
              </div>
        )}
      </div>
          
          {/* Media Content */}
          <div className="order-1 md:order-2">
        {media && typeof media === 'object' && (
              <div className="rounded-lg overflow-hidden shadow-lg">
            <Media
                  imgClassName="w-full h-auto object-cover"
              priority
              resource={media}
            />
            {media?.caption && (
                  <div className="mt-3 px-4 py-2 text-sm text-gray-600 italic">
                <RichText data={media.caption} enableGutter={false} />
              </div>
            )}
          </div>
        )}
          </div>
        </div>
      </div>
    </div>
  )
}
