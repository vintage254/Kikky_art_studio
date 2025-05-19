/**
 * Utility for working with Payload CMS APIs
 */

'use client'

import { getClientSideURL } from './getURL'

/**
 * A utility for making API requests to Payload CMS with retry logic
 */
export class PayloadClient {
  private baseUrl: string
  private maxRetries: number
  private retryDelay: number
  private timeout: number

  constructor({
    baseUrl = getClientSideURL(),
    maxRetries = 2,
    retryDelay = 1000,
    timeout = 30000,
  } = {}) {
    this.baseUrl = baseUrl
    this.maxRetries = maxRetries
    this.retryDelay = retryDelay
    this.timeout = timeout
  }

  /**
   * Make an API request to Payload with retry logic
   */
  async fetch<T>(endpoint: string, options: RequestInit = {}): Promise<T> {
    let retries = 0
    let lastError: Error | null = null

    // Ensure endpoint starts with /
    if (!endpoint.startsWith('/')) {
      endpoint = `/${endpoint}`
    }

    // If endpoint doesn't start with /api, add it
    if (!endpoint.startsWith('/api')) {
      endpoint = `/api${endpoint}`
    }

    const url = `${this.baseUrl}${endpoint}`

    // Create AbortController for timeout
    const controller = new AbortController()
    const timeoutId = setTimeout(() => controller.abort(), this.timeout)

    // Merge user options with our defaults
    const fetchOptions: RequestInit = {
      ...options,
      headers: {
        'Content-Type': 'application/json',
        ...options.headers,
      },
      signal: controller.signal,
    }

    while (retries <= this.maxRetries) {
      try {
        const response = await fetch(url, fetchOptions)

        // Clear timeout since request completed
        clearTimeout(timeoutId)

        if (!response.ok) {
          throw new Error(`Request failed with status ${response.status}: ${response.statusText}`)
        }

        return await response.json() as T
      } catch (error) {
        lastError = error instanceof Error ? error : new Error(String(error))

        // Don't retry if was aborted or if we've reached max retries
        if (error instanceof DOMException && error.name === 'AbortError') {
          throw new Error(`Request timed out after ${this.timeout}ms: ${url}`)
        }

        // If we've reached max retries, throw the last error
        if (retries >= this.maxRetries) {
          break
        }

        // Wait before retrying
        await new Promise(resolve => setTimeout(resolve, this.retryDelay * (retries + 1)))
        retries++

        console.warn(`Retrying request to ${url} (attempt ${retries} of ${this.maxRetries})`)
      }
    }

    throw lastError || new Error(`Request failed after ${this.maxRetries} retries`)
  }

  /**
   * Get a media resource by URL with retry logic
   */
  async getMedia(mediaPath: string): Promise<Blob> {
    let retries = 0
    let lastError: Error | null = null

    // Ensure mediaPath starts with /
    if (!mediaPath.startsWith('/')) {
      mediaPath = `/${mediaPath}`
    }

    // If mediaPath doesn't include media, add the proper path
    if (!mediaPath.includes('/media/')) {
      mediaPath = `/api/media/${mediaPath.replace(/^\/+/, '')}`
    }

    const url = `${this.baseUrl}${mediaPath}`

    // Create AbortController for timeout
    const controller = new AbortController()
    const timeoutId = setTimeout(() => controller.abort(), this.timeout)

    while (retries <= this.maxRetries) {
      try {
        const response = await fetch(url, {
          signal: controller.signal,
        })

        // Clear timeout since request completed
        clearTimeout(timeoutId)

        if (!response.ok) {
          throw new Error(`Media request failed with status ${response.status}: ${response.statusText}`)
        }

        return await response.blob()
      } catch (error) {
        lastError = error instanceof Error ? error : new Error(String(error))

        // Don't retry if was aborted or if we've reached max retries
        if (error instanceof DOMException && error.name === 'AbortError') {
          throw new Error(`Media request timed out after ${this.timeout}ms: ${url}`)
        }

        // If we've reached max retries, throw the last error
        if (retries >= this.maxRetries) {
          break
        }

        // Wait before retrying
        await new Promise(resolve => setTimeout(resolve, this.retryDelay * (retries + 1)))
        retries++

        console.warn(`Retrying media request to ${url} (attempt ${retries} of ${this.maxRetries})`)
      }
    }

    throw lastError || new Error(`Media request failed after ${this.maxRetries} retries`)
  }
}

// Export a singleton instance
export const payloadClient = new PayloadClient()

// Export default for convenience
export default payloadClient 