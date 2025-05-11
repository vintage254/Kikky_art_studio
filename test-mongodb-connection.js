const { MongoClient } = require('mongodb');
const fs = require('fs');
const path = require('path');

// Original connection string
const uri = 'mongodb+srv://kikkyart:oS2Kk7Q6LX5cnIoP@kikky.1sabmza.mongodb.net/?retryWrites=true&w=majority&appName=kikky';

async function testConnection() {
  const client = new MongoClient(uri, {
    useUnifiedTopology: true,
    ssl: true,
    tls: true,
    tlsAllowInvalidCertificates: true,
    tlsAllowInvalidHostnames: true,
    // Force TLS version to 1.2 which is more widely supported
    tlsCAFile: require('path').join(__dirname, 'rds-combined-ca-bundle.pem')
  });

  try {
    console.log('Attempting to connect to MongoDB Atlas...');
    await client.connect();
    
    console.log('Successfully connected to MongoDB Atlas!');
    
    // List the databases
    const adminDb = client.db('admin');
    const dbs = await adminDb.admin().listDatabases();
    
    console.log('Available databases:');
    dbs.databases.forEach(db => {
      console.log(`- ${db.name}`);
    });
    
    return 'Connection successful!';
  } catch (err) {
    console.error('Connection failed');
    console.error('Error details:', err);
    
    // Let's try an alternative connection approach
    console.log('\nTrying alternative connection method...');
    return tryAlternativeConnection();
  } finally {
    // Close the connection
    try {
      await client.close();
      console.log('Connection closed');
    } catch (err) {
      console.log('Error closing connection:', err.message);
    }
  }
}

// Try a different connection approach
async function tryAlternativeConnection() {
  // Try connecting with different options
  const altClient = new MongoClient(uri, {
    useUnifiedTopology: true,
    ssl: true,
    tls: true,
    tlsInsecure: true, // Less secure but might work for testing
  });

  try {
    console.log('Attempting alternative connection...');
    await altClient.connect();
    console.log('Alternative connection successful!');
    return 'Alternative connection succeeded!';
  } catch (altErr) {
    console.error('Alternative connection also failed');
    console.error('Alternative error details:', altErr);
    return `All connection attempts failed: ${altErr.message}`;
  } finally {
    try {
      await altClient.close();
      console.log('Alternative connection closed');
    } catch (err) {
      // Ignore error
    }
  }
}

// Create the CA file needed for TLS connections
function setupCAFile() {
  const caFilePath = path.join(__dirname, 'rds-combined-ca-bundle.pem');
  
  // Only create the file if it doesn't exist
  if (!fs.existsSync(caFilePath)) {
    console.log('Creating CA bundle file for TLS connection...');
    // Empty CA file for testing
    fs.writeFileSync(caFilePath, '');
    console.log('CA bundle file created');
  }
}

// Setup CA file and run the test
setupCAFile();
testConnection()
  .then(console.log)
  .catch(console.error); 