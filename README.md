# Kikky Art Studio E-commerce Website

A fully-featured e-commerce platform for Kikky Art Studio, built with Payload CMS and Next.js. This application provides a complete solution for selling art products online with an enterprise-grade admin panel and a beautifully designed, production-ready website.

## About Kikky Art Studio

Kikky Art Studio is a premium art retailer offering unique and beautiful art pieces to customers worldwide. This e-commerce platform has been custom-built to showcase and sell the studio's artwork through a seamless online shopping experience.

## Core Features:

- [Complete E-commerce Solution](#e-commerce-features)
- [Product Management](#product-management)
- [Shopping Cart & Checkout](#shopping-cart--checkout)
- [Order Processing](#order-processing)
- [Stripe Integration](#stripe-integration)
- [User Authentication](#users-authentication)
- [Access Control](#access-control)
- [Layout Builder](#layout-builder)
- [Draft Preview](#draft-preview)
- [Live Preview](#live-preview)
- [On-demand Revalidation](#on-demand-revalidation)
- [SEO Optimization](#seo)
- [Search Functionality](#search)
- [Multi-currency Support](#multi-currency-support)

## Development Setup

To set up the Kikky Art Studio website locally for development, follow these steps:

### Prerequisites

- Node.js (v18.20.2 or >=20.9.0)
- PNPM (v9 or v10)
- PostgreSQL database

### Installation

1. Clone the repository
2. Set up environment variables
   ```bash
   cp .env.example .env
   ```
3. Update the `.env` file with your database credentials and Stripe API keys
4. Install dependencies
   ```bash
   pnpm install
   ```
5. Start the development server
   ```bash
   pnpm dev
   ```
6. Open `http://localhost:3000` in your browser

### Development

1. First [clone the repo](#clone) if you have not done so already
1. `cd my-project && cp .env.example .env` to copy the example environment variables
1. `pnpm install && pnpm dev` to install dependencies and start the dev server
1. open `http://localhost:3000` to open the app in your browser

That's it! Changes made in `./src` will be reflected in your app. Follow the on-screen instructions to login and create your first admin user. Then check out [Production](#production) once you're ready to build and serve your app, and [Deployment](#deployment) when you're ready to go live.

## How it works

The Payload config is tailored specifically to the needs of most websites. It is pre-configured in the following ways:

## E-commerce Features

The Kikky Art Studio website includes a comprehensive set of e-commerce features:

### Product Management

- **Products Collection**: Fully-featured product management with support for title, description, pricing, images, inventory, and SKUs
- **Multi-currency Support**: Support for multiple currencies including USD, EUR, KES (Kenyan Shilling), GBP, JPY, and CAD
- **Categories**: Organize products into browsable categories with featured images
- **Featured Products**: Highlight special products on the homepage and collection pages
- **Stock Management**: Track inventory levels with optional display of stock status

### Shopping Cart & Checkout

- **Cart Management**: Add, update, and remove items from shopping cart
- **Secure Checkout**: Streamlined checkout process with Stripe integration
- **Order History**: Users can view their order history and status

### Collections

- #### Products
  Manage the art products available in the store with details like title, description, price, images, stock level, and SKU.

- #### Orders
  Track and manage customer orders with order details, status, payment information, and fulfillment tracking.

- #### Users (Authentication)
  Users can create accounts to track orders and save shipping information. Admin users have access to the admin panel and can manage products, orders, and content.

- #### Carts
  Shopping cart functionality for tracking items before checkout.

- #### Posts
  Share news, updates, and articles about the art studio and products. All posts use the layout builder for flexible content design.

- #### Pages
  Create custom pages with the layout builder to showcase information about the studio, art processes, or special collections.

- #### Media
  Manage all images and other media files for products, posts, pages, and categories.

- #### Categories
  Organize products into browsable categories to help customers find art pieces that match their interests.

### Globals

See the [Globals](https://payloadcms.com/docs/configuration/globals) docs for details on how to extend this functionality.

- `Header`

  The data required by the header on your front-end like nav links.

- `Footer`

  Same as above but for the footer of your site.

## Access control

Basic access control is setup to limit access to various content based based on publishing status.

- `users`: Users can access the admin panel and create or edit content.
- `posts`: Everyone can access published posts, but only users can create, update, or delete them.
- `pages`: Everyone can access published pages, but only users can create, update, or delete them.

For more details on how to extend this functionality, see the [Payload Access Control](https://payloadcms.com/docs/access-control/overview#access-control) docs.

## Layout Builder

Create unique page layouts for any type of content using a powerful layout builder. This template comes pre-configured with the following layout building blocks:

- Hero
- Content
- Media
- Call To Action
- Archive

Each block is fully designed and built into the front-end website that comes with this template. See [Website](#website) for more details.

## Lexical editor

A deep editorial experience that allows complete freedom to focus just on writing content without breaking out of the flow with support for Payload blocks, media, links and other features provided out of the box. See [Lexical](https://payloadcms.com/docs/rich-text/overview) docs.

## Draft Preview

All posts and pages are draft-enabled so you can preview them before publishing them to your website. To do this, these collections use [Versions](https://payloadcms.com/docs/configuration/collections#versions) with `drafts` set to `true`. This means that when you create a new post, project, or page, it will be saved as a draft and will not be visible on your website until you publish it. This also means that you can preview your draft before publishing it to your website. To do this, we automatically format a custom URL which redirects to your front-end to securely fetch the draft version of your content.

Since the front-end of this template is statically generated, this also means that pages, posts, and projects will need to be regenerated as changes are made to published documents. To do this, we use an `afterChange` hook to regenerate the front-end when a document has changed and its `_status` is `published`.

For more details on how to extend this functionality, see the official [Draft Preview Example](https://github.com/payloadcms/payload/tree/examples/draft-preview).

## Live preview

In addition to draft previews you can also enable live preview to view your end resulting page as you're editing content with full support for SSR rendering. See [Live preview docs](https://payloadcms.com/docs/live-preview/overview) for more details.

## On-demand Revalidation

We've added hooks to collections and globals so that all of your pages, posts, or footer or header, change they will automatically be updated in the frontend via on-demand revalidation supported by Nextjs.

> Note: if an image has been changed, for example it's been cropped, you will need to republish the page it's used on in order to be able to revalidate the Nextjs image cache.

## SEO

This template comes pre-configured with the official [Payload SEO Plugin](https://payloadcms.com/docs/plugins/seo) for complete SEO control from the admin panel. All SEO data is fully integrated into the front-end website that comes with this template. See [Website](#website) for more details.

## Search

This template also pre-configured with the official [Payload Search Plugin](https://payloadcms.com/docs/plugins/search) to showcase how SSR search features can easily be implemented into Next.js with Payload. See [Website](#website) for more details.

## Redirects

If you are migrating an existing site or moving content to a new URL, you can use the `redirects` collection to create a proper redirect from old URLs to new ones. This will ensure that proper request status codes are returned to search engines and that your users are not left with a broken link. This template comes pre-configured with the official [Payload Redirects Plugin](https://payloadcms.com/docs/plugins/redirects) for complete redirect control from the admin panel. All redirects are fully integrated into the front-end website that comes with this template. See [Website](#website) for more details.

## Jobs and Scheduled Publish

We have configured [Scheduled Publish](https://payloadcms.com/docs/versions/drafts#scheduled-publish) which uses the [jobs queue](https://payloadcms.com/docs/jobs-queue/jobs) in order to publish or unpublish your content on a scheduled time. The tasks are run on a cron schedule and can also be run as a separate instance if needed.

> Note: When deployed on Vercel, depending on the plan tier, you may be limited to daily cron only.

## Website & User Interface

The Kikky Art Studio website features a beautifully designed, production-ready front-end built with Next.js, offering a premium shopping experience for art enthusiasts.

### Frontend Features

- **Modern UI/UX**: Elegant, responsive design optimized for showcasing art products
- **Product Galleries**: High-quality image galleries with zoom functionality
- **Category Browsing**: Intuitive navigation through art categories
- **User Accounts**: Customer registration, login, and profile management
- **Shopping Cart**: Seamless cart experience with real-time updates
- **Checkout Process**: Streamlined, secure checkout with Stripe integration
- **Search Functionality**: Advanced search capabilities to find specific art pieces
- **Dark/Light Mode**: Support for user preference on theme
- **Responsive Design**: Optimized for all device sizes

### Technical Stack

- [Next.js App Router](https://nextjs.org) for frontend routing and rendering
- [Payload CMS](https://payloadcms.com) for content and product management
- [TypeScript](https://www.typescriptlang.org) for type-safe code
- [TailwindCSS](https://tailwindcss.com/) for styling
- [shadcn/ui components](https://ui.shadcn.com/) for UI elements
- [Stripe](https://stripe.com) for payment processing
- [PostgreSQL](https://www.postgresql.org/) for database storage

### Cache

Although Next.js includes a robust set of caching strategies out of the box, Payload Cloud proxies and caches all files through Cloudflare using the [Official Cloud Plugin](https://www.npmjs.com/package/@payloadcms/payload-cloud). This means that Next.js caching is not needed and is disabled by default. If you are hosting your app outside of Payload Cloud, you can easily reenable the Next.js caching mechanisms by removing the `no-store` directive from all fetch requests in `./src/app/_api` and then removing all instances of `export const dynamic = 'force-dynamic'` from pages files, such as `./src/app/(pages)/[slug]/page.tsx`. For more details, see the official [Next.js Caching Docs](https://nextjs.org/docs/app/building-your-application/caching).

## Development

To spin up this example locally, follow the [Quick Start](#quick-start). Then [Seed](#seed) the database with a few pages, posts, and projects.

### Working with Postgres

Postgres and other SQL-based databases follow a strict schema for managing your data. In comparison to our MongoDB adapter, this means that there's a few extra steps to working with Postgres.

Note that often times when making big schema changes you can run the risk of losing data if you're not manually migrating it.

#### Local development

Ideally we recommend running a local copy of your database so that schema updates are as fast as possible. By default the Postgres adapter has `push: true` for development environments. This will let you add, modify and remove fields and collections without needing to run any data migrations.

If your database is pointed to production you will want to set `push: false` otherwise you will risk losing data or having your migrations out of sync.

#### Migrations

[Migrations](https://payloadcms.com/docs/database/migrations) are essentially SQL code versions that keeps track of your schema. When deploy with Postgres you will need to make sure you create and then run your migrations.

Locally create a migration

```bash
pnpm payload migrate:create
```

This creates the migration files you will need to push alongside with your new configuration.

On the server after building and before running `pnpm start` you will want to run your migrations

```bash
pnpm payload migrate
```

This command will check for any migrations that have not yet been run and try to run them and it will keep a record of migrations that have been run in the database.

### Docker

Alternatively, you can use [Docker](https://www.docker.com) to spin up this template locally. To do so, follow these steps:

1. Follow [steps 1 and 2 from above](#development), the docker-compose file will automatically use the `.env` file in your project root
1. Next run `docker-compose up`
1. Follow [steps 4 and 5 from above](#development) to login and create your first admin user

That's it! The Docker instance will help you get up and running quickly while also standardizing the development environment across your teams.

### Seed

To seed the database with a few pages, posts, and projects you can click the 'seed database' link from the admin panel.

The seed script will also create a demo user for demonstration purposes only:

- Demo Author
  - Email: `demo-author@payloadcms.com`
  - Password: `password`

> NOTICE: seeding the database is destructive because it drops your current database to populate a fresh one from the seed template. Only run this command if you are starting a new project or can afford to lose your current data.

## Production

To run Payload in production, you need to build and start the Admin panel. To do so, follow these steps:

1. Invoke the `next build` script by running `pnpm build` or `npm run build` in your project root. This creates a `.next` directory with a production-ready admin bundle.
1. Finally run `pnpm start` or `npm run start` to run Node in production and serve Payload from the `.build` directory.
1. When you're ready to go live, see Deployment below for more details.

### Stripe Integration

The Kikky Art Studio website integrates with Stripe for secure payment processing. Products in the store automatically sync with Stripe products and prices when configured with a valid Stripe API key.

## Multi-Currency Support

The platform supports multiple currencies to serve an international customer base:
- US Dollar ($)
- Euro (€)
- Kenyan Shilling (KSh)
- British Pound (£)
- Japanese Yen (¥)
- Canadian Dollar (CA$)

## Deployment

The Kikky Art Studio website can be deployed to various hosting platforms:

### Deploying to Vercel

This template can also be deployed to Vercel for free. You can get started by choosing the Vercel DB adapter during the setup of the template or by manually installing and configuring it:

```bash
pnpm add @payloadcms/db-vercel-postgres
```

```ts
// payload.config.ts
import { vercelPostgresAdapter } from '@payloadcms/db-vercel-postgres'

export default buildConfig({
  // ...
  db: vercelPostgresAdapter({
    pool: {
      connectionString: process.env.POSTGRES_URL || '',
    },
  }),
  // ...
```

We also support Vercel's blob storage:

```bash
pnpm add @payloadcms/storage-vercel-blob
```

```ts
// payload.config.ts
import { vercelBlobStorage } from '@payloadcms/storage-vercel-blob'

export default buildConfig({
  // ...
  plugins: [
    vercelBlobStorage({
      collections: {
        [Media.slug]: true,
      },
      token: process.env.BLOB_READ_WRITE_TOKEN || '',
    }),
  ],
  // ...
```

There is also a simplified [one click deploy](https://github.com/payloadcms/payload/tree/templates/with-vercel-postgres) to Vercel should you need it.

### Self-hosting

Before deploying your app, you need to:

1. Ensure your app builds and serves in production. See [Production](#production) for more details.
2. You can then deploy Payload as you would any other Node.js or Next.js application either directly on a VPS, DigitalOcean's Apps Platform, via Coolify or more. More guides coming soon.

You can also deploy your app manually, check out the [deployment documentation](https://payloadcms.com/docs/production/deployment) for full details.

## Questions

If you have any issues or questions, reach out to us on [Discord](https://discord.com/invite/payload) or start a [GitHub discussion](https://github.com/payloadcms/payload/discussions).
