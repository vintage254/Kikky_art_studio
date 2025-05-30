/**
 * Utility function to format price values with currency
 * @param value - The price value in the smallest currency unit (e.g., cents)
 * @param currency - The currency code (e.g., 'USD', 'EUR', 'KES')
 * @returns Formatted price string
 */
export const formatPrice = (value: number, currency: string): string => {
  const formatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: currency || 'USD',
    minimumFractionDigits: 2,
  });
  
  return formatter.format(value);
};
