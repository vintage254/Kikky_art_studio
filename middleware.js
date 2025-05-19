import { NextResponse } from 'next/server'

/**
 * Next.js Middleware 
 * This helps to:
 * 1. Cache image requests for better performance
 * 2. Handle timeouts in a more graceful way
 */
export async function middleware(request) {
    const { pathname } = request.nextUrl

    // Only handle image optimization requests
    if (pathname.startsWith('/_next/image')) {
        const response = NextResponse.next()

        // Set cache headers for better performance
        response.headers.set('Cache-Control', 'public, max-age=31536000, immutable')

        return response
    }

    return NextResponse.next()
}

/**
 * Configure the paths that should be handled by this middleware
 */
export const config = {
    matcher: [
        '/_next/image*',
    ],
} 