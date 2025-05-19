import { getPayload } from 'payload'
import { NextRequest, NextResponse } from 'next/server'

import config from '../../../../../payload.config'

export async function POST(req: NextRequest) {
  try {
    // Get request data
    const json = await req.json()
    const { 
      items, 
      total,
      shippingAddress,
      notes,
      userId
    } = json
    
    // Validate input
    if (!items || !total || !shippingAddress || !userId) {
      return NextResponse.json(
        { 
          error: 'Missing required fields',
          success: false 
        },
        { status: 400 }
      )
    }
    
    // Initialize Payload
    const payload = await getPayload({ config })
    
    // Create the order with POD payment method
    const order = await payload.create({
      collection: 'orders',
      data: {
        user: userId,
        items,
        total,
        status: 'pending',
        paymentStatus: 'pending',
        deliveryStatus: 'processing',
        paymentMethod: 'pod',
        shippingAddress,
        notes: notes || 'Pay on Delivery order',
      },
    })
    
    // Send email notification to admin and customer (you would implement this)
    // await sendOrderNotifications(order)
    
    // Return the order data
    return NextResponse.json({ 
      order: order,
      success: true 
    })
  } catch (error) {
    console.error('Error creating POD order:', error)
    return NextResponse.json(
      { 
        error: 'Failed to create order',
        success: false 
      },
      { status: 500 }
    )
  }
} 