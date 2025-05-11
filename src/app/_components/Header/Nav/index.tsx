'use client'

import React, { useEffect, useState } from 'react'
import Link from 'next/link'

import { Header as HeaderType } from '../../../../payload/payload-types'
import { useAuth } from '../../../_providers/Auth'
import { Button } from '../../Button'
import { CartLink } from '../../CartLink'
import { CMSLink } from '../../Link'

import classes from './index.module.scss'

export const HeaderNav: React.FC<{ header: HeaderType | null }> = ({ header }) => {
  const navItems = header?.navItems || []
  const [isClient, setIsClient] = useState(false)
  const [navClass, setNavClass] = useState(classes.nav)
  
  // Always call useAuth hook to follow React's rules of hooks
  const auth = useAuth()
  // Only use the auth value if on the client
  const user = isClient ? auth.user : undefined

  // Handle client-side initialization
  useEffect(() => {
    setIsClient(true)
  }, [])
  
  // Update nav class when user state changes
  useEffect(() => {
    if (isClient) {
      setNavClass([classes.nav, user === undefined && classes.hide].filter(Boolean).join(' '))
    }
  }, [user, isClient])

  // If not on client yet, render a placeholder to avoid hydration mismatch
  if (!isClient) {
    return <nav className={classes.nav}></nav>
  }

  return (
    <nav className={navClass}>
      {navItems.map(({ link }, i) => {
        if (!link) return null
        return <CMSLink key={i} {...link} appearance="none" />
      })}
      <CartLink />
      {user && <Link href="/account">Account</Link>}
      {!user && (
        <Button
          el="link"
          href="/login"
          label="Login"
          appearance="primary"
        />
      )}
    </nav>
  )
}
