import { NextRequest, NextResponse } from 'next/server';
import Stripe from 'stripe';
import { getPayload } from 'payload';
import configPromise from '@payload-config';
import { getLoggedInUser } from '@/utilities/auth/server';

export async function POST(request: NextRequest) {
  try {
    // Initialize Stripe with secret key
    if (!process.env.STRIPE_SECRET_KEY) {
      return NextResponse.json(
        { error: 'Stripe is not configured' },
        { status: 500 }
      );
    }

    const stripe = new Stripe(process.env.STRIPE_SECRET_KEY, {
      apiVersion: '2023-10-16', // Use latest API version
    });

    // Get request body
    const { items, shippingDetails } = await request.json();
    
    if (!items || !items.length) {
      return NextResponse.json(
        { error: 'No items provided' },
        { status: 400 }
      );
    }

    // Initialize Payload to access collections
    const payload = await getPayload({ config: configPromise });
    
    // Get the current user
    const user = await getLoggedInUser();
    
    // Prepare line items for Stripe
    const lineItems = [];
    
    // Fetch detailed product information for each item
    for (const item of items) {
      if (!item.product?.id || !item.quantity) {
        return NextResponse.json(
          { error: 'Invalid item format' },
          { status: 400 }
        );
      }
      
      // Get product from database
      const product = await payload.findByID({
        collection: 'products',
        id: item.product.id,
      });
      
      if (!product) {
        return NextResponse.json(
          { error: `Product not found: ${item.product.id}` },
          { status: 400 }
        );
      }
      
      // Check if product has Stripe IDs
      if (!product.stripePriceID) {
        return NextResponse.json(
          { error: `Product not synced with Stripe: ${product.title}` },
          { status: 400 }
        );
      }
      
      // Add to line items
      lineItems.push({
        price: product.stripePriceID,
        quantity: item.quantity,
      });
    }
    
    // Create Stripe checkout session
    const session = await stripe.checkout.sessions.create({
      payment_method_types: ['card'],
      line_items: lineItems,
      mode: 'payment',
      success_url: `${request.headers.get('origin')}/checkout/success?session_id={CHECKOUT_SESSION_ID}`,
      cancel_url: `${request.headers.get('origin')}/checkout?canceled=true`,
      customer_email: user?.email || shippingDetails?.email,
      shipping_address_collection: {
        allowed_countries: ['US', 'CA', 'GB', 'KE'], // Add more countries as needed
      },
      metadata: {
        userId: user?.id || 'guest',
      },
    });
    
    // Return the session ID to the client
    return NextResponse.json({ sessionId: session.id, url: session.url });
  } catch (error) {
    console.error('Stripe checkout error:', error);
    return NextResponse.json(
      { error: 'Error creating checkout session' },
      { status: 500 }
    );
  }
}
