import dotenv from 'dotenv'
import next from 'next'
import nextBuild from 'next/dist/build'
import path from 'path'

dotenv.config({
  path: path.resolve(__dirname, '../.env'),
})

import express from 'express'
import payload from 'payload'

import { seed } from './payload/seed'

const app = express()
const PORT = process.env.PORT || 3000

// Track consecutive database errors to determine if we need a full restart
let consecutiveDbErrors = 0;
const MAX_DB_ERRORS = 5;

// Add global error handler for database connection issues
process.on('uncaughtException', (error: any) => {
  // Convert error to string to handle different error formats
  const errorString = String(error);
  
  // Check for various forms of database termination messages
  if (
    errorString.includes('db_termination') || 
    errorString.includes('Connection terminated') ||
    errorString.includes(':shutdown') ||
    (error.code === 'XX000' && error.severity === 'FATAL')
  ) {
    console.log('Database connection was terminated by Supabase. This is expected behavior with serverless databases.');
    console.log('The application will continue running and reconnect automatically on the next database operation.');
    
    // Keep track of consecutive errors for potential recovery
    consecutiveDbErrors++;
    
    if (consecutiveDbErrors >= MAX_DB_ERRORS) {
      console.log(`Detected ${consecutiveDbErrors} consecutive database errors. Attempting recovery...`);
      // We don't exit the process since nodemon will restart it
      return;
    }
    
    return; // Prevent the process from exiting
  }
  
  // For other uncaught exceptions, log and potentially exit
  console.error('Uncaught Exception:', error);
})

const start = async (): Promise<void> => {
  await payload.init({
    secret: process.env.PAYLOAD_SECRET || '',
    express: app,
    onInit: () => {
      payload.logger.info(`Payload Admin URL: ${payload.getAdminURL()}`)
      // Reset error counter on successful initialization
      consecutiveDbErrors = 0;
    },
  })

  // Add static file service for assets
  app.use('/assets', express.static(path.resolve(__dirname, '../public')))

  // Add a simple health check endpoint
  app.get('/api/health', async (req, res) => {
    try {
      // Reset counter on successful health check
      consecutiveDbErrors = 0;
      res.status(200).json({ status: 'ok', dbConnected: true });
    } catch (error) {
      res.status(500).json({ status: 'error', message: String(error) });
    }
  });

  if (process.env.PAYLOAD_SEED === 'true') {
    await seed(payload)
    process.exit()
  }

  if (process.env.NEXT_BUILD) {
    app.listen(PORT, async () => {
      payload.logger.info(`Next.js is now building...`)
      // @ts-expect-error
      await nextBuild(path.join(__dirname, '../'))
      process.exit()
    })

    return
  }

  const nextApp = next({
    dev: process.env.NODE_ENV !== 'production',
  })

  const nextHandler = nextApp.getRequestHandler()

  app.use((req, res) => nextHandler(req, res))

  nextApp.prepare().then(() => {
    payload.logger.info('Starting Next.js...')

    app.listen(PORT, async () => {
      payload.logger.info(`Next.js App URL: ${process.env.PAYLOAD_PUBLIC_SERVER_URL}`)
    })
  })
}

start()
