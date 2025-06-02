import type { Metadata } from 'next/types'

import { CollectionArchive } from '@/components/CollectionArchive'
import React from 'react'
import { Search } from '@/search/Component'
import PageClient from './page.client'
import { CardPostData } from '@/components/Card'

type Args = {
  searchParams: Promise<{
    q: string
  }>
}
export default async function Page({ searchParams: searchParamsPromise }: Args) {
  const { q: query } = await searchParamsPromise
  
  // Use direct Payload API calls instead of API routes for static generation
  const { getPayload } = await import('payload')
  const { default: configPromise } = await import('@payload-config')
  
  const payload = await getPayload({ config: configPromise })
  
  // Use Payload's local search functionality
  let posts: { docs: CardPostData[]; totalDocs: number } = { docs: [], totalDocs: 0 }
  
  if (query) {
    // Search in posts collection
    const postsResults = await payload.find({
      collection: 'posts',
      where: {
        or: [
          {
            title: {
              like: query,
            },
          },
          {
            'content.children.text': {
              like: query,
            },
          },
        ],
        _status: {
          equals: 'published',
        },
      },
      depth: 1,
    })
    
    // Search in products collection
    const productsResults = await payload.find({
      collection: 'products',
      where: {
        or: [
          {
            title: {
              like: query,
            },
          },
          {
            'description.children.text': {
              like: query,
            },
          },
        ],
        _status: {
          equals: 'published',
        },
      },
      depth: 1,
    })
    
    // Combine results and handle type compatibility
    posts = {
      docs: [...postsResults.docs, ...productsResults.docs] as CardPostData[],
      totalDocs: postsResults.totalDocs + productsResults.totalDocs
    }
  }

  return (
    <div className="pt-24 pb-24">
      <PageClient />
      <div className="container mb-16">
        <div className="prose dark:prose-invert max-w-none text-center">
          <h1 className="mb-8 lg:mb-16">Search</h1>

          <div className="max-w-[50rem] mx-auto">
            <Search />
          </div>
        </div>
      </div>

      {posts.totalDocs > 0 ? (
        <CollectionArchive posts={posts.docs as CardPostData[]} />
      ) : (
        <div className="container">No results found.</div>
      )}
    </div>
  )
}

export function generateMetadata(): Metadata {
  return {
    title: `Payload Website Template Search`,
  }
}
