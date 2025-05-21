'use client'

import { motion, useInView } from 'framer-motion'
import React, { useRef } from 'react'

interface StaggeredListProps {
  children: React.ReactNode
  staggerDelay?: number
  duration?: number
  className?: string
  once?: boolean
}

export const StaggeredList: React.FC<StaggeredListProps> = ({
  children,
  staggerDelay = 0.1,
  duration = 0.5,
  className,
  once = true,
}) => {
  const ref = useRef(null)
  const isInView = useInView(ref, { once, amount: 0.2 })

  const containerVariants = {
    hidden: { opacity: 0 },
    visible: {
      opacity: 1,
      transition: {
        staggerChildren: staggerDelay,
      },
    },
  }

  const itemVariants = {
    hidden: { opacity: 0, y: 20 },
    visible: {
      opacity: 1,
      y: 0,
      transition: {
        duration,
        ease: 'easeOut',
      },
    },
  }

  // Clone children and wrap each in a motion.div
  const wrappedChildren = React.Children.map(children, (child) => {
    return <motion.div variants={itemVariants}>{child}</motion.div>
  })

  return (
    <motion.div
      ref={ref}
      className={className}
      initial="hidden"
      animate={isInView ? 'visible' : 'hidden'}
      variants={containerVariants}
    >
      {wrappedChildren}
    </motion.div>
  )
} 