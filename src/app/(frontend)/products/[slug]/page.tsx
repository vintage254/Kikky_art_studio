import React, { cache } from 'react'
import { Metadata } from 'next'
import { draftMode } from 'next/headers'
import { notFound } from 'next/navigation'
import { PayloadRedirects } from '@/components/PayloadRedirects'
import { LivePreviewListener } from '@/components/LivePreviewListener'
import { Gutter } from '@/components/ui/Gutter'
import { generateMeta } from '@/utilities/generateMeta'
import ProductDetailClient from './product-detail.client'
import { getPayload } from 'payload'
import configPromise from '@payload-config'

// Use a cache function to fetch the product by slug
const getProductBySlug = cache(async (slug: string) => {
  try {
    // Use the API endpoint instead of direct Payload import
    const apiUrl = new URL(`/api/products/${slug}`, process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000')
    
    const response = await fetch(apiUrl.toString(), {
      next: { tags: [`product-${slug}`] }
    })
    
    if (!response.ok) {
      if (response.status === 404) {
        return null
      }
      throw new Error(`Failed to fetch product: ${response.statusText}`)
    }
    
    return await response.json()
  } catch (error) {
    console.error(`Error fetching product with slug ${slug}:`, error)
    return null
  }
})

// For metadata generation
export async function generateMetadata({ params }: { params: { slug: string } }): Promise<Metadata> {
  // Use the separate function to get the product
  const product = await getProductBySlug(params.slug)
  
  if (!product) {
    return {
      title: 'Product Not Found',
      description: 'The requested product could not be found.',
    }
  }
  
  // Create a Page-compatible object for metadata generation
  const metaDoc = {
    title: product.title || 'Product Details',
    meta: product.meta || {},
    slug: product.slug
  }
  
  return generateMeta({ doc: metaDoc })
}

// For static generation
export async function generateStaticParams() {
  const payload = await getPayload({ config: configPromise })
  const products = await payload.find({
    collection: 'products',
    where: {
      isActive: {
        equals: true,
      }
    },
    limit: 100,
    depth: 0,
  })

  return products.docs.map(product => ({
    slug: product.slug,
  }))
}

// Main page component
export default async function ProductDetailPage({ params }: { params: { slug: string } }) {
  // Get draft mode status
  const { isEnabled: draft } = await draftMode()
  
  // Use the separate function to get the product
  const product = await getProductBySlug(params.slug)

  // Handle not found case
  if (!product) {
    return notFound()
  }

  return (
    <div className="product-detail-page">
      {draft && <LivePreviewListener />}
      <PayloadRedirects url={`/products/${params.slug}`} disableNotFound={true} />
      <Gutter>
        <ProductDetailClient product={product} />
      </Gutter>
    </div>
  )
}
