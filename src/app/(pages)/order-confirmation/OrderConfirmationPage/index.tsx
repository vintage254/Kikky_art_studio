'use client'

import React, { Fragment, useEffect } from 'react'
import { useSearchParams } from 'next/navigation'

import { Button } from '../../../_components/Button'
import { Message } from '../../../_components/Message'
import { useCart } from '../../../_providers/Cart'

import classes from './index.module.scss'

export const OrderConfirmationPage: React.FC<{}> = () => {
  const searchParams = useSearchParams()
  const orderID = searchParams.get('order_id')
  const error = searchParams.get('error')
  const paymentMethod = searchParams.get('payment_method')

  const { clearCart } = useCart()

  useEffect(() => {
    clearCart()
  }, [clearCart])

  return (
    <div>
      {error ? (
        <Fragment>
          <Message error={error} />
          <p>
            {`Your payment was successful but there was an error processing your order. Please contact us to resolve this issue.`}
          </p>
          <div className={classes.actions}>
            <Button href="/account" label="View account" appearance="primary" />
            <Button
              href={`${process.env.NEXT_PUBLIC_SERVER_URL}/orders`}
              label="View all orders"
              appearance="secondary"
            />
          </div>
        </Fragment>
      ) : (
        <Fragment>
          <h1>Thank you for your order!</h1>
          {paymentMethod === 'cash_on_delivery' ? (
            <div className={classes.cashOnDeliveryInfo}>
              <Message success="Your order has been placed successfully!" />
              <p>
                {`Your order (ID: ${orderID}) has been confirmed. You will pay upon delivery.`}
              </p>
              <p>You will receive an email confirmation shortly.</p>
            </div>
          ) : (
            <p>
              {`Your order has been confirmed. You will receive an email confirmation shortly. Your order ID is ${orderID}.`}
            </p>
          )}
          <div className={classes.actions}>
            <Button href={`/account/orders/${orderID}`} label="View order" appearance="primary" />
            <Button
              href={`${process.env.NEXT_PUBLIC_SERVER_URL}/account/orders`}
              label="View all orders"
              appearance="secondary"
            />
          </div>
        </Fragment>
      )}
    </div>
  )
}
