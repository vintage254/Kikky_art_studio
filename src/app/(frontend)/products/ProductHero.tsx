import React from 'react'
import Image from 'next/image'
import { Gutter } from '@/components/ui/Gutter'
import { getClientSideURL } from '@/utilities/getURL'
import classes from './productHero.module.scss'

// Define types for the hero section
interface ProductHeroProps {
  heroImage?: {
    url?: string
    alt?: string
  } | null
  title?: string
  tagline?: string
}

export const ProductHero: React.FC<ProductHeroProps> = ({ 
  heroImage, 
  title = 'PRODUCTS',
  tagline = 'NEW COLLECTION 2025'
}) => {
  const baseUrl = getClientSideURL()

  return (
    <section className={classes.hero}>
      {/* Hero Background with Overlay */}
      <div className={classes.heroBackground}>
        {heroImage && heroImage.url ? (
          <Image
            src={`${baseUrl}${heroImage.url}`}
            alt={heroImage.alt || 'Product Collection'}
            fill
            priority
            className={classes.heroImage}
          />
        ) : null}
        <div className={classes.overlay}></div>
      </div>

      {/* Hero Content */}
      <Gutter className={classes.heroContent}>
        <div className={classes.textContainer}>
          <h1 className={classes.title}>{title}</h1>
          {tagline && <p className={classes.tagline}>{tagline}</p>}
          
          <div className={classes.cta}>
            <a href="#products" className={classes.ctaButton}>
              SHOP NOW
            </a>
          </div>
        </div>
      </Gutter>
    </section>
  )
}
