'use client'

import React, { useEffect, useState, useCallback } from 'react'
import Image from 'next/image'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { useHeaderTheme } from '@/providers/HeaderTheme'
import { Product } from '@/payload-types'
import { getClientSideURL } from '@/utilities/getURL'
import RichText from '@/components/RichText'
import payload from 'payload'

// Define props for the ProductDetailClient component
interface ProductDetailClientProps {
  product: Product
}

// Helper function to check if an image object has a URL
const hasImageUrl = (image: any): boolean => {
  return image && typeof image !== 'number' && image.url
}

// Helper function to format price
const formatPrice = (value: number, currency: string): string => {
  const formatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: currency || 'USD',
    minimumFractionDigits: 2,
  })
  
  return formatter.format(value / 100) // Convert from cents to dollars
}

const ProductDetailClient: React.FC<ProductDetailClientProps> = ({ product }) => {
  const { setHeaderTheme } = useHeaderTheme()
  const router = useRouter()
  const baseUrl = getClientSideURL()
  
  // State for image gallery and cart actions
  const [selectedImageIndex, setSelectedImageIndex] = useState(0)
  const [isAddingToCart, setIsAddingToCart] = useState(false)
  const [quantity, setQuantity] = useState(1)
  const [featuredProducts, setFeaturedProducts] = useState<Product[]>([])
  
  // Set header theme to light on mount and fetch featured products if needed
  useEffect(() => {
    setHeaderTheme('light')
    
    // Only fetch featured products if we don't have related products
    if ((!product.relatedProducts || !Array.isArray(product.relatedProducts) || product.relatedProducts.length === 0)) {
      const fetchFeaturedProducts = async () => {
        try {
          // Client-side fetch of featured products
          const response = await fetch(`/api/products?featured=true&limit=6`);
          if (response.ok) {
            const data = await response.json();
            setFeaturedProducts(data.docs || []);
          }
        } catch (error) {
          console.error('Error fetching featured products:', error);
        }
      };
      
      fetchFeaturedProducts();
    }
  }, [setHeaderTheme, product.relatedProducts]);
  
  // Handle quantity changes
  const increaseQuantity = useCallback(() => {
    setQuantity(prev => prev + 1);
  }, []);
  
  const decreaseQuantity = useCallback(() => {
    setQuantity(prev => (prev > 1 ? prev - 1 : 1));
  }, []);
  
  // Get the product category
  const category = product.category && typeof product.category === 'object' 
    ? product.category 
    : null
  
  // Get the product images array with proper validation
  const productImages = product.images && Array.isArray(product.images) 
    ? product.images.filter(imgObj => hasImageUrl(imgObj?.image)) 
    : []
    
  // Get the currently selected image
  const selectedImage = productImages.length > 0 
    ? productImages[selectedImageIndex]?.image 
    : null
    
  // Get related products if available
  const relatedProducts = product.relatedProducts && Array.isArray(product.relatedProducts)
    ? product.relatedProducts.filter(related => typeof related === 'object' && related !== null)
    : []
  
  // Handle add to cart action
  const handleAddToCart = useCallback(() => {
    setIsAddingToCart(true)
    // Simulate adding to cart
    setTimeout(() => {
      setIsAddingToCart(false)
      alert(`Added ${quantity} x ${product.title} to cart!`)
    }, 800)
  }, [product.title, quantity])
  
  // Handle shop now action (checkout)
  const handleShopNow = useCallback(() => {
    // Could pass quantity as a query parameter
    router.push(`/checkout?product=${product.id}&quantity=${quantity}`)
  }, [router, product.id, quantity])
  
  return (
    <div className="product-detail">
      {/* Breadcrumb */}
      <div className="mb-8">
        <nav className="flex" aria-label="Breadcrumb">
          <ol className="inline-flex items-center space-x-1 md:space-x-3">
            <li className="inline-flex items-center">
              <Link href="/" className="text-sm text-gray-500 hover:text-gray-900">
                Home
              </Link>
            </li>
            <li>
              <div className="flex items-center">
                <span className="mx-2 text-gray-400">/</span>
                <Link href="/products" className="text-sm text-gray-500 hover:text-gray-900">
                  Products
                </Link>
              </div>
            </li>
            <li aria-current="page">
              <div className="flex items-center">
                <span className="mx-2 text-gray-400">/</span>
                <span className="text-sm text-gray-800 font-medium">
                  {product.title}
                </span>
              </div>
            </li>
          </ol>
        </nav>
      </div>
      
      {/* Product Detail with Enhanced Gallery */}
      {/* Main product layout */}
      <div className="flex flex-col md:flex-row gap-6 md:gap-10">
        {/* Left column - Product image */}
        <div className="md:w-1/2 lg:w-2/5">
          {/* Main Image Display */}
          <div className="aspect-square relative bg-gray-100 overflow-hidden rounded-md shadow-md">
            {hasImageUrl(selectedImage) ? (
              <Image
                src={`${baseUrl}${typeof selectedImage === 'object' && selectedImage !== null && 'url' in selectedImage ? selectedImage.url : ''}`}
                alt={product.title || 'Product image'}
                fill
                priority={true} /* Add priority to improve LCP performance */
                sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 40vw"
                className="object-contain"
              />
            ) : (
              <div className="w-full h-full flex items-center justify-center text-gray-400">
                <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1" strokeLinecap="round" strokeLinejoin="round">
                  <rect width="18" height="18" x="3" y="3" rx="2" ry="2" />
                  <circle cx="9" cy="9" r="2" />
                  <path d="m21 15-3.086-3.086a2 2 0 0 0-2.828 0L6 21" />
                </svg>
              </div>
            )}
          </div>
          
          {/* Thumbnails - horizontal layout on all screens */}
          {productImages.length > 1 && (
            <div className="mt-4 flex flex-row flex-wrap gap-2 justify-center">
              {productImages.map((imgObj, index) => {
                const thumbnail = imgObj?.image && typeof imgObj.image === 'object' && 'url' in imgObj.image ? 
                  imgObj.image : null
                
                return (
                  <button
                    key={`thumb-${index}`}
                    className={`flex-shrink-0 w-16 h-16 relative bg-gray-100 overflow-hidden rounded-md ${selectedImageIndex === index ? 'ring-2 ring-black' : 'ring-1 ring-gray-200'}`}
                    onClick={() => setSelectedImageIndex(index)}
                    aria-label={`View product image ${index + 1}`}
                  >
                    {hasImageUrl(thumbnail) ? (
                      <Image
                        src={`${baseUrl}${typeof thumbnail === 'object' && thumbnail !== null && 'url' in thumbnail ? thumbnail.url : ''}`}
                        alt={`Thumbnail ${index + 1}`}
                        fill
                        sizes="80px"
                        className="object-cover"
                      />
                    ) : (
                      <div className="w-full h-full flex items-center justify-center text-gray-400">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1" strokeLinecap="round" strokeLinejoin="round">
                          <rect width="18" height="18" x="3" y="3" rx="2" ry="2" />
                          <circle cx="9" cy="9" r="2" />
                          <path d="m21 15-3.086-3.086a2 2 0 0 0-2.828 0L6 21" />
                        </svg>
                      </div>
                    )}
                  </button>
                )
              })}
            </div>
          )}
        </div>
        
        {/* Right column - Product info */}
        <div className="md:w-1/2 lg:w-3/5">
          <h1 className="text-3xl font-bold mb-2">{product.title}</h1>
          
          {/* Price */}
          {product.price && (
            <div className="text-2xl font-semibold mb-4">
              {formatPrice(product.price.value, product.price.currency)}
            </div>
          )}
          
          {/* Category */}
          <div className="mb-4">
            {category && (
              <div>
                <span className="font-medium">Category:</span> {category.title}
              </div>
            )}
          </div>
          
          {/* Product Description - moved to be under categories */}
          {product.description && (
            <div className="prose prose-sm mb-6">
              <RichText data={product.description} />
            </div>
          )}
          
          {/* Tags section */}
          {/* @ts-ignore - Handle potential missing tags property in type definition */}
          {product.tags && Array.isArray(product.tags) && product.tags.length > 0 && (
            <div className="mb-4">
              <span className="font-medium">Tags:</span> 
              <div className="flex flex-wrap gap-1 mt-1">
                {/* @ts-ignore - Handle potential type mismatch */}
                {product.tags.map((tag: string | any, index: number) => (
                  <span key={index} className="inline-block bg-gray-100 px-2 py-1 text-xs rounded">
                    {typeof tag === 'string' ? tag : ''}
                  </span>
                ))}
              </div>
            </div>
          )}
          
          {/* Stock Status - Only shown if showStock is true */}
          {/* @ts-ignore - Handle potential missing showStock property */}
          {product.showStock !== false && (
            <div className="mb-4">
              <p className={`${product.stock && product.stock > 0 ? 'text-green-600' : 'text-red-600'} font-medium`}>
                {product.stock && product.stock > 0 ? `In Stock (${product.stock} available)` : 'Out of Stock'}
              </p>
            </div>
          )}
          
          {/* Quantity Selector */}
          <div className="flex items-center mb-6">
            <span className="mr-4 font-medium">Quantity:</span>
            <div className="flex border border-gray-300 rounded-md overflow-hidden">
              <button 
                onClick={decreaseQuantity}
                className="flex items-center justify-center w-10 h-10 bg-gray-100 hover:bg-gray-200 transition-colors"
                disabled={quantity <= 1}
                aria-label="Decrease quantity"
              >
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                  <line x1="5" y1="12" x2="19" y2="12"></line>
                </svg>
              </button>
              <div className="flex items-center justify-center w-12 h-10 border-l border-r border-gray-300">
                {quantity}
              </div>
              <button 
                onClick={increaseQuantity}
                className="flex items-center justify-center w-10 h-10 bg-gray-100 hover:bg-gray-200 transition-colors"
                aria-label="Increase quantity"
              >
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                  <line x1="12" y1="5" x2="12" y2="19"></line>
                  <line x1="5" y1="12" x2="19" y2="12"></line>
                </svg>
              </button>
            </div>
          </div>
          
          {/* Action Buttons */}
          <div className="flex flex-col space-y-3 sm:flex-row sm:space-y-0 sm:space-x-3 mb-8">
            <button
              className={`flex justify-center items-center px-6 py-3 bg-black text-white font-medium rounded-md hover:bg-gray-800 transition-colors ${isAddingToCart ? 'opacity-70 cursor-not-allowed' : ''}`}
              onClick={handleAddToCart}
              disabled={isAddingToCart || !product.stock || product.stock <= 0}
            >
              {isAddingToCart ? (
                <span className="flex items-center">
                  <svg className="animate-spin -ml-1 mr-2 h-4 w-4 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                    <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                    <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                  </svg>
                  Adding...
                </span>
              ) : 'Add to Cart'}
            </button>
            
            <button
              className="px-6 py-3 border border-black text-black font-medium rounded-md hover:bg-gray-100 transition-colors"
              onClick={handleShopNow}
              disabled={!product.stock || product.stock <= 0}
            >
              Shop Now
            </button>
          </div>
        </div>
      </div>
      
      {/* Related/Featured Products Section */}
      <div className="mt-16 pt-8 border-t border-gray-200">
        {relatedProducts.length > 0 ? (
          <>
            <h2 className="text-2xl font-bold mb-6">Related Products</h2>
            {/* Carousel on mobile, 3-column grid on desktop */}
            <div className="relative">
              {/* Scroll arrows for mobile carousel - only visible on mobile */}
              <div className="md:hidden absolute -left-3 top-1/2 transform -translate-y-1/2 z-10">
                <button 
                  onClick={() => {
                    const container = document.getElementById('related-products-carousel');
                    if (container) container.scrollBy({ left: -300, behavior: 'smooth' });
                  }}
                  className="bg-white shadow-md rounded-full p-2 focus:outline-none"
                  aria-label="Scroll left"
                >
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M15 18l-6-6 6-6" />
                  </svg>
                </button>
              </div>
              
              <div className="md:hidden absolute -right-3 top-1/2 transform -translate-y-1/2 z-10">
                <button 
                  onClick={() => {
                    const container = document.getElementById('related-products-carousel');
                    if (container) container.scrollBy({ left: 300, behavior: 'smooth' });
                  }}
                  className="bg-white shadow-md rounded-full p-2 focus:outline-none"
                  aria-label="Scroll right"
                >
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M9 18l6-6-6-6" />
                  </svg>
                </button>
              </div>
              
              {/* Products container: Carousel on mobile, grid on desktop */}
              <div 
                id="related-products-carousel"
                className="flex md:grid md:grid-cols-3 gap-6 overflow-x-auto md:overflow-visible pb-4 md:pb-0 snap-x snap-mandatory scrollbar-hide"
              >
                {relatedProducts.map((relatedProduct) => {
                  const relatedImg = relatedProduct.images && 
                    relatedProduct.images[0]?.image && 
                    typeof relatedProduct.images[0].image === 'object' && 
                    'url' in relatedProduct.images[0].image ? 
                    relatedProduct.images[0].image : null
                    
                  return (
                    <Link 
                      key={relatedProduct.id} 
                      href={`/products/${relatedProduct.slug}`}
                      className="group block min-w-[260px] md:min-w-0 snap-start"
                    >
                      <div className="aspect-square relative bg-gray-100 rounded-md overflow-hidden mb-3">
                        {hasImageUrl(relatedImg) ? (
                          <Image
                            src={`${baseUrl}${typeof relatedImg === 'object' && relatedImg !== null && 'url' in relatedImg ? relatedImg.url : ''}`}
                            alt={relatedProduct.title || 'Related product'}
                            fill
                            sizes="(max-width: 768px) 260px, (max-width: 1200px) 33vw, 25vw"
                            className="object-cover group-hover:scale-105 transition-transform duration-300"
                          />
                        ) : (
                          <div className="w-full h-full flex items-center justify-center text-gray-400">
                            <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1" strokeLinecap="round" strokeLinejoin="round">
                              <rect width="18" height="18" x="3" y="3" rx="2" ry="2" />
                              <circle cx="9" cy="9" r="2" />
                              <path d="m21 15-3.086-3.086a2 2 0 0 0-2.828 0L6 21" />
                            </svg>
                          </div>
                        )}
                      </div>
                      
                      <h3 className="font-medium text-lg group-hover:text-black transition-colors">
                        {relatedProduct.title}
                      </h3>
                      <p className="text-gray-600">
                        {relatedProduct.price && typeof relatedProduct.price === 'object' 
                          ? formatPrice(relatedProduct.price.value || 0, relatedProduct.price.currency || 'USD')
                          : 'Price unavailable'}
                      </p>
                    </Link>
                  )
                })}
              </div>
            </div>
          </>
        ) : featuredProducts.length > 0 ? (
          <>
            <h2 className="text-2xl font-bold mb-6">Featured Products</h2>
            {/* Carousel for Featured Products (both mobile and desktop) */}
            <div className="relative">
              {/* Scroll arrows for carousel */}
              <div className="absolute -left-3 top-1/2 transform -translate-y-1/2 z-10">
                <button 
                  onClick={() => {
                    const container = document.getElementById('featured-products-carousel');
                    if (container) container.scrollBy({ left: -300, behavior: 'smooth' });
                  }}
                  className="bg-white shadow-md rounded-full p-2 focus:outline-none"
                  aria-label="Scroll left"
                >
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M15 18l-6-6 6-6" />
                  </svg>
                </button>
              </div>
              
              <div className="absolute -right-3 top-1/2 transform -translate-y-1/2 z-10">
                <button 
                  onClick={() => {
                    const container = document.getElementById('featured-products-carousel');
                    if (container) container.scrollBy({ left: 300, behavior: 'smooth' });
                  }}
                  className="bg-white shadow-md rounded-full p-2 focus:outline-none"
                  aria-label="Scroll right"
                >
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M9 18l6-6-6-6" />
                  </svg>
                </button>
              </div>
              
              {/* Products container: Always carousel */}
              <div 
                id="featured-products-carousel"
                className="flex gap-6 overflow-x-auto pb-4 snap-x snap-mandatory scrollbar-hide"
              >
                {featuredProducts.map((featuredProduct) => {
                  const featuredImg = featuredProduct.images && 
                    featuredProduct.images[0]?.image && 
                    typeof featuredProduct.images[0].image === 'object' && 
                    'url' in featuredProduct.images[0].image ? 
                    featuredProduct.images[0].image : null
                    
                  return (
                    <Link 
                      key={featuredProduct.id} 
                      href={`/products/${featuredProduct.slug}`}
                      className="group block min-w-[260px] snap-start"
                    >
                      <div className="aspect-square relative bg-gray-100 rounded-md overflow-hidden mb-3">
                        {hasImageUrl(featuredImg) ? (
                          <Image
                            src={`${baseUrl}${typeof featuredImg === 'object' && featuredImg !== null && 'url' in featuredImg ? featuredImg.url : ''}`}
                            alt={featuredProduct.title || 'Featured product'}
                            fill
                            sizes="260px"
                            className="object-cover group-hover:scale-105 transition-transform duration-300"
                          />
                        ) : (
                          <div className="w-full h-full flex items-center justify-center text-gray-400">
                            <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1" strokeLinecap="round" strokeLinejoin="round">
                              <rect width="18" height="18" x="3" y="3" rx="2" ry="2" />
                              <circle cx="9" cy="9" r="2" />
                              <path d="m21 15-3.086-3.086a2 2 0 0 0-2.828 0L6 21" />
                            </svg>
                          </div>
                        )}
                      </div>
                      
                      <h3 className="font-medium text-lg group-hover:text-black transition-colors">
                        {featuredProduct.title}
                      </h3>
                      <p className="text-gray-600">
                        {featuredProduct.price && typeof featuredProduct.price === 'object' 
                          ? formatPrice(featuredProduct.price.value || 0, featuredProduct.price.currency || 'USD')
                          : 'Price unavailable'}
                      </p>
                    </Link>
                  )
                })}
              </div>
            </div>
          </>
        ) : (
          <>
            <h2 className="text-2xl font-bold mb-6">Explore More Products</h2>
            <p className="text-gray-600 mb-4">
              Check out our other products in the <Link href="/products" className="text-black underline">shop</Link>.
            </p>
          </>
        )}
      </div>
    </div>
  )
}

export default ProductDetailClient
