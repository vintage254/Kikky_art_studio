import React from 'react'
import Link from 'next/link'

import { Footer } from '../../../payload/payload-types'
import { fetchFooter } from '../../_api/fetchGlobals'
import FooterComponent from './FooterComponent'

export async function Footer() {
  let footer: Footer | null = null

  try {
    footer = await fetchFooter()
  } catch (error) {
    console.error('Error in Footer component:', error)
    // Continue with null footer - the FooterComponent should handle this
  }

  const navItems = footer?.navItems || []

  return (
    <>
      <FooterComponent footer={footer} />
    </>
  )
}
