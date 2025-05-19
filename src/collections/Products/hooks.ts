import { syncProductWithStripe } from '@/utilities/syncProductWithStripe'
import type { Product } from '@/payload-types'

/**
 * Hook that syncs products with Stripe if configured
 * This is only active when STRIPE_SECRET_KEY is set in the environment
 */
export const afterChangeHook = async ({
  doc,
  req,
  operation,
}: {
  doc: Product
  req: any
  operation: 'create' | 'update'
}) => {
  try {
    // Skip processing in browser/client context
    if (typeof window !== 'undefined') {
      return doc
    }
    
    // If Stripe is not configured, simply return the document
    if (!process.env.STRIPE_SECRET_KEY) {
      return doc
    }
    
    // Only proceed with Stripe sync if configured
    return await syncProductWithStripe({ 
      doc, 
      req, 
      operation 
    })
  } catch (error) {
    console.error('Error in product afterChangeHook:', error)
    // Return the document even if there's an error
    return doc
  }
} 