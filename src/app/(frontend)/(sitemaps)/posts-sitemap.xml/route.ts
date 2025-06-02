import { getServerSideSitemap } from 'next-sitemap'
import { unstable_cache } from 'next/cache'

// Define types for post objects from Payload
interface PostDoc {
  slug?: string | null;
  updatedAt?: string;
  _status?: string;
  _id?: string;
}

const getPostsSitemap = unstable_cache(
  async () => {
    // Use direct Payload API calls instead of API routes
    const SITE_URL =
      process.env.NEXT_PUBLIC_SERVER_URL ||
      process.env.VERCEL_PROJECT_PRODUCTION_URL ||
      'https://example.com'
    
    // Use Payload directly
    const { getPayload } = await import('payload')
    const { default: configPromise } = await import('@payload-config')
    
    const payload = await getPayload({ config: configPromise })
    
    let results
    
    try {
      results = await payload.find({
        collection: 'posts',
        limit: 1000,
        where: {
          _status: {
            equals: 'published'
          }
        },
        depth: 0,
      })
    } catch (error) {
      console.error('Failed to fetch posts for sitemap', error)
      return []
    }

    const dateFallback = new Date().toISOString()

    const sitemap = results.docs
      ? results.docs
          .filter((post: any): post is PostDoc => Boolean(post?.slug))
          .map((post: any) => {
            return {
              loc: `${SITE_URL}/posts/${post?.slug}`,
              lastmod: post.updatedAt || dateFallback,
            }
          })
      : []

    return sitemap
  },
  ['posts-sitemap'],
  {
    tags: ['posts-sitemap'],
  },
)

export async function GET() {
  const sitemap = await getPostsSitemap()

  return getServerSideSitemap(sitemap)
}
