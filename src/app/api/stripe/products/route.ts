import { NextResponse } from 'next/server'

export async function GET() {
  try {
    // Initialize Stripe with your API key
    const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY)

    // Fetch products from Stripe
    const products = await stripe.products.list({
      active: true,
      limit: 100, // Adjust as needed
      expand: ['data.default_price'], // Include default price data
    })

    // Return the products
    return NextResponse.json({ 
      products: products.data,
      success: true 
    })
  } catch (error) {
    console.error('Error fetching Stripe products:', error)
    return NextResponse.json(
      { 
        error: 'Failed to fetch Stripe products',
        success: false 
      },
      { status: 500 }
    )
  }
} 