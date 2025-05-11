import { NextResponse } from 'next/server'
import payload from 'payload'

import { Product } from '../../../../payload/payload-types'

// This endpoint creates a new order for Cash on Delivery payment
export async function POST(req: Request): Promise<NextResponse> {
  try {
    // Get the JSON data from the request
    const body = await req.json()
    const { items, deliveryNotes } = body

    // Get the user from the request
    const { user } = req as any // Type assertion for Payload request

    // Validate that we have a user
    if (!user) {
      return NextResponse.json({ error: 'You must be logged in to place an order' }, { status: 401 })
    }

    // Validate that we have items
    if (!items || !Array.isArray(items) || items.length === 0) {
      return NextResponse.json({ error: 'No items in cart' }, { status: 400 })
    }

    // Calculate total from items
    let total = 0

    // Process items and calculate total
    const orderItems = await Promise.all(
      items.map(async item => {
        const { product: productId, quantity } = item
        
        if (!quantity) {
          return null
        }
        
        // Fetch product from database
        const productResult = await payload.findByID({
          collection: 'products',
          id: productId,
        })
        
        if (!productResult) {
          throw new Error(`Product not found: ${productId}`)
        }
        
        // Get price - access directly from product
        // For Stripe-based products, we need to parse priceJSON
        let price = 0
        
        const product = productResult as unknown as Product
        if (product.priceJSON && typeof product.priceJSON === 'string') {
          try {
            const priceData = JSON.parse(product.priceJSON)
            price = priceData.unit_amount / 100 // Convert from cents
          } catch (error) {
            console.error(`Error parsing price JSON for product ${productId}:`, error)
          }
        }
        
        // Add to total
        total += price * Number(quantity)
        
        return {
          product: productId,
          price: price,
          quantity: Number(quantity),
        }
      })
    )
    
    // Filter out null items
    const validOrderItems = orderItems.filter(Boolean)
    
    if (validOrderItems.length === 0) {
      return NextResponse.json({ error: 'No valid items in cart' }, { status: 400 })
    }
    
    // Create order data
    const orderData = {
      orderedBy: user.id,
      total: Math.round(total * 100) / 100, // Format to 2 decimal places
      items: validOrderItems,
      paymentMethod: 'cash_on_delivery',
      paymentStatus: 'pending',
      deliveryNotes: deliveryNotes || '', // Store delivery notes if provided
    }
    
    // Create the order
    const order = await payload.create({
      collection: 'orders',
      data: orderData,
    })
    
    return NextResponse.json({
      success: true,
      message: 'Cash on Delivery order created successfully',
      orderId: order.id,
    })
  } catch (error) {
    console.error('Cash on Delivery order creation error:', error)
    return NextResponse.json(
      { error: error.message || 'An error occurred while creating your order' },
      { status: 500 }
    )
  }
} 