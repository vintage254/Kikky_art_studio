'use client'

import React from 'react'

import { HeaderThemeProvider } from './HeaderTheme'
import { ThemeProvider } from './Theme'
import { AnimationProvider } from './AnimationProvider'

export const Providers: React.FC<{
  children: React.ReactNode
}> = ({ children }) => {
  return (
    <ThemeProvider>
      <HeaderThemeProvider>
        <AnimationProvider>
          {children}
        </AnimationProvider>
      </HeaderThemeProvider>
    </ThemeProvider>
  )
}
