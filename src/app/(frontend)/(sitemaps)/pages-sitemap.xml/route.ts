import { getServerSideSitemap } from 'next-sitemap'
import { unstable_cache } from 'next/cache'

// Define types for page objects from Payload
interface PageDoc {
  slug?: string | null;
  updatedAt?: string;
  _status?: string;
  _id?: string;
}

const getPagesSitemap = unstable_cache(
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
        collection: 'pages',
        limit: 1000,
        where: {
          _status: {
            equals: 'published'
          }
        },
        depth: 0,
      })
    } catch (error) {
      console.error('Failed to fetch pages for sitemap', error)
      return []
    }

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
          .filter((page: any): page is PageDoc => Boolean(page?.slug))
          .map((page: any) => {
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
