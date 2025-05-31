/**
 * Edge Runtime Compatible Auth Checker
 * 
 * This file provides auth checking functionality that works in Edge Runtime
 * without requiring Payload CMS or dynamic code evaluation.
 */

import { NextRequest } from 'next/server';
import { TOKEN_COOKIE_NAME } from './utilities/auth/constants';

/**
 * Simple token existence check that's safe for Edge Runtime
 */
export function hasAuthCookie(request: NextRequest): boolean {
  const tokenCookie = request.cookies.get(TOKEN_COOKIE_NAME);
  return Boolean(tokenCookie?.value);
}

/**
 * List of routes that require authentication
 */
export const PROTECTED_ROUTES = [
  '/account',
  '/account/cart',
  '/account/orders',
  '/account/settings',
  '/checkout',
];
