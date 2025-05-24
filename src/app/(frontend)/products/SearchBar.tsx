import React, { useState, useEffect, useRef, useCallback } from 'react'
import Fuse from 'fuse.js'
import { Category, Product } from '@/payload-types'
import classes from './searchBar.module.scss'

interface SearchBarProps {
  onSearch: (searchTerm: string) => void
  initialValue?: string
  products: Product[]
  categories: Category[]
  isLoading?: boolean
  resetSearch?: boolean
}

interface SearchSuggestion {
  id: string
  text: string
  type: 'product' | 'category' | 'tag'
  originalData?: any
  highlightedText?: React.ReactNode
}

export const SearchBar: React.FC<SearchBarProps> = ({ 
  onSearch, 
  initialValue = '', 
  products, 
  categories, 
  isLoading = false,
  resetSearch = false
}) => {
  const [searchTerm, setSearchTerm] = useState(initialValue)
  const [isFocused, setIsFocused] = useState(false)
  const [suggestions, setSuggestions] = useState<SearchSuggestion[]>([])
  const [selectedSuggestionIndex, setSelectedSuggestionIndex] = useState(-1)
  const [isDebouncing, setIsDebouncing] = useState(false)
  const inputRef = useRef<HTMLInputElement>(null)
  const suggestionsRef = useRef<HTMLDivElement>(null)
  const debounceTimerRef = useRef<NodeJS.Timeout | null>(null)

  // Extract tags from products for search suggestions
  const extractTags = useCallback(() => {
    const allTags = new Set<string>()
    products.forEach(product => {
      if (product.tags && Array.isArray(product.tags)) {
        product.tags.forEach(tag => {
          if (typeof tag === 'string') {
            allTags.add(tag)
          }
        })
      }
    })
    return Array.from(allTags)
  }, [products])

  // Initialize Fuse.js instances for fuzzy search
  const productFuse = useRef<Fuse<Product>>(null!)
  const categoryFuse = useRef<Fuse<Category>>(null!)
  const tagFuse = useRef<Fuse<string>>(null!)

  // Setup Fuse.js instances on component mount or when data changes
  useEffect(() => {
    // Product search configuration
    productFuse.current = new Fuse(products, {
      keys: ['title', 'description'],
      threshold: 0.3,
      includeScore: true,
      minMatchCharLength: 2,
      ignoreLocation: true,
      useExtendedSearch: true,
    })

    // Category search configuration
    categoryFuse.current = new Fuse(categories, {
      keys: ['title'],
      threshold: 0.3,
      includeScore: true,
      minMatchCharLength: 2,
    })

    // Tag search configuration
    tagFuse.current = new Fuse(extractTags(), {
      threshold: 0.3,
      includeScore: true,
      minMatchCharLength: 2,
    })
  }, [products, categories, extractTags])

  // Reset search if parent component requests it
  useEffect(() => {
    if (resetSearch) {
      setSearchTerm('')
      setSuggestions([])
    }
  }, [resetSearch])

  // Handle outside clicks to close the suggestions dropdown
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (
        suggestionsRef.current && 
        !suggestionsRef.current.contains(event.target as Node) &&
        inputRef.current &&
        !inputRef.current.contains(event.target as Node)
      ) {
        setIsFocused(false)
      }
    }
    
    document.addEventListener('mousedown', handleClickOutside)
    return () => {
      document.removeEventListener('mousedown', handleClickOutside)
    }
  }, [])

  // Highlight matching text in suggestions
  const highlightMatch = (text: string, query: string): React.ReactNode => {
    if (!query.trim()) return text;
    
    const regex = new RegExp(`(${query.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')})`, 'gi');
    const parts = text.split(regex);
    
    return parts.map((part, index) => 
      regex.test(part) ? <strong key={index} className={classes.highlight}>{part}</strong> : part
    );
  };

  // Generate search suggestions based on user input
  const generateSuggestions = useCallback((value: string) => {
    if (!value.trim()) {
      setSuggestions([]);
      return;
    }
    
    setIsDebouncing(true);
    
    // Debounce the search to improve performance
    if (debounceTimerRef.current) {
      clearTimeout(debounceTimerRef.current);
    }
    
    debounceTimerRef.current = setTimeout(() => {
      // Search in products
      const productResults = productFuse.current.search(value, { limit: 5 }).map(result => ({
        id: String(result.item.id),
        text: result.item.title || 'Untitled Product',
        type: 'product' as const,
        originalData: result.item,
        highlightedText: highlightMatch(result.item.title || 'Untitled Product', value)
      }));
      
      // Search in categories
      const categoryResults = categoryFuse.current.search(value, { limit: 3 }).map(result => ({
        id: String(result.item.id),
        text: result.item.title || 'Untitled Category',
        type: 'category' as const,
        originalData: result.item,
        highlightedText: highlightMatch(result.item.title || 'Untitled Category', value)
      }));
      
      // Search in tags
      const tagResults = tagFuse.current.search(value, { limit: 3 }).map(result => ({
        id: `tag-${result.item}`,
        text: result.item,
        type: 'tag' as const,
        highlightedText: highlightMatch(result.item, value)
      }));
      
      // Combine and limit results
      const combinedResults = [...productResults, ...categoryResults, ...tagResults];
      setSuggestions(combinedResults);
      setIsDebouncing(false);
      
      // Reset selected index when suggestions change
      setSelectedSuggestionIndex(-1);
    }, 300); // 300ms debounce delay
  }, []);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const value = e.target.value;
    setSearchTerm(value);
    generateSuggestions(value);
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSearch(searchTerm);
    setIsFocused(false);
  };

  const handleSuggestionClick = (suggestion: SearchSuggestion) => {
    setSearchTerm(suggestion.text);
    onSearch(suggestion.text);
    setIsFocused(false);
  };

  // Handle keyboard navigation in the suggestion list
  const handleKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
    // If there are no suggestions, don't do anything special
    if (suggestions.length === 0) return;
    
    switch (e.key) {
      case 'ArrowDown':
        e.preventDefault();
        setSelectedSuggestionIndex(prev => 
          prev < suggestions.length - 1 ? prev + 1 : prev
        );
        break;
        
      case 'ArrowUp':
        e.preventDefault();
        setSelectedSuggestionIndex(prev => 
          prev > 0 ? prev - 1 : prev
        );
        break;
        
      case 'Enter':
        if (selectedSuggestionIndex >= 0 && selectedSuggestionIndex < suggestions.length) {
          e.preventDefault();
          const selectedSuggestion = suggestions[selectedSuggestionIndex];
          handleSuggestionClick(selectedSuggestion);
        }
        break;
        
      case 'Escape':
        e.preventDefault();
        setIsFocused(false);
        break;
    }
  };

  return (
    <div className={classes.searchContainer}>
      <form onSubmit={handleSubmit} className={classes.searchForm}>
        <input
          ref={inputRef}
          type="text"
          value={searchTerm}
          onChange={handleInputChange}
          onFocus={() => setIsFocused(true)}
          onKeyDown={handleKeyDown}
          placeholder="Introduce your search term"
          className={classes.searchInput}
          aria-label="Search products"
          autoComplete="off"
        />
        <button type="submit" className={classes.searchButton} aria-label="Submit search">
          {isDebouncing || isLoading ? (
            <div className={classes.loadingSpinner}></div>
          ) : (
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <circle cx="11" cy="11" r="8"></circle>
              <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
            </svg>
          )}
        </button>
      </form>
      
      {isFocused && (
        <div ref={suggestionsRef} className={classes.suggestionsContainer} role="listbox" aria-label="Search suggestions">
          {suggestions.length > 0 ? suggestions.map((suggestion, index) => (
            <div 
              key={suggestion.id}
              className={`${classes.suggestionItem} ${index === selectedSuggestionIndex ? classes.selectedSuggestion : ''}`}
              onClick={() => handleSuggestionClick(suggestion)}
              role="option"
              aria-selected={index === selectedSuggestionIndex}
              tabIndex={-1}
            >
              {/* Icon based on suggestion type */}
              {suggestion.type === 'product' ? (
                <svg className={classes.suggestionIcon} xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                  <rect width="18" height="18" x="3" y="3" rx="2" ry="2" />
                  <line x1="3" y1="9" x2="21" y2="9" />
                  <line x1="9" y1="21" x2="9" y2="9" />
                </svg>
              ) : suggestion.type === 'category' ? (
                <svg className={classes.suggestionIcon} xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                  <path d="M3 5H21" />
                  <path d="M3 12H21" />
                  <path d="M3 19H21" />
                </svg>
              ) : (
                <svg className={classes.suggestionIcon} xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                  <path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z" />
                  <line x1="7" y1="7" x2="7.01" y2="7" />
                </svg>
              )}
              
              <div className={classes.suggestionContent}>
                <span className={classes.suggestionText}>
                  {suggestion.highlightedText || suggestion.text}
                </span>
                <span className={classes.suggestionType}>
                  {suggestion.type === 'product' ? 'Product' : 
                   suggestion.type === 'category' ? 'Category' : 'Tag'}
                </span>
              </div>
            </div>
          )) : searchTerm.trim().length > 0 && (
            <div className={classes.noResults}>
              <p>No matches found for "{searchTerm}"</p>
              <p className={classes.noResultsTip}>Try a different keyword or filter</p>
            </div>
          )}
        </div>
      )}
    </div>
  )
}
