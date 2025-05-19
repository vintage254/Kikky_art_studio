import { Endpoint } from 'payload/config'

import { stripeWebhookHandler } from './webhooks/stripe'
import { mpesaWebhookHandler } from './webhooks/mpesa'

/**
 * Collection of webhook endpoints for payment processing
 */
export const paymentWebhooks: Endpoint[] = [
  {
    path: '/webhooks/stripe',
    method: 'post',
    // Stripe webhook needs raw body for signature verification
    // Using the express raw parser
    handler: stripeWebhookHandler,
    raw: true,
  },
  {
    path: '/webhooks/mpesa/confirmation',
    method: 'post',
    handler: mpesaWebhookHandler,
  },
  {
    path: '/webhooks/mpesa/validation',
    method: 'post',
    handler: mpesaWebhookHandler,
  },
] 