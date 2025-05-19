import type { PayloadRequest } from 'payload'
import type { Payload } from 'payload'
import type { Response } from 'express'

// Define types for Stripe data
interface StripeSession {
  id: string
  customer_details: {
    email: string
  }
  amount_total: number
  payment_intent: string
  shipping?: {
    name: string
    address: {
      line1: string
      line2?: string
      city: string
      state: string
      postal_code: string
      country: string
    }
  }
}

interface StripePaymentIntent {
  id: string
}

interface StripeLineItem {
  quantity: number
  amount_total: number
  price: {
    id: string
  }
}

export const stripeWebhookHandler = async (req: PayloadRequest, res: Response): Promise<void> => {
  const payload: Payload = req.payload

  try {
    const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY)
    const endpointSecret = process.env.STRIPE_WEBHOOK_SECRET

    // Verify the webhook signature
    const sig = req.headers.get('stripe-signature')
    
    let event
    
    try {
      // Verify and parse the event
      event = stripe.webhooks.constructEvent(req.body, sig, endpointSecret)
    } catch (err: unknown) {
      const errorMessage = err instanceof Error ? err.message : 'Unknown error'
      console.error(`Webhook signature verification failed: ${errorMessage}`)
      res.status(400).send(`Webhook Error: ${errorMessage}`)
      return
    }

    // Handle the event based on its type
    switch (event.type) {
      case 'checkout.session.completed':
        await handleCheckoutCompleted(event.data.object as StripeSession, payload)
        break

      case 'payment_intent.succeeded':
        await handlePaymentSucceeded(event.data.object as StripePaymentIntent, payload)
        break
        
      // Add handlers for other event types
      
      default:
        // Unexpected event type
        console.log(`Unhandled event type: ${event.type}`)
    }

    // Return success
    res.status(200).json({ received: true })
  } catch (error: unknown) {
    const errorMessage = error instanceof Error ? error.message : 'Unknown error'
    console.error(`Error handling Stripe webhook: ${errorMessage}`)
    res.status(500).send(`Error processing webhook: ${errorMessage}`)
  }
}

// Process a completed checkout session
async function handleCheckoutCompleted(session: StripeSession, payload: Payload) {
  try {
    // Find or create the customer
    const userEmail = session.customer_details.email
    const user = await payload.find({
      collection: 'users',
      where: {
        email: {
          equals: userEmail,
        },
      },
    })

    const userId = user.docs && user.docs.length > 0 ? user.docs[0]?.id : null
    
    if (!userId) {
      console.error(`User with email ${userEmail} not found`)
      return
    }

    // Create the order
    const lineItems = await retrieveLineItems(session.id)
    
    // Map line items to order items
    const items = await Promise.all(
      lineItems.map(async (item: StripeLineItem) => {
        const product = await payload.find({
          collection: 'products',
          where: {
            stripePriceID: {
              equals: item.price.id,
            },
          },
        })

        if (!product.docs || product.docs.length === 0 || !product.docs[0]) {
          throw new Error(`Product with Stripe price ID ${item.price.id} not found`)
        }

        return {
          product: product.docs[0].id,
          quantity: item.quantity,
          price: item.amount_total,
        }
      })
    )

    // Create the order
    await payload.create({
      collection: 'orders',
      data: {
        user: userId,
        items,
        total: session.amount_total,
        status: 'paid',
        paymentStatus: 'paid',
        deliveryStatus: 'processing',
        paymentMethod: 'stripe',
        transactionID: session.payment_intent,
        // Add shipping information if available
        ...(session.shipping && {
          shippingAddress: {
            name: session.shipping.name,
            line1: session.shipping.address.line1,
            line2: session.shipping.address.line2,
            city: session.shipping.address.city,
            state: session.shipping.address.state,
            postalCode: session.shipping.address.postal_code,
            country: session.shipping.address.country,
          },
        }),
      },
    })
  } catch (error: unknown) {
    const errorMessage = error instanceof Error ? error.message : 'Unknown error'
    console.error(`Error handling checkout completed: ${errorMessage}`)
    throw error
  }
}

// Process a successful payment
async function handlePaymentSucceeded(paymentIntent: StripePaymentIntent, payload: Payload) {
  try {
    // Check if there's already an order with this transaction ID
    const existingOrders = await payload.find({
      collection: 'orders',
      where: {
        transactionID: {
          equals: paymentIntent.id,
        },
      },
    })

    // If there's no order yet (created by checkout.session.completed),
    // we might need to create one
    if (!existingOrders.docs || existingOrders.docs.length === 0) {
      // This section would depend on your integration details
      console.log('No order found for payment intent, might need to create one')
      // Implementation would depend on your checkout flow
    } else if (existingOrders.docs[0]) {
      // Update the existing order status
      await payload.update({
        collection: 'orders',
        id: existingOrders.docs[0].id,
        data: {
          status: 'paid',
          paymentStatus: 'paid',
        },
      })
    }
  } catch (error: unknown) {
    const errorMessage = error instanceof Error ? error.message : 'Unknown error'
    console.error(`Error handling payment succeeded: ${errorMessage}`)
    throw error
  }
}

// Helper function to retrieve line items from a session
async function retrieveLineItems(sessionId: string): Promise<StripeLineItem[]> {
  const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY)
  const lineItems = await stripe.checkout.sessions.listLineItems(sessionId)
  return lineItems.data
} 