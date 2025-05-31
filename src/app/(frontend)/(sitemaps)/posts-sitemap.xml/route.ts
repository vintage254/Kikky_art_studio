import { getServerSideSitemap } from 'next-sitemap'
import { unstable_cache } from 'next/cache'

// Define types for post objects
interface PostDoc {
  slug?: string;
  updatedAt?: string;
}

const getPostsSitemap = unstable_cache(
  async () => {
    // Use fetch API instead of direct Payload import
    const SITE_URL =
      process.env.NEXT_PUBLIC_SERVER_URL ||
      process.env.VERCEL_PROJECT_PRODUCTION_URL ||
      'https://example.com'
    
    // Call the posts API with appropriate parameters
    const apiUrl = new URL('/api/posts', SITE_URL)
    apiUrl.searchParams.set('limit', '1000')
    apiUrl.searchParams.set('select', 'slug,updatedAt')
    apiUrl.searchParams.set('where', JSON.stringify({
      _status: {
        equals: 'published'
      }
    }))
    
    const response = await fetch(apiUrl.toString())
    if (!response.ok) {
      console.error('Failed to fetch posts for sitemap')
      return []
    }
    
    const results = await response.json()

    const dateFallback = new Date().toISOString()

    const sitemap = results.docs
      ? results.docs
          .filter((post: PostDoc) => Boolean(post?.slug))
          .map((post: PostDoc) => ({
            loc: `${SITE_URL}/posts/${post?.slug}`,
            lastmod: post.updatedAt || dateFallback,
          }))
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
