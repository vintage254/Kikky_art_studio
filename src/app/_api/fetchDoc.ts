import type { RequestCookie } from 'next/dist/compiled/@edge-runtime/cookies'

import type { Config } from '../../payload/payload-types'
import { ORDER } from '../_graphql/orders'
import { PAGE } from '../_graphql/pages'
import { PRODUCT } from '../_graphql/products'
import { GRAPHQL_API_URL } from './shared'
import { payloadToken } from './token'

const queryMap = {
  pages: {
    query: PAGE,
    key: 'Pages',
  },
  products: {
    query: PRODUCT,
    key: 'Products',
  },
  orders: {
    query: ORDER,
    key: 'Orders',
  },
}

export const fetchDoc = async <T>(args: {
  collection: keyof Config['collections']
  slug?: string
  id?: string
  draft?: boolean
}): Promise<T | null> => {
  const { collection, slug, draft } = args || {}

  // Skip API calls during build if env variable is set
  if (process.env.SKIP_API_DURING_BUILD === 'true' && process.env.NODE_ENV === 'production') {
    console.log(`Skipping API call to fetch ${collection}/${slug} during build`)
    return null
  }

  if (!queryMap[collection]) throw new Error(`Collection ${collection} not found`)

  let token: RequestCookie | undefined

  if (draft) {
    const { cookies } = await import('next/headers')
    token = cookies().get(payloadToken)
  }

  try {
    const doc: T = await fetch(`${GRAPHQL_API_URL}/api/graphql`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        ...(token?.value && draft ? { Authorization: `JWT ${token.value}` } : {}),
      },
      cache: 'no-store',
      next: { tags: [`${collection}_${slug}`] },
      body: JSON.stringify({
        query: queryMap[collection].query,
        variables: {
          slug,
          draft,
        },
      }),
    })
      ?.then(res => res.json())
      ?.then(res => {
        if (res.errors) throw new Error(res?.errors?.[0]?.message ?? 'Error fetching doc')
        return res?.data?.[queryMap[collection].key]?.docs?.[0] || null
      })

    return doc
  } catch (error) {
    console.error(`Error fetching ${collection}/${slug}:`, error)
    // Return null instead of throwing during production build
    if (process.env.NODE_ENV === 'production') {
      return null
    }
    throw error
  }
}
