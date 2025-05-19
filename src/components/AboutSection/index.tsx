'use client'

import React from 'react'
import Link from 'next/link'
import { ArrowRight } from 'lucide-react'

interface AboutSectionProps {
  aboutPage?: {
    title?: string
    slug?: string
    description?: string
  } | null
}

export const AboutSection: React.FC<AboutSectionProps> = ({ aboutPage }) => {
  // If no about page is provided, use placeholder content
  const title = aboutPage?.title || 'About Us'
  const slug = aboutPage?.slug || 'about'
  const description = aboutPage?.description || 
    'Welcome to our store! We are dedicated to providing high-quality products and exceptional service to our customers. Our mission is to create a seamless shopping experience and help you find exactly what you need. Learn more about our story, our team, and our commitment to quality and sustainability.'

  return (
    <section className="w-full py-16">
      <div className="container mx-auto px-4">
        <div className="max-w-4xl mx-auto bg-white rounded-lg shadow-md p-8">
          <h2 className="text-3xl font-bold mb-6 text-center">{title}</h2>
          <p className="text-lg text-gray-700 mb-8 text-center">
            {description}
          </p>
          <div className="flex justify-center">
            <Link 
              href={`/${slug}`} 
              className="inline-flex items-center px-6 py-3 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors"
            >
              Read More <ArrowRight className="ml-2 h-4 w-4" />
            </Link>
          </div>
        </div>
      </div>
    </section>
  )
} 