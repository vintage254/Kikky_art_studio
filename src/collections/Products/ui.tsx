'use client'

import React from 'react'
import { useField } from '@payloadcms/ui'

type ProductData = {
  title?: string
  price?: {
    value?: number
    currency?: string
  }
  stock?: number
}

// Example custom UI component for the product list view
export const ProductRowLabel: React.FC = () => {
  // For proper implementation, get path from props in a real component
  // This is just a demonstration placeholder
  const fieldPath = ''
  
  const { value } = useField<ProductData>({
    path: fieldPath,
  })

  // Handle the new price structure with null checks
  const formatPrice = () => {
    if (!value?.price?.value) return 'N/A'
    
    try {
      return new Intl.NumberFormat('en-US', { 
        style: 'currency', 
        currency: value.price.currency || 'USD' 
      }).format(value.price.value / 100)
    } catch (error) {
      console.error('Error formatting price:', error)
      return `${value.price.value / 100} ${value.price.currency || 'USD'}`
    }
  }

  const formattedPrice = formatPrice()

  // Using nullish coalescing to provide a default value of 0
  const stockValue = value?.stock ?? 0
  
  const stockStatus = stockValue > 0 ? 'In Stock' : 'Out of Stock'

  return (
    <div className="flex gap-2 items-center">
      <span className="font-bold">{value?.title || 'Untitled Product'}</span>
      <span className="mx-2">|</span>
      <span>{formattedPrice}</span>
      <span className="mx-2">|</span>
      <span className={stockValue > 0 ? 'text-green-500' : 'text-red-500'}>
        {stockStatus}
      </span>
    </div>
  )
} 