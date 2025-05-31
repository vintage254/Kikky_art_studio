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
  
  // Use the server API endpoint instead of direct Payload import
  const apiUrl = new URL('/api/search', process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000')
  if (query) {
    apiUrl.searchParams.set('q', query)
  }
  
  const response = await fetch(apiUrl.toString(), { next: { tags: ['search'] } })
  const { docs: posts } = await response.json()

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
