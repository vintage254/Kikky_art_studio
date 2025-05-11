'use client'

import React, { useCallback, useState } from 'react'
import { useRouter } from 'next/navigation'

import { Button } from '../../../_components/Button'
import { Message } from '../../../_components/Message'
import { useCart } from '../../../_providers/Cart'

import classes from './index.module.scss'

export const MpesaCheckoutForm: React.FC = () => {
  const [phoneNumber, setPhoneNumber] = useState('')
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [successMessage, setSuccessMessage] = useState<string | null>(null)
  const router = useRouter()
  const { cart, cartTotal } = useCart()

  const formatPhoneNumber = (input: string): string => {
    // Remove any non-digit characters
    const digitsOnly = input.replace(/\D/g, '')
    
    // Format as Kenyan phone number
    if (digitsOnly.startsWith('254')) {
      return digitsOnly
    } else if (digitsOnly.startsWith('0')) {
      return `254${digitsOnly.substring(1)}`
    } else if (digitsOnly.startsWith('7') || digitsOnly.startsWith('1')) {
      return `254${digitsOnly}`
    }
    
    return digitsOnly
  }

  const handlePhoneNumberChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const input = e.target.value
    setPhoneNumber(input)
  }

  const handleSubmit = useCallback(
    async (e: React.FormEvent) => {
      e.preventDefault()
      setIsLoading(true)
      setError(null)
      setSuccessMessage(null)

      try {
        // Basic validation
        const formattedPhone = formatPhoneNumber(phoneNumber)
        if (!formattedPhone || formattedPhone.length < 10) {
          throw new Error('Please enter a valid phone number')
        }

        // Prepare cart items for the API
        const items = (cart?.items || [])?.map(({ product, quantity }) => ({
          product: typeof product === 'string' ? product : product.id,
          quantity,
        }))

        // Initiate M-Pesa payment
        const response = await fetch(`${process.env.NEXT_PUBLIC_SERVER_URL}/api/checkout/mpesa`, {
          method: 'POST',
          credentials: 'include',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            phoneNumber: formattedPhone,
            items,
          }),
        })

        const result = await response.json()

        if (!response.ok || result.error) {
          throw new Error(result.error || 'Failed to initiate M-Pesa payment')
        }

        // Show success message
        setSuccessMessage('M-Pesa payment initiated. Please check your phone to complete the payment.')
        
        // Redirect to order confirmation page after a delay
        setTimeout(() => {
          router.push(`/order-confirmation?order_id=${result.orderId}&payment_method=mpesa`)
        }, 5000)
      } catch (err) {
        const message = err instanceof Error ? err.message : 'Something went wrong'
        setError(`Error: ${message}`)
      } finally {
        setIsLoading(false)
      }
    },
    [phoneNumber, cart, router],
  )

  return (
    <form onSubmit={handleSubmit} className={classes.form}>
      <div className={classes.formHeader}>
        <h3>Pay with M-Pesa</h3>
        <p>Enter your phone number to receive an M-Pesa payment prompt</p>
      </div>

      {error && <Message error={error} />}
      {successMessage && <Message success={successMessage} />}

      <div className={classes.inputGroup}>
        <label htmlFor="phoneNumber" className={classes.label}>
          M-Pesa Phone Number
        </label>
        <input
          id="phoneNumber"
          type="tel"
          placeholder="e.g., 07XXXXXXXX or 254XXXXXXXXX"
          value={phoneNumber}
          onChange={handlePhoneNumberChange}
          className={classes.input}
          required
        />
        <small className={classes.inputHint}>
          Enter your phone number in the format 07XXXXXXXX or 254XXXXXXXXX
        </small>
      </div>

      <div className={classes.orderSummary}>
        <div className={classes.orderItem}>
          <span>Total Amount:</span>
          <span className={classes.orderAmount}>{cartTotal.formatted}</span>
        </div>
      </div>

      <div className={classes.actions}>
        <Button
          label={isLoading ? 'Processing...' : 'Pay with M-Pesa'}
          type="submit"
          appearance="primary"
          disabled={isLoading}
          className={classes.submitButton}
        />
      </div>
    </form>
  )
} 