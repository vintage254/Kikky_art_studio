import type { PayloadRequest } from 'payload'
import type { Payload } from 'payload'
import type { Response } from 'express'

// Instead of importing Response from express, use ExpressResponse type alias
type ExpressResponse = {
  status: (code: number) => {
    send: (message: string) => void
    json: (body: any) => void
  }
}

export const mpesaWebhookHandler = async (req: PayloadRequest, res: Response): Promise<void> => {
  const payload: Payload = req.payload

  try {
    // M-Pesa validation and confirmation endpoints might have different structures
    // This is a simplified example - you'd need to modify based on the actual M-Pesa API
    
    // Get the payload from the request - properly type it
    const mpesaPayload = req.body as Record<string, any>
    
    // Check if this is a validation request or confirmation
    // Use url instead of originalUrl for PayloadRequest
    if (req.url?.includes('/validation')) {
      // Handle validation request
      // You might want to check if the phone number or account exists before accepting payment
      res.status(200).json({
        ResultCode: 0,
        ResultDesc: 'Accepted',
      });
      return;
    }
    
    // This is a confirmation request - payment has been completed
    // Extract important details from the payload with proper type checking
    const { 
      TransactionType, // Type of transaction (e.g., PayBill)
      TransID, // M-Pesa transaction ID
      TransAmount, // Amount paid
      BillRefNumber, // Reference number (e.g., order ID)
      MSISDN, // Phone number of customer
      FirstName,
      MiddleName,
      LastName,
    } = mpesaPayload
    
    // Try to find the user based on the BillRefNumber
    // The implementation depends on how users are stored and how the payment flow works
    let userId: number | null = null
    
    // If BillRefNumber contains a user ID or reference
    if (BillRefNumber) {
      try {
        // This assumes BillRefNumber is formatted as "user_ID-ORDER_REFERENCE"
        const parts = BillRefNumber.split('-')
        if (parts.length > 0) {
          // Convert string ID to number
          userId = parseInt(parts[0].replace('user_', ''), 10)
        }
      } catch (e) {
        console.error('Failed to parse reference number:', e)
      }
    }
    
    // If still no user, we can't proceed
    if (!userId) {
      console.error('Could not identify user for M-Pesa payment')
      // You might want to create a pending payment record for reconciliation
      res.status(200).json({
        ResultCode: 0,
        ResultDesc: 'Accepted but user not found',
      });
      return;
    }
    
    // Create a new order
    await payload.create({
      collection: 'orders',
      data: {
        user: userId,
        // Note: for M-Pesa, you might not know the items right away
        // Depending on your flow, this could be pre-created with pending status
        items: [], // This would need to be determined based on your flow
        total: parseFloat(TransAmount),
        status: 'paid',
        paymentStatus: 'paid',
        deliveryStatus: 'processing',
        paymentMethod: 'mpesa',
        transactionID: TransID,
        notes: `Payment by ${FirstName} ${MiddleName} ${LastName} from ${MSISDN}`,
      },
    })
    
    // Return a response to acknowledge receipt
    res.status(200).json({
      ResultCode: 0,
      ResultDesc: 'Confirmation received successfully',
    });
  } catch (error: unknown) {
    // Properly handle unknown error type
    const errorMessage = error instanceof Error ? error.message : 'Unknown error';
    console.error(`Error handling M-Pesa webhook: ${errorMessage}`)
    res.status(500).json({
      ResultCode: 1,
      ResultDesc: 'Error processing confirmation',
    });
  }
}

// Helper function to format phone numbers consistently
function formatPhoneNumber(phone: string): string {
  // Remove any non-digit characters
  let cleaned = phone.replace(/\D/g, '')
  
  // Remove country code if present (e.g., 254 for Kenya)
  if (cleaned.startsWith('254')) {
    cleaned = '0' + cleaned.substring(3)
  }
  
  return cleaned
} 