import type { CollectionAfterChangeHook, CollectionAfterDeleteHook } from 'payload'

// Using fetch to revalidate paths and tags through the API endpoint
// This approach works with both Server and Client Components

import type { Post } from '../../../payload-types'

export const revalidatePost: CollectionAfterChangeHook<Post> = ({
  doc,
  previousDoc,
  req: { payload, context },
}) => {
  if (!context.disableRevalidate) {
    if (doc._status === 'published') {
      const path = `/posts/${doc.slug}`

      payload.logger.info(`Revalidating post at path: ${path}`)

      // Revalidate the post path using the API endpoint
      fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/revalidate?path=${encodeURIComponent(path)}&secret=${process.env.PAYLOAD_SECRET}`)
        .catch(err => payload.logger.error(`Error revalidating path ${path}: ${err}`))
      
      // Revalidate the sitemap tag
      fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/revalidate?tag=posts-sitemap&secret=${process.env.PAYLOAD_SECRET}`)
        .catch(err => payload.logger.error(`Error revalidating tag posts-sitemap: ${err}`))
    }

    // If the post was previously published, we need to revalidate the old path
    if (previousDoc._status === 'published' && doc._status !== 'published') {
      const oldPath = `/posts/${previousDoc.slug}`

      payload.logger.info(`Revalidating old post at path: ${oldPath}`)

      // Revalidate the old post path using the API endpoint
      fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/revalidate?path=${encodeURIComponent(oldPath)}&secret=${process.env.PAYLOAD_SECRET}`)
        .catch(err => payload.logger.error(`Error revalidating path ${oldPath}: ${err}`))
      
      // Revalidate the sitemap tag
      fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/revalidate?tag=posts-sitemap&secret=${process.env.PAYLOAD_SECRET}`)
        .catch(err => payload.logger.error(`Error revalidating tag posts-sitemap: ${err}`))
    }
  }
  return doc
}

export const revalidateDelete: CollectionAfterDeleteHook<Post> = ({ doc, req: { payload, context } }) => {
  if (!context.disableRevalidate) {
    const path = `/posts/${doc?.slug}`
    
    payload?.logger?.info(`Revalidating deleted post at path: ${path}`)
    
    // Revalidate the post path using the API endpoint
    fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/revalidate?path=${encodeURIComponent(path)}&secret=${process.env.PAYLOAD_SECRET}`)
      .catch(err => payload?.logger?.error(`Error revalidating path ${path}: ${err}`))
    
    // Revalidate the sitemap tag
    fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/revalidate?tag=posts-sitemap&secret=${process.env.PAYLOAD_SECRET}`)
      .catch(err => payload?.logger?.error(`Error revalidating tag posts-sitemap: ${err}`))
  }

  return doc
}
