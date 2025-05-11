import { NextResponse } from 'next/server'
import { GRAPHQL_API_URL } from '../../_api/shared'

// This is a debugging endpoint to help troubleshoot connection issues
export async function GET(req: Request): Promise<NextResponse> {
  try {
    // Collect environment variables for debugging
    const envInfo = {
      NODE_ENV: process.env.NODE_ENV,
      NEXT_PUBLIC_SERVER_URL: process.env.NEXT_PUBLIC_SERVER_URL,
      PAYLOAD_PUBLIC_SERVER_URL: process.env.PAYLOAD_PUBLIC_SERVER_URL,
      VERCEL_URL: process.env.VERCEL_URL,
      VERCEL_DEPLOYMENT: process.env.VERCEL_DEPLOYMENT,
      SKIP_API_DURING_BUILD: process.env.SKIP_API_DURING_BUILD,
      NEXT_PUBLIC_SKIP_DB_CONNECTION: process.env.NEXT_PUBLIC_SKIP_DB_CONNECTION,
      PAYLOAD_PUBLIC_SKIP_DB_CONNECTION: process.env.PAYLOAD_PUBLIC_SKIP_DB_CONNECTION,
      GRAPHQL_API_URL,
      // Add request info
      host: req.headers.get('host'),
      referer: req.headers.get('referer'),
      url: req.url,
    }

    // Test connection to the GraphQL API
    let graphqlConnectionTest = 'Not tested'
    try {
      if (GRAPHQL_API_URL) {
        console.log(`Attempting connection to GraphQL at ${GRAPHQL_API_URL}/api/graphql`)
        
        const response = await fetch(`${GRAPHQL_API_URL}/api/graphql`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            query: '{ __schema { queryType { name } } }',
          }),
        })

        const responseText = await response.text()
        
        if (response.ok) {
          graphqlConnectionTest = `Connection successful, status: ${response.status}, response: ${responseText.substring(0, 100)}...`
        } else {
          graphqlConnectionTest = `Connection failed, status: ${response.status}, response: ${responseText.substring(0, 100)}...`
        }
      } else {
        graphqlConnectionTest = 'GRAPHQL_API_URL is not defined'
      }
    } catch (error) {
      graphqlConnectionTest = `Connection error: ${error.message}`
    }

    // Test connection to the self
    let selfConnectionTest = 'Not tested'
    try {
      const selfUrl = new URL('/api/health', req.url).toString()
      console.log(`Testing self connection at ${selfUrl}`)
      
      const response = await fetch(selfUrl)
      if (response.ok) {
        selfConnectionTest = `Connection to self successful, status: ${response.status}`
      } else {
        selfConnectionTest = `Connection to self failed, status: ${response.status}`
      }
    } catch (error) {
      selfConnectionTest = `Self connection error: ${error.message}`
    }

    return NextResponse.json({
      status: 'ok',
      message: 'Debug information',
      environment: envInfo,
      graphqlConnectionTest,
      selfConnectionTest,
      timestamp: new Date().toISOString(),
    })
  } catch (error) {
    return NextResponse.json({
      status: 'error',
      message: 'Error generating debug information',
      error: error.message,
    }, { status: 500 })
  }
} 