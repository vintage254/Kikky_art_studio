import { formatDateTime } from 'src/utilities/formatDateTime'
import React from 'react'

import type { Post } from '@/payload-types'

import { Media } from '@/components/Media'
import { formatAuthors } from '@/utilities/formatAuthors'

export const PostHero: React.FC<{
  post: Post
}> = ({ post }) => {
  const { categories, heroImage, populatedAuthors, publishedAt, title } = post

  const hasAuthors =
    populatedAuthors && populatedAuthors.length > 0 && formatAuthors(populatedAuthors) !== ''

  return (
    <div className="relative pt-24 min-h-[80vh] flex items-center">
      {/* Hero image positioned absolute to fill the container */}
      {heroImage && typeof heroImage !== 'string' && (
        <div className="absolute inset-0 w-full h-full">
          <Media fill priority imgClassName="object-cover" resource={heroImage} />
          {/* Gradient overlay for better text readability */}
          <div className="absolute inset-0 bg-gradient-to-r from-black/70 via-black/40 to-transparent" />
        </div>
      )}
      
      <div className="container z-10 relative text-white">
        <div className="max-w-2xl">
          <div className="uppercase text-sm mb-4 opacity-90">
            {categories?.map((category, index) => {
              if (typeof category === 'object' && category !== null) {
                const { title: categoryTitle } = category

                const titleToUse = categoryTitle || 'Untitled category'

                const isLast = index === categories.length - 1

                return (
                  <React.Fragment key={index}>
                    {titleToUse}
                    {!isLast && <React.Fragment>, &nbsp;</React.Fragment>}
                  </React.Fragment>
                )
              }
              return null
            })}
          </div>

          <h1 className="mb-6 text-3xl md:text-5xl lg:text-6xl font-bold text-shadow-md">
            {title}
          </h1>

          <div className="flex flex-col md:flex-row gap-4 md:gap-16 text-white/90 backdrop-blur-sm bg-black/20 p-4 rounded-md inline-block">
            {hasAuthors && (
              <div className="flex flex-col gap-2">
                <p className="text-sm font-medium">Author</p>
                <p className="text-shadow-sm">{formatAuthors(populatedAuthors)}</p>
              </div>
            )}
            {publishedAt && (
              <div className="flex flex-col gap-2">
                <p className="text-sm font-medium">Date Published</p>
                <time dateTime={publishedAt} className="text-shadow-sm">
                  {formatDateTime(publishedAt)}
                </time>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
