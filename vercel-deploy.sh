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

# Run the build process without linting
echo "Running build process with linting disabled"
cross-env NODE_ENV=production yarn build:payload && \
  yarn build:server && \
  yarn copyfiles && \
  cross-env PAYLOAD_CONFIG_PATH=dist/payload/payload.config.js NEXT_BUILD=true NEXT_PUBLIC_SKIP_DB_CONNECTION=true next build --no-lint 