import { getPayload } from 'payload'
import { NextRequest, NextResponse } from 'next/server'

import config from '../../../../payload.config'

export async function PATCH(
  req: NextRequest,
  { params }: { params: { id: string } }
) {
  try {
    // Get the order ID from the params
    const { id } = params
    
    // Get request data
    const json = await req.json()
    const { paymentStatus, deliveryStatus } = json
    
    // Initialize Payload
    const payload = await getPayload({ config })
    
    // Verify the user has admin permissions
    // This assumes we have an authenticated user with a token
    const token = req.headers.get('authorization')?.split(' ')[1]
    
    if (!token) {
      return NextResponse.json(
        { error: 'Unauthorized', success: false },
        { status: 401 }
      )
    }
    
    // Get the current user from the token
    const { user } = await payload.verify(token)
    
    // Check if the user is an admin
    if (!user || user.role !== 'admin') {
      return NextResponse.json(
        { error: 'Unauthorized', success: false },
        { status: 403 }
      )
    }
    
    // Update the order
    const updatedOrder = await payload.update({
      collection: 'orders',
      id,
      data: {
        paymentStatus,
        deliveryStatus,
        // Update the overall status based on both payment and delivery status
        ...(paymentStatus === 'paid' && deliveryStatus === 'delivered' && { status: 'completed' }),
        ...(paymentStatus === 'paid' && deliveryStatus === 'shipped' && { status: 'shipped' }),
        ...(deliveryStatus === 'cancelled' && { status: 'canceled' }),
      },
    })
    
    // Return the updated order
    return NextResponse.json({ 
      order: updatedOrder,
      success: true 
    })
  } catch (error) {
    console.error('Error updating order:', error)
    return NextResponse.json(
      { 
        error: 'Failed to update order',
        success: false 
      },
      { status: 500 }
    )
  }
} 