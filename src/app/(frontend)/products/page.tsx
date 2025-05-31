import React from 'react'
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
    // Use API endpoint to fetch page data
    const pageUrl = new URL('/api/pages', process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000')
    pageUrl.searchParams.set('slug', 'products')
    pageUrl.searchParams.set('limit', '1')
    
    const response = await fetch(pageUrl.toString())
    const productsPage = await response.json()

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
  
  // Fetch the Products page data using API endpoint
  const pageUrl = new URL('/api/pages', process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000')
  pageUrl.searchParams.set('slug', 'products')
  pageUrl.searchParams.set('limit', '1')
  pageUrl.searchParams.set('depth', '2')
  
  let response = await fetch(pageUrl.toString(), { next: { tags: ['products-page'] } })
  let productsPageData = await response.json()
  
  // If we don't find it with lowercase, try with capitalized first letter
  if (productsPageData.docs.length === 0) {
    pageUrl.searchParams.set('slug', 'Products')
    response = await fetch(pageUrl.toString(), { next: { tags: ['products-page'] } })
    productsPageData = await response.json()
  }

  // Get all categories using API endpoint
  const categoriesUrl = new URL('/api/categories', process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000')
  categoriesUrl.searchParams.set('limit', '100')
  const categoriesResponse = await fetch(categoriesUrl.toString(), { next: { tags: ['categories'] } })
  const categoriesData = await categoriesResponse.json()

  // Get all products using API endpoint
  const productsUrl = new URL('/api/products', process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000')
  productsUrl.searchParams.set('limit', '100')
  const productsResponse = await fetch(productsUrl.toString(), { next: { tags: ['products'] } })
  const productsData = await productsResponse.json()

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
        {/* Pass the data to the client component */}
        <ProductsClient 
          categories={categories} 
          products={products} 
          pageTitle={productsPage.title || 'Products'} 
          heroImage={heroImage}
          tagline={tagline}
        />
      </Gutter>
    </article>
  )
}
