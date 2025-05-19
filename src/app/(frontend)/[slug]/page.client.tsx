'use client'
import { useHeaderTheme } from '@/providers/HeaderTheme'
import React, { useEffect } from 'react'
import classes from './index.module.scss'
import type { Category as PayloadCategory, Product, CallToActionBlock } from '@/payload-types'
import { ProductCarousel } from '@/components/ProductCarousel'
import { AboutSection } from '@/components/AboutSection'
import Image from 'next/image'
import Link from 'next/link'
// Import icons individually to avoid barrel optimization issues
import { Instagram } from 'lucide-react'
import WhatsAppIcon from '@/components/ui/WhatsAppIcon'
import { getClientSideURL } from '@/utilities/getURL'

// Define type for category that matches Payload's Category type
type Category = PayloadCategory

// Define props for Categories component
interface CategoriesProps {
  categories: Category[] | null
}

// Define props for SocialLinks component
interface SocialLinksProps {
  links: Array<{
    link: {
      type?: 'reference' | 'custom' | null
      newTab?: boolean | null
      reference?: {
        relationTo: 'pages' | 'posts'
        value: any
      } | null
      url?: string | null
      label: string
      appearance?: string | null
    }
  }>
}

// Define props for PageClient component
interface PageClientProps {
  categories: Category[] | null
  featuredProducts: Product[] | null
  aboutPage?: {
    title?: string
    slug?: string
    description?: string
  } | null
  callToActionBlock?: CallToActionBlock | null
}

// Extract social media links from URLs
const getSocialMediaType = (url: string | null | undefined): 'instagram' | 'whatsapp' | 'other' => {
  if (!url) return 'other'
  if (url.includes('instagram.com') || url.includes('instagram')) {
    return 'instagram'
  }
  if (url.includes('whatsapp') || url.includes('wa.me')) {
    return 'whatsapp'
  }
  return 'other'
}

// SocialLinks component for displaying Instagram and WhatsApp links
const SocialLinks: React.FC<SocialLinksProps> = ({ links }) => {
  if (!links || links.length === 0) return null

  // Filter to only include social media links
  const socialLinks = links.filter(item => {
    const url = item.link?.url || ''
    const type = getSocialMediaType(url)
    return type === 'instagram' || type === 'whatsapp'
  })

  if (socialLinks.length === 0) return null

  return (
    <div className="w-full py-10">
      <div className="container mx-auto px-4">
        <div className="max-w-4xl mx-auto bg-white rounded-lg shadow-md p-8">
          <h2 className="text-2xl font-bold mb-6 text-center">Connect With Us</h2>
          <div className="flex justify-center space-x-8">
            {socialLinks.map((linkItem, index) => {
              const url = linkItem.link?.url || '#'
              const label = linkItem.link?.label || ''
              const type = getSocialMediaType(url)
              
              return (
                <Link 
                  key={index}
                  href={url || '#'}
                  target="_blank" 
                  rel="noopener noreferrer"
                  className="flex flex-col items-center p-4 hover:bg-gray-50 rounded-lg transition-colors"
                >
                  {type === 'instagram' ? (
                    <Instagram size={40} className="text-pink-600 mb-2" />
                  ) : type === 'whatsapp' ? (
                    <WhatsAppIcon size={40} className="text-green-500 mb-2" />
                  ) : null}
                  <span className="font-medium">
                    {label || (type === 'instagram' ? 'Follow us on Instagram' : 'Chat on WhatsApp')}
                  </span>
                </Link>
              )
            })}
          </div>
        </div>
      </div>
    </div>
  )
}

// Categories component for displaying category cards
const Categories: React.FC<CategoriesProps> = ({ categories }) => {
  if (!categories || categories.length === 0) return null
  
  const baseUrl = getClientSideURL()
  
  return (
    <div className="w-full py-10">
      <h2 className="text-2xl font-bold mb-6 text-center">Categories</h2>
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
        {categories.map((category) => (
          <Link 
            key={category.id}
            href={`/categories/${category.slug}`}
            className="group block overflow-hidden rounded-lg border hover:shadow-md transition-shadow"
          >
            {category.image && (
              <div className="relative w-full h-48">
                <Image
                  src={`${baseUrl}${
                    // Use optional chaining for all potential undefined values
                    category.image?.url || ''
                  }`}
                  alt={category.title || 'Category image'}
                  fill
                  sizes="(max-width: 640px) 100vw, (max-width: 768px) 50vw, 25vw"
                  style={{ objectFit: 'cover' }}
                  priority={false}
                  placeholder="blur"
                  blurDataURL="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+P+/HgAEDQIHq4C+sgAAAABJRU5ErkJggg=="
                />
              </div>
            )}
            <div className="p-5">
              <h3 className="font-medium text-lg">{category.title}</h3>
              {category.meta?.description && (
                <p className="text-sm mt-2 text-gray-600">{category.meta.description}</p>
              )}
            </div>
          </Link>
        ))}
      </div>
    </div>
  )
}

const PageClient: React.FC<PageClientProps> = ({ categories, featuredProducts, aboutPage, callToActionBlock }) => {
  /* Force the header to be dark mode while we have an image behind it */
  const { setHeaderTheme } = useHeaderTheme()

  useEffect(() => {
    setHeaderTheme('light')
  }, [setHeaderTheme])

  // Only render the home components if we have them (for the homepage)
  return (
    <div className={classes.home}>
      {categories && <Categories categories={categories} />}
      {featuredProducts && <ProductCarousel products={featuredProducts} />}
      <AboutSection aboutPage={aboutPage} />
      {callToActionBlock?.links && callToActionBlock.links.length > 0 && (
        <SocialLinks links={callToActionBlock.links} />
      )}
    </div>
  )
}

export default PageClient
