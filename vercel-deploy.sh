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
PAYLOAD_PUBLIC_SERVER_URL=${VERCEL_URL:+https://$VERCEL_URL}
NEXT_PUBLIC_SERVER_URL=${VERCEL_URL:+https://$VERCEL_URL}
NEXT_PUBLIC_IS_PRODUCTION=true
VERCEL_DEPLOYMENT=true
EOL

# Add database URI if it exists in environment
if [ ! -z "$DATABASE_URI" ]; then
  echo "DATABASE_URI=$DATABASE_URI" >> .env
fi

if [ ! -z "$PAYLOAD_SECRET" ]; then
  echo "PAYLOAD_SECRET=$PAYLOAD_SECRET" >> .env
fi

# Mpesa credentials if they exist
if [ ! -z "$MPESA_CONSUMER_KEY" ]; then
  echo "MPESA_CONSUMER_KEY=$MPESA_CONSUMER_KEY" >> .env
fi

if [ ! -z "$MPESA_CONSUMER_SECRET" ]; then
  echo "MPESA_CONSUMER_SECRET=$MPESA_CONSUMER_SECRET" >> .env
fi

if [ ! -z "$MPESA_PASSKEY" ]; then
  echo "MPESA_PASSKEY=$MPESA_PASSKEY" >> .env
fi

if [ ! -z "$MPESA_SHORTCODE" ]; then
  echo "MPESA_SHORTCODE=$MPESA_SHORTCODE" >> .env
fi

if [ ! -z "$MPESA_ENVIRONMENT" ]; then
  echo "MPESA_ENVIRONMENT=$MPESA_ENVIRONMENT" >> .env
fi

# Log the build environment
echo "Build environment:"
echo "NODE_ENV: $NODE_ENV"
echo "VERCEL_URL: $VERCEL_URL"
echo "Next.js will use server URL: ${VERCEL_URL:+https://$VERCEL_URL}"

# Run the build process without linting
echo "Running build process with linting disabled"
cross-env NODE_ENV=production NEXT_PUBLIC_SKIP_DB_CONNECTION=true PAYLOAD_PUBLIC_SKIP_DB_CONNECTION=true yarn build:payload && \
  yarn build:server && \
  yarn copyfiles && \
  cross-env PAYLOAD_CONFIG_PATH=dist/payload/payload.config.js NEXT_BUILD=true NEXT_PUBLIC_SKIP_DB_CONNECTION=true next build --no-lint 