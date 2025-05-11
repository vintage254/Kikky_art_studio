import { NextResponse } from 'next/server'
import payload from 'payload'

// This API route handles callbacks from M-Pesa
export async function POST(req: Request): Promise<NextResponse> {
  try {
    // Parse the request body
    const callbackData = await req.json()
    
    // Log the callback for debugging
    console.log('Received M-Pesa callback:', JSON.stringify(callbackData, null, 2))
    
    // Extract the Body section which contains the actual transaction details
    const { Body } = callbackData
    
    if (!Body?.stkCallback) {
      return NextResponse.json({ error: 'Invalid callback format' }, { status: 400 })
    }
    
    const { ResultCode, ResultDesc, CallbackMetadata, MerchantRequestID } = Body.stkCallback
    const isSuccessful = ResultCode === 0
    
    // If transaction was successful, extract transaction details
    if (isSuccessful && CallbackMetadata && CallbackMetadata.Item) {
      // Extract transaction details from the callback metadata
      const metadata = CallbackMetadata.Item.reduce((acc, item) => {
        if (item.Name && item.Value !== undefined) {
          acc[item.Name] = item.Value
        }
        return acc
      }, {})
      
      const { MpesaReceiptNumber, TransactionDate, PhoneNumber } = metadata
      const merchantRequestID = MerchantRequestID
      
      // Look up the order using the merchantRequestID stored in mpesaRequestID
      // Since the field name has a TypeScript error, we'll use the raw query approach
      const orders = await payload.find({
        collection: 'orders',
        where: {
          and: [
            {
              id: {
                not_equals: null,
              },
            },
          ],
        },
      })
      
      // Filter orders manually 
      const matchingOrders = orders.docs.filter(order => {
        const orderData = order as any
        return (
          orderData._mpesaRequestID === merchantRequestID || 
          orderData.mpesaRequestID === merchantRequestID
        )
      })
      
      if (matchingOrders.length === 0) {
        return NextResponse.json(
          { error: `No order found with mpesaRequestID: ${merchantRequestID}` },
          { status: 404 },
        )
      }
      
      const order = matchingOrders[0]
      
      try {
        // Use raw data approach
        const updateData = {}
        ;(updateData as any)._mpesaReceiptNumber = MpesaReceiptNumber
        ;(updateData as any)._mpesaTransactionDate = TransactionDate
        ;(updateData as any)._mpesaPhoneNumber = PhoneNumber
        ;(updateData as any)._paymentStatus = 'paid'

        // Update the order with the payment details
        await payload.update({
          collection: 'orders',
          id: order.id,
          data: updateData,
        })
        
        // Log success
        console.log(`Successfully processed M-Pesa payment for order ${order.id}`)
      } catch (updateError) {
        console.error('Error updating order:', updateError)
      }
      
      // Store the transaction if payments collection exists
      try {
        // Check if payments collection exists
        const collections = Object.keys(payload.collections)
        if (collections.includes('payments')) {
          // We'll use this try/catch to handle any type issues
          const paymentData = {
            type: 'mpesa',
            amount: (order as any).total,
            status: 'completed',
            receiptNumber: MpesaReceiptNumber,
            transactionDate: TransactionDate,
            phoneNumber: PhoneNumber,
            order: order.id,
          }
          
          await payload.create({
            collection: 'payments',
            data: paymentData,
          })
        }
      } catch (paymentError) {
        console.error('Failed to create payment record:', paymentError)
      }
    } else {
      // If transaction failed, log the error
      console.error(`M-Pesa transaction failed: ${ResultDesc}`)
      
      const merchantRequestID = MerchantRequestID
      
      // Look up the order using the merchantRequestID 
      // Since the field name has a TypeScript error, we'll use the raw query approach
      const orders = await payload.find({
        collection: 'orders',
        where: {
          and: [
            {
              id: {
                not_equals: null,
              },
            },
          ],
        },
      })
      
      // Filter orders manually 
      const matchingOrders = orders.docs.filter(order => {
        const orderData = order as any
        return (
          orderData._mpesaRequestID === merchantRequestID || 
          orderData.mpesaRequestID === merchantRequestID
        )
      })
      
      if (matchingOrders.length > 0) {
        const order = matchingOrders[0]
        
        try {
          // Use raw data approach
          const updateData = {}
          ;(updateData as any)._paymentStatus = 'failed'
          ;(updateData as any)._mpesaResultDesc = ResultDesc

          // Update the order with the payment details
          await payload.update({
            collection: 'orders',
            id: order.id,
            data: updateData,
          })
          
          console.log(`Updated order ${order.id} with failed payment status`)
        } catch (updateError) {
          console.error('Error updating order:', updateError)
        }
      }
    }
    
    // Send acknowledgment response to M-Pesa
    return NextResponse.json({ ResultCode: 0, ResultDesc: 'Accepted' })
  } catch (error) {
    console.error('Error processing M-Pesa callback:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
} 