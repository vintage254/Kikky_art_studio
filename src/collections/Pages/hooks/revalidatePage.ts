import type { CollectionAfterChangeHook, CollectionAfterDeleteHook } from 'payload'

// Using fetch to revalidate paths and tags through the API endpoint
// This approach works with both Server and Client Components

import type { Page } from '../../../payload-types'

export const revalidatePage: CollectionAfterChangeHook<Page> = ({
  doc,
  previousDoc,
  req: { payload, context },
}) => {
  if (!context.disableRevalidate) {
    if (doc._status === 'published') {
      const path = doc.slug === 'home' ? '/' : `/${doc.slug}`

      payload.logger.info(`Revalidating page at path: ${path}`)

      // Revalidate the page path using the API endpoint
      fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/revalidate?path=${encodeURIComponent(path)}&secret=${process.env.PAYLOAD_SECRET}`)
        .catch(err => payload.logger.error(`Error revalidating path ${path}: ${err}`))
      
      // Revalidate the sitemap tag
      fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/revalidate?tag=pages-sitemap&secret=${process.env.PAYLOAD_SECRET}`)
        .catch(err => payload.logger.error(`Error revalidating tag pages-sitemap: ${err}`))
    }

    // If the page was previously published, we need to revalidate the old path
    if (previousDoc?._status === 'published' && doc._status !== 'published') {
      const oldPath = previousDoc.slug === 'home' ? '/' : `/${previousDoc.slug}`

      payload.logger.info(`Revalidating old page at path: ${oldPath}`)

      // Revalidate the old page path using the API endpoint
      fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/revalidate?path=${encodeURIComponent(oldPath)}&secret=${process.env.PAYLOAD_SECRET}`)
        .catch(err => payload.logger.error(`Error revalidating path ${oldPath}: ${err}`))
      
      // Revalidate the sitemap tag
      fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/revalidate?tag=pages-sitemap&secret=${process.env.PAYLOAD_SECRET}`)
        .catch(err => payload.logger.error(`Error revalidating tag pages-sitemap: ${err}`))
    }
  }
  return doc
}

export const revalidateDelete: CollectionAfterDeleteHook<Page> = ({ doc, req: { payload, context } }) => {
  if (!context.disableRevalidate) {
    const path = doc?.slug === 'home' ? '/' : `/${doc?.slug}`
    
    payload?.logger?.info(`Revalidating deleted page at path: ${path}`)
    
    // Revalidate the page path using the API endpoint
    fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/revalidate?path=${encodeURIComponent(path)}&secret=${process.env.PAYLOAD_SECRET}`)
      .catch(err => payload?.logger?.error(`Error revalidating path ${path}: ${err}`))
    
    // Revalidate the sitemap tag
    fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/revalidate?tag=pages-sitemap&secret=${process.env.PAYLOAD_SECRET}`)
      .catch(err => payload?.logger?.error(`Error revalidating tag pages-sitemap: ${err}`))
  }

  return doc
}
