'use client'

import React, { useState, useEffect } from 'react'
import Image from 'next/image'
import Link from 'next/link'
import { useSearchParams, useRouter } from 'next/navigation'
import { useHeaderTheme } from '@/providers/HeaderTheme'
import { Category, Product } from '@/payload-types'
import { getClientSideURL } from '@/utilities/getURL'
import { SearchBar } from './SearchBar'

// Define props for the ProductsClient component
interface ProductsClientProps {
  categories: Category[]
  products: Product[]
  pageTitle: string
  heroImage?: {
    url?: string
    alt?: string
  } | null
  tagline?: string
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

// Helper function to extract plain text from RichText content
const extractPlainText = (richText: any): string => {
  if (!richText || !richText.root || !richText.root.children) return ''
  
  let text = ''
  const traverse = (nodes: any[]) => {
    if (!nodes) return
    
    nodes.forEach(node => {
      if (node.text) {
        text += node.text
      }
      if (node.children) {
        traverse(node.children)
      }
    })
  }
  
  traverse(richText.root.children)
  return text
}

const ProductsClient: React.FC<ProductsClientProps> = ({ categories, products, pageTitle, heroImage, tagline }) => {
  const [selectedCategory, setSelectedCategory] = useState<string | number>('all')
  const [searchTerm, setSearchTerm] = useState('')
  const [filteredProducts, setFilteredProducts] = useState<Product[]>(products)
  const { setHeaderTheme } = useHeaderTheme()
  const baseUrl = getClientSideURL()
  const searchParams = useSearchParams()
  const router = useRouter()
  
  // Set header theme to light on mount
  useEffect(() => {
    setHeaderTheme('light')
  }, [setHeaderTheme])
  
  // Initialize from URL params if any
  useEffect(() => {
    const categoryParam = searchParams.get('category')
    const searchParam = searchParams.get('search')
    
    if (categoryParam) {
      setSelectedCategory(categoryParam)
    }
    
    if (searchParam) {
      setSearchTerm(searchParam)
    }
  }, [searchParams])

  // Filter products when selected category or search term changes
  useEffect(() => {
    let filtered = [...products]
    
    // Apply category filter if not 'all'
    if (selectedCategory !== 'all') {
      filtered = filtered.filter(product => {
        const category = product.category
        if (typeof category === 'object' && category !== null) {
          return String(category.id) === String(selectedCategory)
        }
        return false
      })
    }
    
    // Apply search filter if search term exists
    if (searchTerm.trim()) {
      const searchLower = searchTerm.toLowerCase()
      filtered = filtered.filter(product => {
        // Search in title
        if (product.title && product.title.toLowerCase().includes(searchLower)) {
          return true
        }
        
        // Search in description
        const descriptionText = extractPlainText(product.description)
        if (descriptionText.toLowerCase().includes(searchLower)) {
          return true
        }
        
        // Search in category name
        const category = product.category
        if (typeof category === 'object' && category !== null && category.title) {
          if (category.title.toLowerCase().includes(searchLower)) {
            return true
          }
        }
        
        return false
      })
    }
    
    setFilteredProducts(filtered)
    
    // Update URL with filters
    const params = new URLSearchParams()
    if (selectedCategory !== 'all') {
      params.set('category', String(selectedCategory))
    }
    if (searchTerm.trim()) {
      params.set('search', searchTerm)
    }
    
    const newUrl = `/products${params.toString() ? '?' + params.toString() : ''}`
    router.replace(newUrl, { scroll: false })
    
  }, [selectedCategory, searchTerm, products, router])
  
  // Track loading state for search operations
  const [isSearchLoading, setIsSearchLoading] = useState(false)
  const [resetSearchInput, setResetSearchInput] = useState(false)
  
  // Handle search input with debouncing
  const handleSearch = (term: string) => {
    setIsSearchLoading(true)
    setSearchTerm(term)
    // Simulate slight delay for better UX
    setTimeout(() => {
      setIsSearchLoading(false)
    }, 300)
  }
  
  // Reset search when category is set to 'all'
  useEffect(() => {
    if (selectedCategory === 'all') {
      setResetSearchInput(true)
      if (searchTerm) {
        setSearchTerm('')
      }
      // Reset the flag after a brief delay
      setTimeout(() => {
        setResetSearchInput(false)
      }, 100)
    }
  }, [selectedCategory, searchTerm])

  return (
    <div className="products-page" id="products">
      
      {/* Enhanced Search Bar */}
      <div className="mb-8">
        <SearchBar 
          onSearch={handleSearch} 
          initialValue={searchTerm} 
          products={products}
          categories={categories}
          isLoading={isSearchLoading}
          resetSearch={resetSearchInput}
        />
      </div>
      
      {/* Category Filter - Desktop version (hidden on mobile) */}
      <div className="mb-12 border-b border-gray-200 hidden md:block">
        <div className="flex flex-wrap gap-2 md:gap-8">
          <button
            className={`category-btn pb-2 px-1 text-sm uppercase tracking-wider ${
              selectedCategory === 'all' 
                ? 'border-b-2 border-black font-semibold' 
                : 'text-gray-500 hover:text-black'
            }`}
            onClick={() => setSelectedCategory('all')}
          >
            ALL
          </button>
          
          {categories.map((category) => (
            <button
              key={category.id}
              className={`category-btn pb-2 px-1 text-sm uppercase tracking-wider ${
                String(selectedCategory) === String(category.id) 
                  ? 'border-b-2 border-black font-semibold' 
                  : 'text-gray-500 hover:text-black'
              }`}
              onClick={() => setSelectedCategory(String(category.id))}
            >
              {category.title}
            </button>
          ))}
        </div>
      </div>
      
      {/* Category Filter - Mobile Dropdown (visible only on mobile) */}
      <div className="mb-8 md:hidden">
        <div className="relative">
          <select 
            className="w-full p-3 border border-gray-200 rounded-md appearance-none bg-white text-sm uppercase tracking-wider"
            value={selectedCategory}
            onChange={(e) => setSelectedCategory(e.target.value)}
            aria-label="Category Filter"
          >
            <option value="all">All Categories</option>
            {categories.map((category) => (
              <option key={category.id} value={category.id}>
                {category.title}
              </option>
            ))}
          </select>
          <div className="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">
            <svg className="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 9l-7 7-7-7"></path>
            </svg>
          </div>
        </div>
      </div>
      
      {/* Products Grid - Inspired by Image 1 */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8">
        {filteredProducts.map((product) => {
          // Get the first image from the product's images array
          const productImage = product.images && product.images[0]?.image
          const hasImage = hasImageUrl(productImage)
          
          // Get the product description as plain text
          const description = extractPlainText(product.description)
          
          return (
            <Link 
              key={product.id} 
              href={`/products/${product.slug}`}
              className="product-card border border-gray-200 rounded overflow-hidden hover:shadow-md transition-shadow group"
            >
              {/* Product Image */}
              <div className="aspect-square relative bg-gray-100 overflow-hidden">
                {hasImage ? (
                  <Image
                    src={`${baseUrl}${typeof productImage === 'object' && productImage !== null && 'url' in productImage ? productImage.url : ''}`}
                    alt={product.title || 'Product image'}
                    fill
                    sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
                    className="object-cover group-hover:scale-105 transition-transform duration-300"
                    priority={false}
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
              
              {/* Product Information */}
              <div className="p-4">
                <div className="flex items-start justify-between gap-2 mb-2">
                  <h2 className="text-lg font-medium">{product.title}</h2>
                  {product.price && (
                    <span className="text-sm font-semibold">
                      {formatPrice(product.price.value, product.price.currency)}
                    </span>
                  )}
                </div>
                
                {description && (
                  <p className="text-sm text-gray-600 line-clamp-2 mb-3">
                    {description}
                  </p>
                )}
                
                <div className="mt-auto">
                  <span className="text-sm font-medium text-black hover:underline inline-block">
                    Read More
                  </span>
                </div>
              </div>
            </Link>
          )
        })}
      </div>
      
      {/* Empty State */}
      {filteredProducts.length === 0 && (
        <div className="text-center py-16">
          <h3 className="text-xl font-medium mb-2">No products found</h3>
          <p className="text-gray-600">
            There are no products in this category. Please try another category or check back later.
          </p>
        </div>
      )}
    </div>
  )
}

export default ProductsClient
