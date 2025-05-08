'use client'

import React, { useEffect, useState } from 'react'
import Image from 'next/image'
import Link from 'next/link'
import { usePathname } from 'next/navigation'

import { Header } from '../../../../payload/payload-types'
import { noHeaderFooterUrls } from '../../../constants'
import { Gutter } from '../../Gutter'
import { HeaderNav } from '../Nav'
import canUseDOM from '../../../_utilities/canUseDOM'

import classes from './index.module.scss'

const HeaderComponent = ({ header }: { header: Header }) => {
  const pathname = usePathname()
  const [headerClass, setHeaderClass] = useState('')

  useEffect(() => {
    if (pathname) {
      const hideClass = noHeaderFooterUrls.includes(pathname) ? classes.hide : ''
      setHeaderClass([classes.header, hideClass].filter(Boolean).join(' '))
    } else {
      setHeaderClass(classes.header)
    }
  }, [pathname])

  return (
    <nav className={headerClass}>
      <Gutter className={classes.wrap}>
        <Link href="/">
          <Image 
            src="/logo-kikky-4.png" 
            alt="logo" 
            width={50} 
            height={50} 
            style={{ borderRadius: '40%' }}
          />
        </Link>

        <HeaderNav header={header} />
      </Gutter>
    </nav>
  )
}

export default HeaderComponent
