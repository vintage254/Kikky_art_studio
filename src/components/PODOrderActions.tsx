'use client'

import React, { useState } from 'react'
import { Button, Checkbox, Label } from '@payloadcms/ui'

type PODOrderActionsProps = {
  order: {
    id: string
    paymentStatus: string
    deliveryStatus: string
  }
  onUpdate: () => void
}

// This component is meant to be used in the admin panel for quick order management
export const PODOrderActions: React.FC<PODOrderActionsProps> = ({ order, onUpdate }) => {
  const [loading, setLoading] = useState(false)
  const [paymentConfirmed, setPaymentConfirmed] = useState(order.paymentStatus === 'paid')
  const [deliveryStatus, setDeliveryStatus] = useState(order.deliveryStatus)
  const [error, setError] = useState<string | null>(null)

  const handleSubmit = async () => {
    try {
      setLoading(true)
      setError(null)

      // Call your API to update the order
      const res = await fetch(`/api/orders/${order.id}`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          paymentStatus: paymentConfirmed ? 'paid' : 'pending',
          deliveryStatus,
        }),
      })

      if (!res.ok) {
        throw new Error('Failed to update order')
      }

      // Callback to refresh the data
      onUpdate()
    } catch (err) {
      console.error('Error updating order:', err)
      setError('Failed to update order')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="pod-order-actions">
      <h3>POD Order Management</h3>
      
      {error && <div className="error">{error}</div>}
      
      <div className="field">
        <Label>Payment Status</Label>
        <Checkbox
          label="Payment Received"
          value={paymentConfirmed}
          onChange={() => setPaymentConfirmed(!paymentConfirmed)}
        />
      </div>
      
      <div className="field">
        <Label>Delivery Status</Label>
        <select 
          value={deliveryStatus} 
          onChange={(e) => setDeliveryStatus(e.target.value)}
        >
          <option value="processing">Processing</option>
          <option value="shipped">Shipped</option>
          <option value="delivered">Delivered</option>
          <option value="cancelled">Cancelled</option>
        </select>
      </div>
      
      <Button 
        onClick={handleSubmit} 
        disabled={loading}
      >
        {loading ? 'Updating...' : 'Update Order'}
      </Button>
    </div>
  )
} 