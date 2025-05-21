import { Button, type ButtonProps } from '@/components/ui/button'
import { cn } from '@/utilities/ui'
import Link from 'next/link'
import React from 'react'

import type { Page, Post } from '@/payload-types'

// Define valid button variants based on the button component
type ButtonVariant = 'default' | 'destructive' | 'ghost' | 'link' | 'outline' | 'secondary';

type CMSLinkType = {
  appearance?: 'inline' | ButtonVariant
  children?: React.ReactNode
  className?: string
  label?: string | null
  newTab?: boolean | null
  reference?: {
    relationTo: 'pages' | 'posts'
    value: Page | Post | string | number
  } | null
  size?: ButtonProps['size'] | null
  type?: 'custom' | 'reference' | null
  url?: string | null
  overrideClassName?: boolean
  variant?: ButtonProps['variant']
}

export const CMSLink: React.FC<CMSLinkType> = (props) => {
  const {
    type,
    appearance = 'inline',
    children,
    className,
    label,
    newTab,
    reference,
    size: sizeFromProps,
    url,
    overrideClassName = false,
    variant,
  } = props

  const href =
    type === 'reference' && typeof reference?.value === 'object' && reference.value.slug
      ? `${reference?.relationTo !== 'pages' ? `/${reference?.relationTo}` : ''}/${
          reference.value.slug
        }`
      : url

  if (!href) return null

  const size = appearance === 'link' ? 'clear' : sizeFromProps || 'default'
  const newTabProps = newTab ? { rel: 'noopener noreferrer', target: '_blank' } : {}

  /* Ensure we don't break any styles set by richText */
  if (appearance === 'inline' && !variant) {
    return (
      <Link 
        className={cn(
          overrideClassName ? className : '',
          !overrideClassName && "text-blue-600 hover:text-blue-800 underline-offset-2 hover:underline",
          !overrideClassName && className
        )} 
        href={href || url || ''} 
        {...newTabProps}
      >
        {label && label}
        {children && children}
      </Link>
    )
  }

  if (overrideClassName) {
    return (
      <Link className={className} href={href || url || ''} {...newTabProps}>
        {label && label}
        {children && children}
      </Link>
    )
  }

  // Properly handle variant selection to avoid TypeScript errors
  const buttonVariant = (): ButtonProps['variant'] => {
    // First use provided variant if available
    if (variant) return variant;
    
    // If appearance is 'inline', default to 'default'
    if (appearance === 'inline') return 'default';
    
    // For all other cases, appearance is a valid button variant
    return appearance as ButtonVariant;
  };

  return (
    <Button 
      asChild 
      className={cn(
        "min-h-[44px] px-4 py-2 flex items-center justify-center", 
        className
      )}
      size={size} 
      variant={buttonVariant()}
    >
      <Link href={href || url || ''} {...newTabProps}>
        {label || children}
      </Link>
    </Button>
  )
}
