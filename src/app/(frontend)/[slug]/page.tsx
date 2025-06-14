import type { Metadata } from 'next'

import { PayloadRedirects } from '@/components/PayloadRedirects'
import { draftMode } from 'next/headers'
import React, { cache } from 'react'
import { homeStatic } from '@/endpoints/seed/home-static'
import { getPayload } from 'payload'
import configPromise from '@payload-config'

// Define type for pages collection data
type RequiredDataFromCollectionSlug<T extends string> = {
  id: string
  title: string
  slug: string
  hero?: any
  layout?: any[]
  meta?: {
    title?: string
    description?: string
    image?: any
  }
}

import { RenderBlocks } from '@/blocks/RenderBlocks'
import { RenderHero } from '@/heros/RenderHero'
import { generateMeta } from '@/utilities/generateMeta'
import PageClient from './page.client'
import { LivePreviewListener } from '@/components/LivePreviewListener'

import { Gutter } from '@/components/ui/Gutter'
import classes from './index.module.scss'

export async function generateStaticParams() {
  try {
    // Use Payload directly during build time instead of API routes
    const payload = await getPayload({ config: configPromise })
    
    const pages = await payload.find({
      collection: 'pages',
      limit: 1000,
    })

    const params = pages.docs
      ?.filter((doc) => {
        // Exclude home, products, and account slugs as they have custom implementations
        return doc.slug !== 'home' && doc.slug !== 'products' && doc.slug !== 'account'
      })
      .map(({ slug }) => {
        return { slug }
      })

    return params || []
  } catch (error) {
    console.error('Error generating static params:', error)
    return [] // Return empty array as fallback
  }
}

type Args = {
  params: Promise<{
    slug?: string
  }>
}

export default async function Page({ params: paramsPromise }: Args) {
  const { isEnabled: draft } = await draftMode()
  const { slug = 'home' } = await paramsPromise
  const url = '/' + slug

  // Special handling for account page - redirect to the account UI
  if (slug === 'account') {
    return <PayloadRedirects url="/account" forceRedirect />
  }

  let page: RequiredDataFromCollectionSlug<'pages'> | null

  page = await queryPageBySlug({
    slug,
  })

  // Remove this code once your website is seeded
  if (!page && slug === 'home') {
    page = homeStatic
  }

  if (!page) {
    return <PayloadRedirects url={url} />
  }

  const { hero, layout } = page
  
  // Fetch data if this is the home page
  let categories = null
  let featuredProducts = null
  let aboutPage = null

  if (slug === 'home') {
    const payload = await getPayload({ config: configPromise })
    
    // Fetch categories
    try {
      const categoriesResult = await payload.find({
        collection: 'categories',
        limit: 10,
      })
      categories = categoriesResult.docs
    } catch (error) {
      console.error('Error fetching categories:', error)
    }

    // Fetch featured products
    try {
      const productsResult = await payload.find({
        collection: 'products',
        limit: 6,
        where: {
          isFeatured: {
            equals: true,
          },
          isActive: {
            equals: true,
          },
        },
      })
      console.log(`[SERVER] Found ${productsResult.docs.length} featured products`)
      featuredProducts = productsResult.docs
    } catch (error) {
      console.error('Error fetching featured products:', error)
    }

    // Fetch about page
    try {
      const aboutPageResult = await payload.find({
        collection: 'pages',
        limit: 1,
        where: {
          slug: {
            equals: 'about',
          },
        },
      })
      
      if (aboutPageResult.docs && aboutPageResult.docs.length > 0) {
        const aboutPageData = aboutPageResult.docs[0]
        if (aboutPageData) {
          aboutPage = {
            title: aboutPageData.title || '',
            slug: aboutPageData.slug || '',
            description: aboutPageData.meta?.description || '',
          }
        }
      }
    } catch (error) {
      console.error('Error fetching about page:', error)
    }
  }

  // Extract the CTA block from layout if on home page
  let ctaBlock = null
  let filteredLayout = layout || []
  
  if (slug === 'home' && layout && layout.length > 0) {
    // Find and extract the CTA block
    ctaBlock = layout.find((block: { blockType: string }) => block.blockType === 'cta') || null
    
    // Filter out the CTA block from the layout so it's not rendered twice
    filteredLayout = layout.filter((block: { blockType: string }) => block.blockType !== 'cta')
  }

  return (
    <article className="pb-24">
      {/* Allows redirects for valid pages too */}
      <PayloadRedirects disableNotFound url={url} />

      {draft && <LivePreviewListener />}

      {slug === 'home' ? (
        <section>
          <RenderHero {...hero} />
          {/* Render content blocks from layout here, excluding CTA block */}
          {filteredLayout && filteredLayout.length > 0 && (
            <Gutter className="my-12">
              <RenderBlocks blocks={filteredLayout} />
            </Gutter>
          )}
          <Gutter className={classes.home}>
            {/* Pass data to the client component for the homepage */}
            <PageClient 
              categories={categories} 
              featuredProducts={featuredProducts}
              aboutPage={aboutPage}
              callToActionBlock={ctaBlock}
            />
          </Gutter>
        </section>
      ) : (
        <>
          <RenderHero {...hero} />
          <RenderBlocks blocks={layout} />
        </>
      )}
    </article>
  )
}

export async function generateMetadata({ params: paramsPromise }: Args): Promise<Metadata> {
  const { slug = 'home' } = await paramsPromise
  const page = await queryPageBySlug({
    slug,
  })

  return generateMeta({ doc: page })
}

const queryPageBySlug = cache(async ({ slug }: { slug: string }) => {
  const { isEnabled: draft } = await draftMode()

  try {
    // Use Payload directly during build time instead of API routes
    const payload = await getPayload({ config: configPromise })
    
    const result = await payload.find({
      collection: 'pages',
      where: {
        slug: {
          equals: slug
        }
      },
      limit: 1,
      draft: draft
    })
    
    return result.docs?.[0] || null
  } catch (error) {
    console.error(`Error fetching page with slug ${slug}:`, error)
    return null
  }
})
