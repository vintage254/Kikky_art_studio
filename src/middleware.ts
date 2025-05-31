import { NextRequest, NextResponse } from 'next/server';
import { TOKEN_COOKIE_NAME } from './utilities/auth/constants';

// Define protected routes that require authentication
const PROTECTED_ROUTES = [
  '/account',
  '/account/cart',
  '/account/orders',
  '/account/settings',
  '/checkout',
];

export async function middleware(request: NextRequest) {
  const { pathname } = request.nextUrl;
  
  // Check if the current route is protected
  const isProtectedRoute = PROTECTED_ROUTES.some(route => 
    pathname === route || pathname.startsWith(`${route}/`)
  );
  
  if (isProtectedRoute) {
    // Only check for token existence in Edge Runtime
    // The actual token validation will happen in the page component
    const tokenCookie = request.cookies.get(TOKEN_COOKIE_NAME);
    
    // If no token cookie exists, redirect immediately
    if (!tokenCookie?.value) {
      // Redirect to login page with return URL
      const url = new URL('/login', request.url);
      url.searchParams.set('redirect', encodeURIComponent(pathname));
      return NextResponse.redirect(url);
    }
    
    try {
      // If we found a token cookie, allow the request to proceed 
      // Don't verify the token in middleware (avoid latency)
      // The actual pages will handle validation properly
      return NextResponse.next();

      // Previous approach caused issues with slow validation:
      // const isAuthenticated = await isLoggedIn(request);
      // if (!isAuthenticated) { redirect... }
    } catch (error) {
      console.error('Authentication middleware error:', error);
      // On error, continue anyway - let the page handle auth
      return NextResponse.next();
    }
  }
  
  return NextResponse.next();
}

// Only run middleware on specific paths
export const config = {
  matcher: [
    '/account/:path*',
    '/checkout/:path*',
  ],
};
