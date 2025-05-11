'use client'

import React, { useEffect, useState } from 'react'

import { Product } from '../../../payload/payload-types'

import classes from './index.module.scss'

// Available currencies
const currencies = {
  USD: { symbol: '$', name: 'US Dollar' },
  KES: { symbol: 'KSh', name: 'Kenyan Shilling' },
  EUR: { symbol: '€', name: 'Euro' },
  GBP: { symbol: '£', name: 'British Pound' },
}

// Exchange rates (relative to USD)
// In a real app, you'd fetch these from an API
const exchangeRates = {
  USD: 1,
  KES: 130.25, // 1 USD = 130.25 KES (example rate)
  EUR: 0.92,   // 1 USD = 0.92 EUR (example rate)
  GBP: 0.78,   // 1 USD = 0.78 GBP (example rate)
}

export const priceFromJSON = (
  priceJSON: string, 
  quantity: number = 1, 
  raw?: boolean, 
  currency: string = 'USD'
): string => {
  let price = ''

  if (priceJSON) {
    try {
      const parsed = JSON.parse(priceJSON)?.data[0]
      let priceValue = parsed.unit_amount * quantity
      const priceType = parsed.type
      const originalCurrency = parsed.currency?.toUpperCase() || 'USD'

      // Convert currency if needed
      if (currency !== originalCurrency) {
        // Convert to USD first if original currency is not USD
        const valueInUSD = originalCurrency === 'USD' 
          ? priceValue / 100 
          : (priceValue / 100) / exchangeRates[originalCurrency]
        
        // Convert from USD to target currency
        priceValue = valueInUSD * exchangeRates[currency] * 100
      }

      if (raw) return priceValue.toString()

      price = (priceValue / 100).toLocaleString('en-US', {
        style: 'currency',
        currency: currency,
      })

      if (priceType === 'recurring') {
        price += `/${
          parsed.recurring.interval_count > 1
            ? `${parsed.recurring.interval_count} ${parsed.recurring.interval}`
            : parsed.recurring.interval
        }`
      }
    } catch (e) {
      console.error(`Cannot parse priceJSON`) // eslint-disable-line no-console
    }
  }

  return price
}

export const Price: React.FC<{
  product: Product
  quantity?: number
  button?: 'addToCart' | 'removeFromCart' | false
  currency?: string
}> = props => {
  const { 
    product, 
    product: { priceJSON } = {}, 
    button = 'addToCart', 
    quantity,
    currency = 'USD' // Default currency
  } = props

  const [selectedCurrency, setSelectedCurrency] = useState(currency)
  const [price, setPrice] = useState<{
    actualPrice: string
    withQuantity: string
  }>(() => ({
    actualPrice: priceFromJSON(priceJSON, 1, false, selectedCurrency),
    withQuantity: priceFromJSON(priceJSON, quantity, false, selectedCurrency),
  }))

  useEffect(() => {
    setPrice({
      actualPrice: priceFromJSON(priceJSON, 1, false, selectedCurrency),
      withQuantity: priceFromJSON(priceJSON, quantity, false, selectedCurrency),
    })
  }, [priceJSON, quantity, selectedCurrency])

  const handleCurrencyChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setSelectedCurrency(e.target.value)
  }

  return (
    <div className={classes.actions}>
      {typeof price?.actualPrice !== 'undefined' && price?.withQuantity !== '' && (
        <div className={classes.price}>
          <p>{price?.withQuantity}</p>
          <select 
            value={selectedCurrency}
            onChange={handleCurrencyChange}
            className={classes.currencySelector}
          >
            {Object.keys(currencies).map(currencyCode => (
              <option key={currencyCode} value={currencyCode}>
                {currencies[currencyCode].symbol} {currencyCode}
              </option>
            ))}
          </select>
        </div>
      )}
    </div>
  )
}
