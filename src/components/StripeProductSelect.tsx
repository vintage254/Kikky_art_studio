'use client'

import React, { useEffect, useState } from 'react'
import { Select, useField } from '@payloadcms/ui'

type StripeProduct = {
  id: string
  name: string
  description?: string
  active: boolean
}

export const StripeProductSelect: React.FC = () => {
  const [loading, setLoading] = useState(true)
  const [stripeProducts, setStripeProducts] = useState<StripeProduct[]>([])
  const [error, setError] = useState<string | null>(null)
  const { value, setValue } = useField<string>({ path: 'stripeProductID' })

  useEffect(() => {
    const fetchStripeProducts = async () => {
      try {
        setLoading(true)
        // Call your API endpoint that fetches Stripe products
        const res = await fetch('/api/stripe/products')
        
        if (!res.ok) {
          throw new Error('Failed to fetch Stripe products')
        }
        
        const data = await res.json()
        setStripeProducts(data.products)
      } catch (err) {
        console.error('Error fetching Stripe products:', err)
        setError('Unable to load Stripe products')
      } finally {
        setLoading(false)
      }
    }

    fetchStripeProducts()
  }, [])

  if (error) {
    return <div className="error">{error}</div>
  }

  const options = stripeProducts.map((product) => ({
    label: product.name,
    value: product.id,
  }))

  // Add a blank option for no selection
  options.unshift({ label: 'Select a Stripe product', value: '' })

  return (
    <div>
      <label className="field-label">Stripe Product</label>
      <Select
        options={options}
        value={value || ''}
        onChange={(e) => setValue(e.target.value)}
        disabled={loading}
      />
      {loading && <div>Loading Stripe products...</div>}
    </div>
  )
} 