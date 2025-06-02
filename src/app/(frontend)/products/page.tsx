import React, { Suspense } from 'react'
import { Metadata } from 'next'
import { draftMode } from 'next/headers'
import { PayloadRedirects } from '@/components/PayloadRedirects'
import { LivePreviewListener } from '@/components/LivePreviewListener'
import { Gutter } from '@/components/ui/Gutter'
import { generateMeta } from '@/utilities/generateMeta'
import ProductsClient from './products.client'
import { ProductHero } from './ProductHero'

export async function generateMetadata(): Promise<Metadata> {
  try {
    // Use direct Payload API call instead of API route for static generation
    const { getPayload } = await import('payload')
    const { default: configPromise } = await import('@payload-config')
    
    const payload = await getPayload({ config: configPromise })
    
    const productsPage = await payload.find({
      collection: 'pages',
      where: {
        slug: {
          equals: 'products'
        }
      },
      limit: 1
    })

    const doc = productsPage.docs?.[0] || null
    return generateMeta({ doc })
  } catch (error) {
    console.error('Error generating metadata:', error)
    return {
      title: 'Products',
      description: 'Browse our products',
    }
  }
}

export default async function ProductsPage() {
  console.log('Rendering custom Products page')
  const { isEnabled: draft } = await draftMode()
  
  // Use direct Payload API calls instead of API routes for static generation
  const { getPayload } = await import('payload')
  const { default: configPromise } = await import('@payload-config')
  
  const payload = await getPayload({ config: configPromise })
  
  // Fetch the Products page data
  let productsPageQuery = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'products'
      },
      _status: {
        equals: draft ? undefined : 'published'
      }
    },
    limit: 1,
    depth: 2
  })
  
  let productsPageData = productsPageQuery
  
  // If we don't find it with lowercase, try with capitalized first letter
  if (productsPageData.docs.length === 0) {
    productsPageQuery = await payload.find({
      collection: 'pages',
      where: {
        slug: {
          equals: 'Products'
        },
        _status: {
          equals: draft ? undefined : 'published'
        }
      },
      limit: 1,
      depth: 2
    })
    productsPageData = productsPageQuery
  }

  // Get all categories
  const categoriesData = await payload.find({
    collection: 'categories',
    limit: 100,
    depth: 1
  })

  // Get all products
  const productsData = await payload.find({
    collection: 'products',
    limit: 100,
    depth: 2,
    where: {
      _status: {
        equals: draft ? undefined : 'published'
      }
    }
  })

  // Ensure we have proper data structures even if API returns unexpected results
  const products = (productsData?.docs && Array.isArray(productsData.docs)) ? productsData.docs : []
  const categories = (categoriesData?.docs && Array.isArray(categoriesData.docs)) ? categoriesData.docs : []
  const productsPage = productsPageData.docs?.[0] || null

  if (!productsPage) {
    return (
      <div>
        <h1>Products page not found</h1>
        <p>Please create a page with slug "products" in the CMS.</p>
      </div>
    )
  }

  // Debug logs commented out now that everything is working
  // console.log('Products page hero data:', productsPage?.hero)
  
  // Extract hero image from CMS data
  let heroImage = null;
  
  // First check if hero media exists and is an upload field
  if (productsPage?.hero?.media && typeof productsPage.hero.media === 'object') {
    // Check direct URL access for Payload CMS v3 format
    if ('url' in productsPage.hero.media) {
      heroImage = {
        url: String(productsPage.hero.media.url),
        alt: 'alt' in productsPage.hero.media ? String(productsPage.hero.media.alt) : 'Product Collection'
      };
    } 
    // For relation to Media collection
    else if ('image' in productsPage.hero.media) {
      const imageData = productsPage.hero.media.image;
      if (typeof imageData === 'object' && imageData && 'url' in imageData) {
        heroImage = {
          url: String(imageData.url),
          alt: 'alt' in imageData ? String(imageData.alt) : 'Product Collection'
        };
      }
    }
  }
  
  // console.log('Extracted hero image:', heroImage)
  
  // Extract tagline from rich text content if available
  let tagline = 'NEW COLLECTIONS'
  if (productsPage?.hero?.richText?.root?.children && 
      Array.isArray(productsPage.hero.richText.root.children) && 
      productsPage.hero.richText.root.children.length > 0) {
    const firstParagraph = productsPage.hero.richText.root.children[0]
    if (firstParagraph?.children && 
        Array.isArray(firstParagraph.children) && 
        firstParagraph.children.length > 0 && 
        firstParagraph.children[0]?.text) {
      tagline = firstParagraph.children[0].text
    }
  }

  return (
    <article>
      {/* Allows redirects for valid pages too */}
      <PayloadRedirects disableNotFound url="/products" />

      {draft && <LivePreviewListener />}

      {/* Custom Hero Section */}
      <ProductHero 
        heroImage={heroImage} 
        title={productsPage.title || 'PRODUCTS'}
        tagline={tagline}
      />

      <Gutter className="mt-12 mb-24">
        {/* Pass the data to the client component wrapped in Suspense */}
        <Suspense fallback={<div>Loading products...</div>}>
          <ProductsClient 
            categories={categories} 
            products={products} 
            pageTitle={productsPage.title || 'Products'} 
            heroImage={heroImage}
            tagline={tagline}
          />
        </Suspense>
      </Gutter>
    </article>
  )
}
