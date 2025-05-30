/**
 * Vercel-specific Tailwind CSS configuration
 * This file ensures Tailwind CSS is properly configured for Vercel deployments
 */

// Export a minimal Tailwind config that will work in any environment
module.exports = {
  content: [
    "./src/**/*.{js,ts,jsx,tsx}",
    "./app/**/*.{js,ts,jsx,tsx}",
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
};
