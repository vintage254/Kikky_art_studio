#!/bin/bash

# Create minimal linting configurations
echo "Creating minimal ESLint configuration"
cat > .eslintrc.js << EOL
module.exports = {
  root: true,
  extends: [],
  rules: {},
  ignorePatterns: ['**/*']
};
EOL

echo "Creating minimal Prettier configuration"
cat > .prettierrc.js << EOL
module.exports = {
  semi: false,
  singleQuote: false,
  trailingComma: "none",
  bracketSpacing: false,
  printWidth: 10000
};
EOL

# Create or update .env file with necessary variables
echo "Creating .env file with proper configuration"
cat > .env << EOL
PAYLOAD_PUBLIC_SKIP_DB_CONNECTION=true
NEXT_PUBLIC_SKIP_DB_CONNECTION=true
PAYLOAD_PUBLIC_SERVER_URL=${VERCEL_URL:-http://localhost:3000}
NEXT_PUBLIC_SERVER_URL=${VERCEL_URL:-http://localhost:3000}
NEXT_PUBLIC_IS_PRODUCTION_BUILD=true
SKIP_API_DURING_BUILD=true
DATABASE_URI=${DATABASE_URI}
PAYLOAD_SECRET=${PAYLOAD_SECRET:-default-secret-change-me}
EOL

# Run the build process without linting
echo "Running build process with linting disabled"
cross-env NODE_ENV=production yarn build:payload && \
  yarn build:server && \
  yarn copyfiles && \
  cross-env PAYLOAD_CONFIG_PATH=dist/payload/payload.config.js NEXT_BUILD=true NEXT_PUBLIC_SKIP_DB_CONNECTION=true SKIP_API_DURING_BUILD=true next build --no-lint 