import type { Metadata } from 'next'

import { RelatedPosts } from '@/blocks/RelatedPosts/Component'
import { PayloadRedirects } from '@/components/PayloadRedirects'
import { draftMode } from 'next/headers'
import React, { cache } from 'react'
import RichText from '@/components/RichText'

import type { Post } from '@/payload-types'

import { PostHero } from '@/heros/PostHero'
import { generateMeta } from '@/utilities/generateMeta'
import PageClient from './page.client'
import { LivePreviewListener } from '@/components/LivePreviewListener'
import { getPayload } from 'payload'
import configPromise from '@payload-config'

import pg from 'pg'; // This should use your aliased 'pg'
// Assuming standard module export from your alias for pg.Pool:
const { Pool } = pg;

export async function generateStaticParams() {
  console.log('[DEBUG] Attempting direct DB connection test in generateStaticParams for /posts/[slug]...');
  const dbUri = process.env.DATABASE_URI;

  if (!dbUri) {
    console.error('[DEBUG] DATABASE_URI environment variable is not set!');
    return [];
  }

  let safeDbUri = 'Could not parse DB_URI for safe logging';
  try {
    const url = new URL(dbUri);
    // Avoid logging user/password from the original URI string
    safeDbUri = `${url.protocol}//<credentials_hidden>@${url.host}${url.pathname}${url.search}`;
  } catch (e) {
    console.error('[DEBUG] Error parsing DATABASE_URI for safe logging:', e);
  }
  console.log(`[DEBUG] Using DATABASE_URI (host/path logged): ${safeDbUri}`);

  const testPool = new Pool({
    connectionString: dbUri,
    connectionTimeoutMillis: 15000, // Increased timeout for testing (15 seconds)
    ssl: { rejectUnauthorized: false } // For debugging SSL cert trust issues
  });

  try {
    console.log('[DEBUG] Attempting to connect to testPool...');
    const client = await testPool.connect();
    console.log('[DEBUG] Direct DB connection test SUCCEEDED!');
    
    const res = await client.query('SELECT NOW() AS now');
    console.log('[DEBUG] Query successful, current DB time:', res.rows[0].now);
    
    client.release();
    console.log('[DEBUG] Client released.');
  } catch (err: any) {
    console.error('[DEBUG] Direct DB connection test FAILED:');
    console.error(`[DEBUG] Error Name: ${err.name}`);
    console.error(`[DEBUG] Error Message: ${err.message}`);
    console.error(`[DEBUG] Error Code: ${err.code}`);
    console.error(`[DEBUG] Error Stack: ${err.stack}`);
  } finally {
    console.log('[DEBUG] Ending testPool (attempting to close).');
    await testPool.end();
    console.log('[DEBUG] testPool ended.');
  }

  console.log('[DEBUG] Returning empty array from generateStaticParams for /posts/[slug] after DB test.');
  return [];

  /* --- Original code - Keep this commented out for the test ---
  try {
    const payload = await getPayload({ config: configPromise });
    const posts = await payload.find({
      collection: 'posts',
      limit: 1000, // Fetch all posts to generate params
    });

    const params = posts.docs.map((post: Post) => ({
      slug: post.slug,
    }));
    
    return params || [];
  } catch (error) {
    console.error('Error generating static params for posts (original code):', error);
    return []; // Fallback to an empty array on error
  }
  */
}

type Args = {
  params: Promise<{
    slug?: string
  }>
}

export default async function Post({ params: paramsPromise }: Args) {
  const { isEnabled: draft } = await draftMode()
  const { slug = '' } = await paramsPromise
  const url = '/posts/' + slug
  const post = await queryPostBySlug({ slug })

  if (!post) return <PayloadRedirects url={url} />

  return (
    <article className="pt-16 pb-16">
      <PageClient />

      {/* Allows redirects for valid pages too */}
      <PayloadRedirects disableNotFound url={url} />

      {draft && <LivePreviewListener />}

      <PostHero post={post} />

      <div className="flex flex-col items-center gap-4 pt-8">
        <div className="container">
          <RichText className="max-w-[48rem] mx-auto" data={post.content} enableGutter={false} />
          {post.relatedPosts && Array.isArray(post.relatedPosts) && post.relatedPosts.length > 0 && (
            <RelatedPosts
              className="mt-12 max-w-[52rem] lg:grid lg:grid-cols-subgrid col-start-1 col-span-3 grid-rows-[2fr]"
              docs={post.relatedPosts.filter((relatedPost): relatedPost is Post => 
                typeof relatedPost === 'object' && relatedPost !== null
              )}
            />
          )}
        </div>
      </div>
    </article>
  )
}

export async function generateMetadata({ params: paramsPromise }: Args): Promise<Metadata> {
  const { slug = '' } = await paramsPromise
  const post = await queryPostBySlug({ slug })

  return generateMeta({ doc: post })
}

const queryPostBySlug = cache(async ({ slug }: { slug: string }) => {
  const { isEnabled: draft } = await draftMode()

  // Use direct Payload API call instead of API route for static generation
  try {
    const payload = await getPayload({ config: configPromise })
    
    const result = await payload.find({
      collection: 'posts',
      where: {
        slug: {
          equals: slug
        },
        _status: {
          equals: draft ? undefined : 'published'
        }
      },
      limit: 1,
      depth: 2
    })
    
    return result.docs?.[0] || null
  } catch (error) {
    console.error('Error fetching post:', error)
    return null
  }
})
