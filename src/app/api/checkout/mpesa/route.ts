import { cookies } from 'next/headers'
import { NextResponse } from 'next/server'
import payload from 'payload'
import { formatPhoneNumber, initiateSTKPush } from '../../../../payload/mpesa'
import type { Product } from '../../../../payload/payload-types'

// Define a cart item interface
interface CartItem {
  product: string
  quantity?: number
}

// Interface for order item
interface OrderItem {
  product: string
  price: number
  quantity: number
}

// Interface for request body
interface CheckoutRequestBody {
  phoneNumber: string
  items: CartItem[]
}

// This API route handles M-Pesa checkout
export async function POST(req: Request): Promise<NextResponse> {
  try {
    // Get the session token from cookies
    const cookieStore = cookies()
    const payloadToken = cookieStore.get('payload-token')?.value
    
    if (!payloadToken) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }
    
    // Get user from token
    try {
      // Validate token using raw JWT method
      const tokenResult = await fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/users/me`, {
        headers: {
          Authorization: `JWT ${payloadToken}`,
        },
      })
      
      const { user } = await tokenResult.json()
      
      if (!user) {
        return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
      }

      // Parse the request body
      const { phoneNumber, items }: CheckoutRequestBody = await req.json()
      
      if (!phoneNumber) {
        return NextResponse.json({ error: 'Phone number is required' }, { status: 400 })
      }
      
      if (!items || !Array.isArray(items) || items.length === 0) {
        return NextResponse.json({ error: 'Cart items are required' }, { status: 400 })
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
      
      // Create order data - using type assertion as in other places in the codebase
      const orderData = {
        orderedBy: user.id,
        total: Math.round(total * 100) / 100, // Format to 2 decimal places
        items: validOrderItems,
        paymentMethod: 'mpesa',
        paymentStatus: 'pending',
      }
      
      // Create a pending order
      const order = await payload.create({
        collection: 'orders',
        data: orderData,
      })
      
      // Format phone number for M-Pesa
      const formattedPhone = formatPhoneNumber(phoneNumber)
      
      // Initiate STK Push
      const stkPushResult = await initiateSTKPush({
        phoneNumber: formattedPhone,
        amount: Math.max(1, Math.round(total)), // Ensure amount is at least 1 and rounded
        accountReference: `Order #${order.id}`,
        transactionDesc: 'Payment for online purchase',
      })
      
      if (!stkPushResult.success) {
        // If STK Push failed, update the order status with type assertion
        const updateData = {
          _paymentStatus: 'failed',
          mpesaResultDesc: JSON.stringify(stkPushResult.error),
        }
        
        await payload.update({
          collection: 'orders',
          id: order.id,
          data: updateData as any,
        })
        
        return NextResponse.json({
          error: 'Failed to initiate M-Pesa payment',
          details: stkPushResult.error,
        }, { status: 400 })
      }
      
      // Update the order with M-Pesa request details with type assertion
      const updateData = {
        _mpesaRequestID: stkPushResult.data.MerchantRequestID,
        _mpesaCheckoutRequestID: stkPushResult.data.CheckoutRequestID,
      }
      
      await payload.update({
        collection: 'orders',
        id: order.id,
        data: updateData as any,
      })
      
      return NextResponse.json({
        success: true,
        message: 'M-Pesa payment initiated. Please check your phone to complete the payment.',
        orderId: order.id,
        requestId: stkPushResult.data.MerchantRequestID,
      })
    } catch (authError) {
      console.error('Authentication error:', authError)
      return NextResponse.json({ error: 'Invalid authentication token' }, { status: 401 })
    }
  } catch (error) {
    console.error('Error in M-Pesa checkout:', error)
    return NextResponse.json({
      error: error instanceof Error ? error.message : 'Unknown error',
    }, { status: 500 })
  }
} 