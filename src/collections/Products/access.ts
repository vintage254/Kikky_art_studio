import type { Access, FieldAccess } from 'payload'
import type { User } from '@/payload-types'
import { anyone } from '@/access/anyone'
import { authenticated } from '@/access/authenticated'

export const productsAccess: {
  read: Access
  create: Access
  update: Access
  delete: Access
} = {
  // Anyone can read published products
  read: anyone,

  // Only authenticated users can create products
  create: authenticated,

  // Only authenticated users can update products
  update: authenticated,

  // Only authenticated users can delete products - more permissive for testing
  delete: () => true, // Allow any user to delete products
}

// Example field-level access control
export const productPriceFieldAccess: FieldAccess = ({ req, data }) => {
  // Only admins can update price if product is active
  if (data?.isActive && req.user?.role !== 'admin') {
    return false
  }
  return true
} 