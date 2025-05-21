'use client'

import { motion, useInView } from 'framer-motion'
import React, { useRef } from 'react'

interface FadeInViewProps {
  children: React.ReactNode
  delay?: number
  duration?: number
  className?: string
  once?: boolean
  as?: React.ElementType
}

export const FadeInView: React.FC<FadeInViewProps> = ({
  children,
  delay = 0,
  duration = 0.5,
  className,
  once = true,
  as = 'div',
}) => {
  const ref = useRef(null)
  const isInView = useInView(ref, { once })

  const variants = {
    hidden: { opacity: 0, y: 20 },
    visible: { 
      opacity: 1, 
      y: 0,
      transition: {
        duration,
        delay,
        ease: 'easeOut'
      }
    }
  }

  return (
    <motion.div
      ref={ref}
      initial="hidden"
      animate={isInView ? 'visible' : 'hidden'}
      variants={variants}
      className={className}
      as={as}
    >
      {children}
    </motion.div>
  )
} 