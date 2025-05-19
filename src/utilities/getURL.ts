import canUseDOM from './canUseDOM'

export const getServerSideURL = () => {
  let url = process.env.NEXT_PUBLIC_SERVER_URL

  if (!url && process.env.VERCEL_PROJECT_PRODUCTION_URL) {
    return `https://${process.env.VERCEL_PROJECT_PRODUCTION_URL}`
  }

  if (!url) {
    url = 'http://localhost:3000'
  }

  return url
}

export const getClientSideURL = () => {
  try {
    // Use a consistent URL for API requests to avoid hydration mismatches
    // For local development, this should point to the API server
    if (process.env.NEXT_PUBLIC_PAYLOAD_URL) {
      return process.env.NEXT_PUBLIC_PAYLOAD_URL
    }

    if (canUseDOM) {
      // In browser context
      const protocol = window.location.protocol
      const domain = window.location.hostname
      const port = window.location.port

      // Check if we need to redirect to the API server
      if (domain === 'localhost' || domain === '127.0.0.1') {
        // For local development, use the payload URL from env or fallback
        if (process.env.NEXT_PUBLIC_PAYLOAD_URL) {
          return process.env.NEXT_PUBLIC_PAYLOAD_URL
        }

        // If running on port 3000, assume CMS is on 3001
        if (port === '3000') {
          return 'http://localhost:3001'
        }
      }

      // Default to same origin for production
      return `${protocol}//${domain}${port ? `:${port}` : ''}`
    }

    // Server-side or fallback
    if (process.env.VERCEL_PROJECT_PRODUCTION_URL) {
      return `https://${process.env.VERCEL_PROJECT_PRODUCTION_URL}`
    }

    return process.env.NEXT_PUBLIC_PAYLOAD_URL || process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3001'
  } catch (error) {
    console.error('Error determining client-side URL:', error)
    // Fallback to a safe default
    return process.env.NEXT_PUBLIC_PAYLOAD_URL || 'http://localhost:3001'
  }
}
