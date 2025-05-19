import type { Access, AccessArgs } from 'payload'

import type { User } from '@/payload-types'

export const isAdminOrSelf: Access = ({ req: { user } }: AccessArgs<any, User>) => {
  // Return true if user has admin role (you would need to add a role field to your users)
  // Otherwise, users can only access their own orders

  // If no user, deny access
  if (!user) return false

  // Check if the user has an admin role (you'll need to implement this)
  if (user.role === 'admin') return true

  // Otherwise, check if the document relates to this user
  return {
    user: {
      equals: user.id,
    },
  }
} 