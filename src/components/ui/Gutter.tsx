import React from 'react'
import { cn } from '@/utilities/cn'

interface GutterProps {
  children: React.ReactNode
  className?: string
  left?: boolean
  right?: boolean
}

export const Gutter: React.FC<GutterProps> = ({ 
  children, 
  className, 
  left = true, 
  right = true 
}) => {
  return (
    <div
      className={cn(
        left && 'pl-6 md:pl-10 lg:pl-12', 
        right && 'pr-6 md:pr-10 lg:pr-12',
        className
      )}
    >
      {children}
    </div>
  )
} 