// Determine the appropriate GraphQL API URL based on environment
const getGraphQLApiURL = () => {
  // Special handling for Vercel builds
  if (process.env.VERCEL_URL) {
    return `https://${process.env.VERCEL_URL}`;
  }
  
  // Special handling for local build process, should be mocked/skipped
  if (process.env.NEXT_BUILD === 'true') {
    return process.env.NEXT_PUBLIC_SERVER_URL || `http://127.0.0.1:${process.env.PORT || 3000}`;
  }
  
  // Default to the public server URL
  return process.env.NEXT_PUBLIC_SERVER_URL;
};

export const GRAPHQL_API_URL = getGraphQLApiURL();
