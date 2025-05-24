import { NextRequest, NextResponse } from 'next/server';
import Stripe from 'stripe';
import { getPayload } from 'payload';
import configPromise from '@payload-config';
import { getLoggedInUser } from '@/utilities/auth';

export async function POST(request: NextRequest) {
  try {
    // Check if Stripe is configured
    if (!process.env.STRIPE_SECRET_KEY) {
      return NextResponse.json(
        { error: 'Stripe is not configured' },
        { status: 500 }
      );
    }

    // Initialize Stripe
    const stripe = new Stripe(process.env.STRIPE_SECRET_KEY, {
      apiVersion: '2023-10-16',
    });

    // Get session ID from request
    const { sessionId } = await request.json();
    
    if (!sessionId) {
      return NextResponse.json(
        { error: 'Session ID is required' },
        { status: 400 }
      );
    }

    // Retrieve session from Stripe
    const session = await stripe.checkout.sessions.retrieve(sessionId, {
      expand: ['line_items', 'line_items.data.price.product'],
    });

    // Verify payment status
    if (session.payment_status !== 'paid') {
      return NextResponse.json(
        { error: 'Payment not completed' },
        { status: 400 }
      );
    }

    // Initialize Payload
    const payload = await getPayload({ config: configPromise });
    
    // Get current user or try to find by email
    let user = await getLoggedInUser();
    
    // If no logged-in user but we have customer email, try to find user by email
    if (!user && session.customer_details?.email) {
      const users = await payload.find({
        collection: 'users',
        where: {
          email: {
            equals: session.customer_details.email,
          },
        },
      });
      
      if (users.docs.length > 0) {
        user = users.docs[0];
      }
    }

    // Prepare order items from line items
    const orderItems = [];
    
    if (session.line_items?.data) {
      for (const item of session.line_items.data) {
        // The product ID in Stripe may be different from our internal ID
        // We need to find our product by stripePriceID
        const products = await payload.find({
          collection: 'products',
          where: {
            stripePriceID: {
              equals: item.price?.id,
            },
          },
        });
        
        if (products.docs.length > 0) {
          const product = products.docs[0];
          
          orderItems.push({
            product: product.id,
            title: product.title,
            quantity: item.quantity,
            price: product.price.value,
            currency: product.price.currency,
          });
        }
      }
    }

    // Calculate order total
    const total = orderItems.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    
    // Create order in database
    const order = await payload.create({
      collection: 'orders',
      data: {
        user: user?.id,
        customerEmail: session.customer_details?.email,
        customerName: `${session.customer_details?.name || 'Guest Customer'}`,
        items: orderItems,
        total,
        status: 'processing',
        paymentStatus: 'paid',
        paymentMethod: 'stripe',
        paymentId: session.payment_intent as string,
        shippingAddress: {
          name: session.shipping_details?.name,
          address: session.shipping_details?.address?.line1,
          city: session.shipping_details?.address?.city,
          state: session.shipping_details?.address?.state,
          zip: session.shipping_details?.address?.postal_code,
          country: session.shipping_details?.address?.country,
        },
      },
    });

    // Return success with order details
    return NextResponse.json({
      success: true,
      orderNumber: order.orderNumber,
      orderId: order.id,
    });
  } catch (error) {
    console.error('Error verifying Stripe session:', error);
    return NextResponse.json(
      { error: 'Failed to verify payment session' },
      { status: 500 }
    );
  }
}
