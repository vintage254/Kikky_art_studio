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
      GRAPHQL_API_URL,
      // Add request info
      host: req.headers.get('host'),
      referer: req.headers.get('referer'),
    }

    // Test connection to the GraphQL API
    let graphqlConnectionTest = 'Not tested'
    try {
      if (GRAPHQL_API_URL) {
        const response = await fetch(`${GRAPHQL_API_URL}/api/graphql`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            query: '{ __schema { queryType { name } } }',
          }),
        })

        if (response.ok) {
          graphqlConnectionTest = `Connection successful, status: ${response.status}`
        } else {
          graphqlConnectionTest = `Connection failed, status: ${response.status}`
        }
      } else {
        graphqlConnectionTest = 'GRAPHQL_API_URL is not defined'
      }
    } catch (error) {
      graphqlConnectionTest = `Connection error: ${error.message}`
    }

    return NextResponse.json({
      status: 'ok',
      message: 'Debug information',
      environment: envInfo,
      graphqlConnectionTest,
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