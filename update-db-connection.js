// Update DB Connection - ES Module version
import dotenv from 'dotenv';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import pg from 'pg';

// Initialize dotenv
dotenv.config();

const { Client } = pg;
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Function to test a connection string
async function testConnection(connectionString) {
  const client = new Client({ connectionString });
  try {
    await client.connect();
    console.log('✅ Connection successful!');
    const result = await client.query('SELECT NOW() as time');
    console.log(`✅ Query executed at ${result.rows[0].time}`);
    return true;
  } catch (error) {
    console.error('❌ Connection failed:', error.message);
    return false;
  } finally {
    try {
      await client.end();
    } catch (err) {
      // Ignore errors when closing
    }
  }
}

// Function to convert a connection string to use the pooler endpoint
function convertToPoolerConnection(connectionString) {
  if (!connectionString) return '';
  
  // Skip if already using pooler
  if (connectionString.includes('-pooler')) {
    return connectionString;
  }
  
  // For Neon URLs, ensure we're using the pooler endpoint
  if (connectionString.includes('neon.tech')) {
    return connectionString.replace(/(@[^/]+\.neon\.tech)/, '$1-pooler');
  }
  
  return connectionString;
}

// Update the .env file with the new connection string
function updateEnvFile(newConnectionString) {
  const envPath = path.join(__dirname, '.env');
  
  try {
    let content = fs.readFileSync(envPath, 'utf8');
    
    // Replace the DATABASE_URI line
    if (content.includes('DATABASE_URI=')) {
      content = content.replace(
        /DATABASE_URI=.*/,
        `DATABASE_URI=${newConnectionString}`
      );
    } else {
      // Add it if it doesn't exist
      content += `\nDATABASE_URI=${newConnectionString}\n`;
    }
    
    fs.writeFileSync(envPath, content);
    console.log('✅ Updated .env file with pooler connection string');
    return true;
  } catch (error) {
    console.error('❌ Failed to update .env file:', error.message);
    return false;
  }
}

// Main function
async function main() {
  console.log('🔍 Testing database connection...');
  
  // Get current connection string
  const currentConnectionString = process.env.DATABASE_URI;
  
  if (!currentConnectionString) {
    console.error('❌ No DATABASE_URI found in .env file');
    return;
  }
  
  console.log('📊 Testing current connection string...');
  const currentWorks = await testConnection(currentConnectionString);
  
  if (currentWorks) {
    console.log('✅ Current connection string works fine!');
  } else {
    console.log('❌ Current connection string is not working.');
    
    // Try with pooler connection
    const poolerConnectionString = convertToPoolerConnection(currentConnectionString);
    
    if (poolerConnectionString === currentConnectionString) {
      console.log('⚠️ Already using the best connection string format.');
      return;
    }
    
    console.log('📊 Testing with Neon pooler endpoint...');
    const poolerWorks = await testConnection(poolerConnectionString);
    
    if (poolerWorks) {
      console.log('✅ Pooler connection string works!');
      
      // Update .env file
      const updated = updateEnvFile(poolerConnectionString);
      
      if (updated) {
        console.log('🎉 Success! Your database connection has been updated to use the Neon pooler endpoint.');
        console.log('👉 Restart your development server to apply the changes.');
      }
    } else {
      console.log('❌ Both connection strings failed. Please check your Neon database settings.');
    }
  }
}

// Run the script
main().catch(err => {
  console.error('Unexpected error:', err);
});
