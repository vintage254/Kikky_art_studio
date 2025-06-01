import type { Metadata } from 'next'

import { RelatedPosts } from '@/blocks/RelatedPosts/Component'
import { PayloadRedirects } from '@/components/PayloadRedirects'
import { draftMode } from 'next/headers'
import React, { cache } from 'react'
import RichText from '@/components/RichText'

import type { Post } from '@/payload-types'

import { PostHero } from '@/heros/PostHero'
import { generateMeta } from '@/utilities/generateMeta'
import PageClient from './page.client'
import { LivePreviewListener } from '@/components/LivePreviewListener'
import { getPayload } from 'payload'
import configPromise from '@payload-config'

export async function generateStaticParams() {
  try {
    // Use Payload directly during build time instead of API routes
    const payload = await getPayload({ config: configPromise })
    
    const posts = await payload.find({
      collection: 'posts',
      limit: 1000,
    })

    const params = posts.docs.map(({ slug }) => {
      return { slug }
    })

    return params || []
  } catch (error) {
    console.error('Error generating static params for posts:', error)
    return [] // Return empty array as fallback
  }
}

type Args = {
  params: Promise<{
    slug?: string
  }>
}

export default async function Post({ params: paramsPromise }: Args) {
  const { isEnabled: draft } = await draftMode()
  const { slug = '' } = await paramsPromise
  const url = '/posts/' + slug
  const post = await queryPostBySlug({ slug })

  if (!post) return <PayloadRedirects url={url} />

  return (
    <article className="pt-16 pb-16">
      <PageClient />

      {/* Allows redirects for valid pages too */}
      <PayloadRedirects disableNotFound url={url} />

      {draft && <LivePreviewListener />}

      <PostHero post={post} />

      <div className="flex flex-col items-center gap-4 pt-8">
        <div className="container">
          <RichText className="max-w-[48rem] mx-auto" data={post.content} enableGutter={false} />
          {post.relatedPosts && post.relatedPosts.length > 0 && (
            <RelatedPosts
              className="mt-12 max-w-[52rem] lg:grid lg:grid-cols-subgrid col-start-1 col-span-3 grid-rows-[2fr]"
              docs={post.relatedPosts.filter((post: any) => typeof post === 'object')}
            />
          )}
        </div>
      </div>
    </article>
  )
}

export async function generateMetadata({ params: paramsPromise }: Args): Promise<Metadata> {
  const { slug = '' } = await paramsPromise
  const post = await queryPostBySlug({ slug })

  return generateMeta({ doc: post })
}

const queryPostBySlug = cache(async ({ slug }: { slug: string }) => {
  const { isEnabled: draft } = await draftMode()

  // Use the API endpoint instead of direct Payload import
  const apiUrl = new URL('/api/posts', process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000')
  apiUrl.searchParams.set('slug', slug)
  
  try {
    const response = await fetch(apiUrl.toString(), { 
      next: { tags: [`post-${slug}`] }
    })
    
    if (!response.ok) {
      return null
    }
    
    // Single post returns the post object directly
    return await response.json()
  } catch (error) {
    console.error('Error fetching post:', error)
    return null
  }
})
