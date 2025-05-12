import type { Footer, Header, Settings } from '../../payload/payload-types'
import { FOOTER_QUERY, HEADER_QUERY, SETTINGS_QUERY } from '../_graphql/globals'
import { GRAPHQL_API_URL } from './shared'

// Empty fallback data for globals
const DEFAULT_HEADER: Header = {
  id: 'default-header',
  navItems: [],
}

const DEFAULT_FOOTER: Footer = {
  id: 'default-footer',
  navItems: [],
}

const DEFAULT_SETTINGS: Settings = {
  id: 'default-settings',
}

export async function fetchSettings(): Promise<Settings> {
  // Skip API calls if URL is not available or we're in a build environment
  if (!GRAPHQL_API_URL || process.env.SKIP_API_DURING_BUILD === 'true') {
    console.log('Skipping settings fetch, using default data')
    return DEFAULT_SETTINGS
  }

  try {
    console.log(`Fetching settings from ${GRAPHQL_API_URL}/api/graphql`)

  const settings = await fetch(`${GRAPHQL_API_URL}/api/graphql`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    cache: 'no-store',
    body: JSON.stringify({
      query: SETTINGS_QUERY,
    }),
  })
    ?.then(res => {
        if (!res.ok) throw new Error(`Error fetching settings: ${res.status}`)
      return res.json()
    })
    ?.then(res => {
      if (res?.errors) throw new Error(res?.errors[0]?.message || 'Error fetching settings')
        return res.data?.Settings || DEFAULT_SETTINGS
    })

  return settings
  } catch (error) {
    console.error('Error fetching settings:', error)
    return DEFAULT_SETTINGS
  }
}

export async function fetchHeader(): Promise<Header> {
  // Skip API calls if URL is not available or we're in a build environment
  if (!GRAPHQL_API_URL || process.env.SKIP_API_DURING_BUILD === 'true') {
    console.log('Skipping header fetch, using default data')
    return DEFAULT_HEADER
  }

  try {
    console.log(`Fetching header from ${GRAPHQL_API_URL}/api/graphql`)

  const header = await fetch(`${GRAPHQL_API_URL}/api/graphql`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    cache: 'no-store',
    body: JSON.stringify({
      query: HEADER_QUERY,
    }),
  })
    ?.then(res => {
        if (!res.ok) throw new Error(`Error fetching header: ${res.status}`)
      return res.json()
    })
    ?.then(res => {
      if (res?.errors) throw new Error(res?.errors[0]?.message || 'Error fetching header')
        return res.data?.Header || DEFAULT_HEADER
    })

  return header
  } catch (error) {
    console.error('Error fetching header:', error)
    return DEFAULT_HEADER
  }
}

export async function fetchFooter(): Promise<Footer> {
  // Skip API calls if URL is not available or we're in a build environment
  if (!GRAPHQL_API_URL || process.env.SKIP_API_DURING_BUILD === 'true') {
    console.log('Skipping footer fetch, using default data')
    return DEFAULT_FOOTER
  }

  try {
    console.log(`Fetching footer from ${GRAPHQL_API_URL}/api/graphql`)

  const footer = await fetch(`${GRAPHQL_API_URL}/api/graphql`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
      cache: 'no-store',
    body: JSON.stringify({
      query: FOOTER_QUERY,
    }),
  })
    .then(res => {
        if (!res.ok) throw new Error(`Error fetching footer: ${res.status}`)
      return res.json()
    })
    ?.then(res => {
      if (res?.errors) throw new Error(res?.errors[0]?.message || 'Error fetching footer')
        return res.data?.Footer || DEFAULT_FOOTER
    })

  return footer
  } catch (error) {
    console.error('Error fetching footer:', error)
    return DEFAULT_FOOTER
  }
}

export const fetchGlobals = async (): Promise<{
  settings: Settings
  header: Header
  footer: Footer
}> => {
  try {
  // initiate requests in parallel, then wait for them to resolve
  // this will eagerly start to the fetch requests at the same time
  // see https://nextjs.org/docs/app/building-your-application/data-fetching/fetching
  const settingsData = fetchSettings()
  const headerData = fetchHeader()
  const footerData = fetchFooter()

  const [settings, header, footer]: [Settings, Header, Footer] = await Promise.all([
    await settingsData,
    await headerData,
    await footerData,
  ])

  return {
    settings,
    header,
    footer,
    }
  } catch (error) {
    console.error('Error fetching globals:', error)
    return {
      settings: DEFAULT_SETTINGS,
      header: DEFAULT_HEADER,
      footer: DEFAULT_FOOTER,
    }
  }
}
