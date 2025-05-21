import type { Metadata } from 'next'

import { PayloadRedirects } from '@/components/PayloadRedirects'
import configPromise from '@payload-config'
import { getPayload, type RequiredDataFromCollectionSlug } from 'payload'
import { draftMode } from 'next/headers'
import React, { cache } from 'react'
import { homeStatic } from '@/endpoints/seed/home-static'

import { RenderBlocks } from '@/blocks/RenderBlocks'
import { RenderHero } from '@/heros/RenderHero'
import { generateMeta } from '@/utilities/generateMeta'
import PageClient from './page.client'
import { LivePreviewListener } from '@/components/LivePreviewListener'

import { Gutter } from '@/components/ui/Gutter'
import classes from './index.module.scss'

export async function generateStaticParams() {
  const payload = await getPayload({ config: configPromise })
  const pages = await payload.find({
    collection: 'pages',
    draft: false,
    limit: 1000,
    overrideAccess: false,
    pagination: false,
    select: {
      slug: true,
    },
  })

  const params = pages.docs
    ?.filter((doc) => {
      return doc.slug !== 'home'
    })
    .map(({ slug }) => {
      return { slug }
    })

  return params
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
    ctaBlock = layout.find(block => block.blockType === 'cta') || null
    
    // Filter out the CTA block from the layout so it's not rendered twice
    filteredLayout = layout.filter(block => block.blockType !== 'cta')
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

  const payload = await getPayload({ config: configPromise })

  const result = await payload.find({
    collection: 'pages',
    draft,
    limit: 1,
    pagination: false,
    overrideAccess: draft,
    where: {
      slug: {
        equals: slug,
      },
    },
  })

  return result.docs?.[0] || null
})
