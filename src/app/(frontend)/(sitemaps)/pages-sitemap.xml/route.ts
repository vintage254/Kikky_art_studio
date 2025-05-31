import { getServerSideSitemap } from 'next-sitemap'
import { unstable_cache } from 'next/cache'

// Define types for page objects
interface PageDoc {
  slug?: string;
  updatedAt?: string;
}

const getPagesSitemap = unstable_cache(
  async () => {
    // Use fetch API instead of direct Payload import
    const SITE_URL =
      process.env.NEXT_PUBLIC_SERVER_URL ||
      process.env.VERCEL_PROJECT_PRODUCTION_URL ||
      'https://example.com'
    
    // Call the pages API with appropriate parameters
    const apiUrl = new URL('/api/pages', SITE_URL)
    apiUrl.searchParams.set('limit', '1000')
    apiUrl.searchParams.set('select', 'slug,updatedAt')
    apiUrl.searchParams.set('where', JSON.stringify({
      _status: {
        equals: 'published'
      }
    }))
    
    const response = await fetch(apiUrl.toString())
    if (!response.ok) {
      console.error('Failed to fetch pages for sitemap')
      return []
    }
    
    const results = await response.json()

    const dateFallback = new Date().toISOString()

    const defaultSitemap = [
      {
        loc: `${SITE_URL}/search`,
        lastmod: dateFallback,
      },
      {
        loc: `${SITE_URL}/posts`,
        lastmod: dateFallback,
      },
    ]

    const sitemap = results.docs
      ? results.docs
          .filter((page: PageDoc) => Boolean(page?.slug))
          .map((page: PageDoc) => {
            return {
              loc: page?.slug === 'home' ? `${SITE_URL}/` : `${SITE_URL}/${page?.slug}`,
              lastmod: page.updatedAt || dateFallback,
            }
          })
      : []

    return [...defaultSitemap, ...sitemap]
  },
  ['pages-sitemap'],
  {
    tags: ['pages-sitemap'],
  },
)

export async function GET() {
  const sitemap = await getPagesSitemap()

  return getServerSideSitemap(sitemap)
}
