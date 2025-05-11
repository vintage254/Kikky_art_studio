# M-Pesa Integration Guide

This guide explains how to set up and use the M-Pesa Daraja API integration with your Payload CMS + MongoDB e-commerce site.

## Overview

The integration allows customers to make payments using M-Pesa mobile money, a popular payment method in Kenya. This is implemented using Safaricom's Daraja API to initiate STK Push payments directly to the customer's phone.

## Prerequisites

1. A Safaricom Developer Account (https://developer.safaricom.co.ke/)
2. M-Pesa Daraja API credentials (Consumer Key, Consumer Secret)
3. M-Pesa Shortcode and Passkey

## Configuration

### Environment Variables

Add the following environment variables to your `.env` file:

```
# M-Pesa Daraja API Configuration
MPESA_CONSUMER_KEY=your_mpesa_consumer_key
MPESA_CONSUMER_SECRET=your_mpesa_consumer_secret
MPESA_SHORTCODE=your_mpesa_shortcode
MPESA_PASSKEY=your_mpesa_passkey
```

### Callback URL Registration

1. Log in to your Safaricom Developer Account
2. Register the following callback URL in your app settings:
   - Callback URL: `https://your-domain.com/api/webhooks/mpesa`

## How It Works

1. **Payment Flow**:
   - Customer selects M-Pesa as payment method during checkout
   - Customer enters their phone number
   - System creates a pending order in the database
   - System initiates an STK Push request to the customer's phone
   - Customer completes payment on their phone
   - M-Pesa sends a callback to our webhook
   - System updates the order status based on the callback result

2. **Data Structure**:
   - Orders have additional fields for M-Pesa transaction details
   - A separate Payments collection tracks all payment transactions

3. **API Endpoints**:
   - `/api/checkout/mpesa`: Initiates M-Pesa STK Push
   - `/api/webhooks/mpesa`: Receives callbacks from M-Pesa

## Developer Information

### Key Files

- `src/payload/mpesa/index.ts`: Core M-Pesa API integration functions
- `src/payload/mpesa/webhooks/handleCallback.ts`: Webhook handler for M-Pesa callbacks
- `src/payload/endpoints/initiate-mpesa.ts`: API endpoint to initiate M-Pesa payment
- `src/app/(pages)/checkout/MpesaCheckoutForm/index.tsx`: Frontend form for M-Pesa checkout

### Testing

For testing purposes, use a real Kenyan phone number with M-Pesa. In sandbox mode, you can use the Daraja test credentials provided by Safaricom.

## Troubleshooting

1. **Payment Fails to Initiate**:
   - Check M-Pesa API credentials in environment variables
   - Ensure the phone number is in the correct format (2547XXXXXXXX)

2. **Callback Not Received**:
   - Verify webhook URL is correctly registered in Safaricom Developer portal
   - Check server logs for any webhook processing errors

3. **Order Not Updated After Payment**:
   - Check the format of the MerchantRequestID between the request and callback
   - Ensure the database is accessible when processing callbacks

## Admin Interface

A dedicated "Payments" section in the Payload admin dashboard allows you to:
- View all M-Pesa transactions
- Check payment status and details
- Filter by transaction type, status, date, etc.

## Production Considerations

1. **Safaricom API Environment**:
   - Update API URLs from sandbox to production when going live
   - Register production callback URLs with Safaricom

2. **Security**:
   - Implement IP whitelisting for Safaricom callback servers
   - Keep your API credentials secure
   - Use HTTPS for all communications 