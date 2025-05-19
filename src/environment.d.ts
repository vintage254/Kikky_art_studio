// Based on: https://nextjs.org/docs/basic-features/environment-variables#loading-environment-variables
// This file is not typically required in Next.js, which has its own types.
// Payload would typically run environment variables through the env section of the
// Payload config, but we need this file so TypeScript doesn't complain when we reference
// process.env throughout the application.

declare global {
  namespace NodeJS {
    interface ProcessEnv {
      PAYLOAD_SECRET: string
      DATABASE_URI: string
      NEXT_PUBLIC_SERVER_URL: string
      VERCEL_PROJECT_PRODUCTION_URL: string
      
      // Payload cron
      CRON_SECRET?: string
      
      // Stripe integration
      STRIPE_SECRET_KEY: string
      STRIPE_WEBHOOK_SECRET: string
      STRIPE_PUBLIC_KEY: string
      
      // M-Pesa integration
      MPESA_CONSUMER_KEY?: string
      MPESA_CONSUMER_SECRET?: string
      MPESA_PASSKEY?: string
      MPESA_SHORTCODE?: string
    }
  }
}

// If this file has no import/export statements (i.e. is a script)
// convert it into a module by adding an empty export statement.
export {}
