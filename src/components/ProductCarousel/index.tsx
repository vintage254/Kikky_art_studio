'use client'

import React from 'react'
import Image from 'next/image'
import Link from 'next/link'
import { Swiper, SwiperSlide } from 'swiper/react'
import { Navigation, Pagination, Autoplay } from 'swiper/modules'
import type { Product } from '@/payload-types'
import { getClientSideURL } from '@/utilities/getURL'

// Import Swiper styles
import 'swiper/css'
import 'swiper/css/navigation'
import 'swiper/css/pagination'

interface ProductCarouselProps {
  products: Product[] | null
}

export const ProductCarousel: React.FC<ProductCarouselProps> = ({ products }) => {
  if (!products || products.length === 0) {
    return null
  }

  const baseUrl = getClientSideURL()

  return (
    <section className="w-full py-12">
      <div className="container mx-auto px-4">
        <h2 className="text-2xl md:text-3xl font-bold mb-8 text-center">Featured Products</h2>
        
        <Swiper
          modules={[Navigation, Pagination, Autoplay]}
          spaceBetween={20}
          slidesPerView={1}
          navigation
          pagination={{ clickable: true }}
          autoplay={{ delay: 5000 }}
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
        >
          {products.map((product) => (
            <SwiperSlide key={product.id}>
              <div className="bg-white rounded-lg overflow-hidden shadow-md hover:shadow-lg transition-shadow duration-300">
                {product.images && product.images.length > 0 && (
                  <div className="relative w-full h-48">
                    <Image
                      src={`${baseUrl}${
                        product.images[0]?.image?.url || ''
                      }`}
                      alt={product.title || 'Product image'}
                      fill
                      sizes="(max-width: 640px) 100vw, (max-width: 768px) 50vw, 25vw"
                      style={{ objectFit: 'cover' }}
                      priority={false}
                      placeholder="blur"
                      blurDataURL="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+P+/HgAEDQIHq4C+sgAAAABJRU5ErkJggg=="
                    />
                  </div>
                )}
                <div className="p-4">
                  <h3 className="font-medium text-lg mb-2">{product.title}</h3>
                  <div className="flex justify-between items-center mt-4">
                    <span className="font-bold text-lg">
                      {product.price?.currency} {(product.price?.value || 0) / 100}
                    </span>
                    <Link
                      href={`/products/${product.slug}`}
                      className="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition-colors text-sm"
                    >
                      View Details
                    </Link>
                  </div>
                </div>
              </div>
            </SwiperSlide>
          ))}
        </Swiper>
      </div>
    </section>
  )
} 