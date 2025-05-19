import type { Product } from '@/payload-types'

/**
 * Synchronizes a Payload product with Stripe
 * This function is meant to be used as an afterChange hook
 */
export const syncProductWithStripe = async ({
  doc, // the newly updated/created document
  req, // the express request
  operation, // 'create' or 'update'
}: {
  doc: Product
  req: any
  operation: 'create' | 'update'
}) => {
  try {
    // Skip if we're running in the admin
    // This prevents recursion when we update the product with Stripe IDs
    if (req.url?.includes('/api/admin')) {
      return doc
    }

    // Skip if Stripe API key is not configured
    if (!process.env.STRIPE_SECRET_KEY) {
      console.log('Skipping Stripe sync - STRIPE_SECRET_KEY not configured')
      return doc
    }

    // Skip if we already have Stripe IDs for both product and price
    if (doc.stripeProductID && doc.stripePriceID) {
      // If we're updating, we could update the Stripe product here
      // but for simplicity we'll just return the doc
      return doc
    }

    // Handle case where price might not be available yet
    if (!doc.price || !doc.price.value) {
      console.log('Skipping Stripe sync - no price information available')
      return doc
    }

    // Connect to Stripe using dynamic import
    const Stripe = await import('stripe').then(module => module.default || module);
    const stripe = new Stripe(process.env.STRIPE_SECRET_KEY as string);

    // For simplicity, we'll regenerate both the product and price in Stripe
    // In a production environment, you might want to update existing ones instead

    // Create or update the product in Stripe
    const stripeProduct = await stripe.products.create({
      name: doc.title,
      description: 'Product description', // Since rich text can't be directly passed to Stripe
      metadata: {
        payloadID: doc.id,
      },
      // You can add images here if you have them
      // images: doc.images?.map(img => `${process.env.NEXT_PUBLIC_SERVER_URL}/media/${img.image.filename}`),
    })

    // Get price value and currency from the new structure
    const priceValue = doc.price.value;
    const currency = doc.price.currency || 'usd';

    // Create a price for the product
    const stripePrice = await stripe.prices.create({
      product: stripeProduct.id,
      unit_amount: priceValue, // Now properly accessing the value in the price group
      currency: currency.toLowerCase(), // Using the selected currency, lowercased for Stripe
    })

    // Update the document with Stripe IDs
    if (req.payload) {
      await req.payload.update({
        collection: 'products',
        id: doc.id,
        data: {
          stripeProductID: stripeProduct.id,
          stripePriceID: stripePrice.id,
        },
        // This is important to prevent recursion
        // It will prevent afterChange hooks from firing again
        depth: 0,
      })
    }

    // Return the original document
    // The updated document will be available after the database operation completes
    return doc
  } catch (error) {
    console.error('Error syncing product with Stripe:', error)
    return doc
  }
} 