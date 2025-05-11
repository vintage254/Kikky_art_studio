'use client'

import React, { useEffect, useState } from 'react'
import { Elements } from '@stripe/react-stripe-js'
import { loadStripe } from '@stripe/stripe-js'
import Link from 'next/link'
import { useRouter } from 'next/navigation'

import { Settings } from '../../../../payload/payload-types'
import { Button } from '../../../_components/Button'
import { HR } from '../../../_components/HR'
import { LoadingShimmer } from '../../../_components/LoadingShimmer'
import { Message } from '../../../_components/Message'
import { useAuth } from '../../../_providers/Auth'
import { useCart } from '../../../_providers/Cart'
import { useTheme } from '../../../_providers/Theme'
import cssVariables from '../../../cssVariables'
import { CheckoutForm } from '../CheckoutForm'
import { MpesaCheckoutForm } from '../MpesaCheckoutForm'
import { CheckoutItem } from '../CheckoutItem'

import classes from './index.module.scss'

const apiKey = process.env.NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY
const stripe = loadStripe(apiKey || '')

export const CheckoutPage: React.FC<{
  settings: Settings
}> = ({ settings }) => {
  const { user } = useAuth()
  const router = useRouter()
  const [error, setError] = useState('')
  const [clientSecret, setClientSecret] = useState('')
  const [paymentMethod, setPaymentMethod] = useState<'stripe' | 'mpesa'>('stripe')
  const { theme } = useTheme()
  const { cart, cartIsEmpty, cartTotal } = useCart()

  useEffect(() => {
    if (!user) router.push('/login?redirect=%2Fcheckout')
  }, [router, user])

  useEffect(() => {
    const getClientSecret = async () => {
      try {
        if (user && !cartIsEmpty) {
          const req = await fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/create-payment-intent`, {
            method: 'POST',
            credentials: 'include',
          })

          const res = await req.json()

          if (res.error) {
            setError(res.error)
            return
          }

          if (res.client_secret) {
            setClientSecret(res.client_secret)
          }
        }
      } catch (e) {
        setError('Something went wrong.')
      }
    }

    if (paymentMethod === 'stripe') {
      getClientSecret()
    }
  }, [user, cartIsEmpty, paymentMethod])

  if (!user || !cart) {
    return (
      <div className={classes.loading}>
        <LoadingShimmer />
      </div>
    )
  }

  if (cartIsEmpty) {
    return (
      <div className={classes.empty}>
        <h1>Your cart is empty</h1>
        <p>
          <Link href="/products">Continue shopping</Link> to add items to your cart.
        </p>
      </div>
    )
  }

  return (
    <div className={classes.container}>
      <div className={classes.items}>
        <div className={classes.header}>
          <p>Items in your cart</p>
        </div>
        <ul>
          {cart?.items?.map((item, index) => {
            if (typeof item.product === 'object') {
              const {
                product,
                product: {
                  title,
                  meta: { image: metaImage } = {},
                } = {},
                quantity,
              } = item

              const isLast = index === (cart?.items?.length || 0) - 1

              const metaImageURL = metaImage && typeof metaImage === 'object' && metaImage.url

              return (
                <React.Fragment key={index}>
                  <CheckoutItem
                    product={product}
                    title={title}
                    metaImage={metaImage}
                    quantity={quantity}
                    index={index}
                  />
                  {!isLast && <HR />}
                </React.Fragment>
              )
            }
            return null
          })}
        </ul>

        <div className={classes.summary}>
          <div className={classes.row}>
            <h6>Subtotal</h6>
            <p>{cartTotal.formatted}</p>
          </div>
          <div className={classes.row}>
            <h6>Taxes</h6>
            <p>Calculated at checkout</p>
          </div>
          <HR />
          <div className={classes.row}>
            <h5>Total</h5>
            <p>{cartTotal.formatted}</p>
          </div>
        </div>
      </div>

      <div className={classes.sidebar}>
        <div className={classes.paymentOptions}>
          <h3>Select Payment Method</h3>
          <div className={classes.paymentSelector}>
            <button
              className={`${classes.paymentMethod} ${paymentMethod === 'stripe' ? classes.selected : ''}`}
              onClick={() => setPaymentMethod('stripe')}
            >
              <span>Credit/Debit Card</span>
              <small>International payments via Stripe</small>
            </button>
            <button
              className={`${classes.paymentMethod} ${paymentMethod === 'mpesa' ? classes.selected : ''}`}
              onClick={() => setPaymentMethod('mpesa')}
            >
              <span>M-Pesa</span>
              <small>Mobile money for Kenyan customers</small>
            </button>
          </div>
        </div>

        {error && <Message error={error} />}

        {paymentMethod === 'stripe' && clientSecret ? (
          <Elements
            options={{
              clientSecret,
              appearance: {
                theme: 'stripe',
                variables: {
                  colorText:
                    theme === 'dark' ? cssVariables.colors.base0 : cssVariables.colors.base900,
                  fontFamily: 'Inter, sans-serif',
                  fontSizeBase: '16px',
                  colorBackground:
                    theme === 'dark' ? cssVariables.colors.base850 : cssVariables.colors.base0,
                  colorPrimary: cssVariables.colors.primary500,
                  colorDanger: cssVariables.colors.error500,
                  borderRadius: '0px',
                  colorTextPlaceholder: cssVariables.colors.base500,
                },
              },
            }}
            stripe={stripe}
            key={clientSecret}
          >
            <CheckoutForm />
          </Elements>
        ) : paymentMethod === 'mpesa' ? (
          <MpesaCheckoutForm />
        ) : (
          <div className={classes.loading}>
            <LoadingShimmer />
          </div>
        )}

        <div className={classes.actions}>
          <Button href="/cart" appearance="secondary" label="Back to cart" />
        </div>
      </div>
    </div>
  )
}
