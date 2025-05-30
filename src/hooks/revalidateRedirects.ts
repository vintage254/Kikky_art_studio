import type { CollectionAfterChangeHook } from 'payload'

// Using fetch to revalidate tags through the API endpoint
// This approach works with both Server and Client Components

export const revalidateRedirects: CollectionAfterChangeHook = ({ doc, req: { payload } }) => {
  payload.logger.info(`Revalidating redirects`)

  // Revalidate the redirects tag using the API endpoint
  fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/revalidate?tag=redirects&secret=${process.env.PAYLOAD_SECRET}`)
    .catch(err => payload.logger.error(`Error revalidating tag redirects: ${err}`))

  return doc
}
