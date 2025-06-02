import type { Metadata } from 'next/types'

import { CollectionArchive } from '@/components/CollectionArchive'
import { PageRange } from '@/components/PageRange'
import { Pagination } from '@/components/Pagination'
import { draftMode } from 'next/headers'
import { notFound } from 'next/navigation'
import React from 'react'
import { Gutter } from '@/components/ui/Gutter'
import { getPayload } from 'payload'
import configPromise from '@payload-config'
import PageClient from './page.client'

export const revalidate = 600

type Args = {
  params: Promise<{
    pageNumber: string
  }>
}

export default async function Page({ params: paramsPromise }: Args) {
  const { pageNumber } = await paramsPromise

  const sanitizedPageNumber = Number(pageNumber)

  if (!Number.isInteger(sanitizedPageNumber)) notFound()

  // Use direct Payload API call instead of API route for static generation
  const { getPayload } = await import('payload')
  const { default: configPromise } = await import('@payload-config')
  
  const payload = await getPayload({ config: configPromise })
  
  const posts = await payload.find({
    collection: 'posts',
    where: {
      _status: {
        equals: 'published',
      },
    },
    limit: 12,
    page: sanitizedPageNumber,
    sort: '-publishedAt',
    depth: 1,
  })

  return (
    <div className="pb-24">
      <PageClient />
      <div className="container mb-16">
        <div className="prose dark:prose-invert max-w-none">
          <h1>Posts</h1>
        </div>
      </div>

      <div className="container mb-8">
        <PageRange
          collection="posts"
          currentPage={posts.page}
          limit={12}
          totalDocs={posts.totalDocs}
        />
      </div>

      <CollectionArchive posts={posts.docs} />

      <div className="container">
        {posts?.page && posts?.totalPages > 1 && (
          <Pagination page={posts.page} totalPages={posts.totalPages} />
        )}
      </div>
    </div>
  )
}

export async function generateMetadata({ params: paramsPromise }: Args): Promise<Metadata> {
  const { pageNumber } = await paramsPromise
  return {
    title: `Payload Website Template Posts Page ${pageNumber || ''}`,
  }
}

export async function generateStaticParams() {
  try {
    // Use Payload directly during build time instead of API routes
    const payload = await getPayload({ config: configPromise })
    
    // Get total count of posts
    const result = await payload.find({
      collection: 'posts',
      limit: 1, // Just need count information, not actual posts
    })
    
    const totalDocs = result.totalDocs
    const totalPages = Math.ceil(totalDocs / 10)
    
    const pages: { pageNumber: string }[] = []
    
    for (let i = 1; i <= totalPages; i++) {
      pages.push({ pageNumber: String(i) })
    }
    
    return pages
  } catch (error) {
    console.error('Error generating static params for post pages:', error)
    return [] // Return empty array as fallback
  }
}
