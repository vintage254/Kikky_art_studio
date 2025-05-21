'use client'

import React, { useEffect } from 'react'
import Image from 'next/image'
import Link from 'next/link'
import { Swiper, SwiperSlide } from 'swiper/react'
import { Navigation, Pagination, Autoplay } from 'swiper/modules'
import type { Product, Media } from '@/payload-types'
import { getClientSideURL } from '@/utilities/getURL'
import { motion } from 'framer-motion'
import { useAnimation } from '@/providers/AnimationProvider'

// Import Swiper styles
import 'swiper/css'
import 'swiper/css/navigation'
import 'swiper/css/pagination'
import 'swiper/css/autoplay'

interface ProductCarouselProps {
  products: Product[] | null
}

export const ProductCarousel: React.FC<ProductCarouselProps> = ({ products }) => {
  // Debug log
  useEffect(() => {
    console.log('ProductCarousel: Products received:', products)
  }, [products])

  if (!products || products.length === 0) {
    console.log('ProductCarousel: No products to display')
    return (
      <section className="w-full py-12 bg-gray-50">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-2xl md:text-3xl font-bold mb-4">Featured Products</h2>
          <p>No featured products available at this time.</p>
        </div>
      </section>
    )
  }

  const baseUrl = getClientSideURL()
  const { prefersReducedMotion } = useAnimation()

  // Define animation variants
  const titleVariants = {
    hidden: { opacity: 0, y: -20 },
    visible: { 
      opacity: 1, 
      y: 0,
      transition: {
        duration: 0.5,
        ease: 'easeOut'
      }
    }
  }

  const cardVariants = {
    initial: { scale: 0.95, opacity: 0 },
    animate: { 
      scale: 1, 
      opacity: 1,
      transition: {
        duration: 0.4,
        ease: 'easeOut'
      }
    },
    hover: {
      y: -10,
      boxShadow: '0 10px 25px rgba(0, 0, 0, 0.1)',
      transition: {
        duration: 0.3
      }
    }
  }

  // Simple function to generate placeholder images if product images are missing
  const getProductImageUrl = (product: Product) => {
    if (product.images && product.images.length > 0) {
      const imageRef = product.images[0]?.image;
      
      // Check if imageRef is a Media object with a url property
      if (typeof imageRef === 'object' && imageRef !== null && 'url' in imageRef) {
        return `${baseUrl}${imageRef.url}`
      }
    }
    return 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDAwIiBoZWlnaHQ9IjMwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iNDAwIiBoZWlnaHQ9IjMwMCIgZmlsbD0iI2YzZjRmNiIvPjx0ZXh0IHg9IjUwJSIgeT0iNTAlIiBmb250LWZhbWlseT0iQXJpYWwsIHNhbnMtc2VyaWYiIGZvbnQtc2l6ZT0iMjQiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9IiM5Y2EzYWYiPkltYWdlIFVuYXZhaWxhYmxlPC90ZXh0Pjwvc3ZnPg=='
  }

  console.log('ProductCarousel: Rendering carousel with', products.length, 'products')

  return (
    <section className="w-full py-12">
      <div className="container mx-auto px-4">
        <motion.h2 
          className="text-2xl md:text-3xl font-bold mb-8 text-center"
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true }}
          variants={titleVariants}
        >
          Featured Products
        </motion.h2>
        
        <Swiper
          modules={[Navigation, Pagination, Autoplay]}
          spaceBetween={20}
          slidesPerView={1}
          navigation
          pagination={{ clickable: true }}
          autoplay={prefersReducedMotion ? false : { 
            delay: 5000,
            disableOnInteraction: false,
            pauseOnMouseEnter: true
          }}
          breakpoints={{
            640: {
              slidesPerView: 2,
            },
            768: {
              slidesPerView: 3,
            },
            1024: {
              slidesPerView: 4,
            },
          }}
          className="product-carousel"
          onInit={() => console.log('ProductCarousel: Swiper initialized')}
        >
          {products.map((product, index) => (
            <SwiperSlide key={product.id || index}>
              <motion.div 
                className="bg-white rounded-lg overflow-hidden shadow-md"
                initial="initial"
                whileInView="animate"
                whileHover="hover"
                viewport={{ once: true }}
                variants={cardVariants}
              >
                  <div className="relative w-full h-48">
                    <Image
                    src={getProductImageUrl(product)}
                      alt={product.title || 'Product image'}
                      fill
                      sizes="(max-width: 640px) 100vw, (max-width: 768px) 50vw, 25vw"
                      style={{ objectFit: 'cover' }}
                      priority={false}
                      placeholder="blur"
                      blurDataURL="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+P+/HgAEDQIHq4C+sgAAAABJRU5ErkJggg=="
                    />
                  </div>
                <div className="p-4">
                  <h3 className="font-medium text-lg mb-2">{product.title || 'Unnamed Product'}</h3>
                  <div className="flex justify-between items-center mt-4">
                    <span className="font-bold text-lg">
                      {product.price?.currency || 'USD'} {((product.price?.value || 0) / 100).toFixed(2)}
                    </span>
                    <Link
                      href={`/products/${product.slug || product.id}`}
                      className="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition-colors text-sm"
                    >
                      View Details
                    </Link>
                  </div>
                </div>
              </motion.div>
            </SwiperSlide>
          ))}
        </Swiper>
      </div>
    </section>
  )
} 