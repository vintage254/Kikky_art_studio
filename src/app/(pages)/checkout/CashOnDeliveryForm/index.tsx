'use client'

import React, { useCallback, useState } from 'react'
import { useRouter } from 'next/navigation'

import { Button } from '../../../_components/Button'
import { Message } from '../../../_components/Message'
import { useCart } from '../../../_providers/Cart'

import classes from './index.module.scss'

export const CashOnDeliveryForm: React.FC = () => {
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [successMessage, setSuccessMessage] = useState<string | null>(null)
  const [deliveryNotes, setDeliveryNotes] = useState<string>('')
  const router = useRouter()
  const { cart, cartTotal } = useCart()

  const handleSubmit = useCallback(
    async (e: React.FormEvent) => {
      e.preventDefault()
      setIsLoading(true)
      setError(null)
      setSuccessMessage(null)

      try {
        // Prepare cart items for the API
        const items = (cart?.items || [])?.map(({ product, quantity }) => ({
          product: typeof product === 'string' ? product : product.id,
          quantity,
        }))

        // Create Cash on Delivery order
        const response = await fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/checkout/cod`, {
          method: 'POST',
          credentials: 'include',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            items,
            deliveryNotes,
          }),
        })

        const result = await response.json()

        if (!response.ok || result.error) {
          throw new Error(result.error || 'Failed to create Cash on Delivery order')
        }

        // Show success message
        setSuccessMessage('Your order has been placed successfully! You will pay upon delivery.')
        
        // Redirect to order confirmation page after a delay
        setTimeout(() => {
          router.push(`/order-confirmation?order_id=${result.orderId}&payment_method=cash_on_delivery`)
        }, 3000)
      } catch (err) {
        const message = err instanceof Error ? err.message : 'Something went wrong'
        setError(`Error: ${message}`)
      } finally {
        setIsLoading(false)
      }
    },
    [cart, router, deliveryNotes],
  )

  return (
    <form onSubmit={handleSubmit} className={classes.form}>
      <div className={classes.formHeader}>
        <h3>Cash on Delivery</h3>
        <p>Complete your order and pay when your items are delivered</p>
      </div>

      {error && <Message error={error} />}
      {successMessage && <Message success={successMessage} />}

      <div className={classes.inputGroup}>
        <label htmlFor="deliveryNotes" className={classes.label}>
          Delivery Notes (Optional)
        </label>
        <textarea
          id="deliveryNotes"
          placeholder="Special instructions for delivery"
          value={deliveryNotes}
          onChange={(e) => setDeliveryNotes(e.target.value)}
          className={classes.textarea}
          rows={3}
        />
      </div>

      <div className={classes.orderSummary}>
        <div className={classes.orderItem}>
          <span>Total Amount:</span>
          <span className={classes.orderAmount}>{cartTotal.formatted}</span>
        </div>
      </div>

      <div className={classes.actions}>
        <Button
          label={isLoading ? 'Processing...' : 'Place Order (Pay on Delivery)'}
          type="submit"
          appearance="primary"
          disabled={isLoading}
          className={classes.submitButton}
        />
      </div>
    </form>
  )
} 