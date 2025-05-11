const { MongoClient } = require('mongodb');

// Connection string with more options to fix TLS issues
const uri = 'mongodb+srv://kikkyart:oS2Kk7Q6LX5cnIoP@kikky.1sabmza.mongodb.net/?retryWrites=true&w=majority&appName=kikky&tlsInsecure=true';

async function testConnection() {
  console.log('Testing MongoDB connection...');
  console.log('Connection string:', uri);
  
  const client = new MongoClient(uri);

  try {
    console.log('Connecting to MongoDB Atlas...');
    await client.connect();
    console.log('Connected successfully to MongoDB Atlas!');
    
    const db = client.db('admin');
    const collections = await db.listCollections().toArray();
    console.log('Collections:', collections.map(c => c.name));
    
    return 'Connection test successful!';
  } catch (err) {
    console.error('Connection error:', err);
    
    // Print useful diagnostic information
    console.log('\n--- DIAGNOSTIC INFORMATION ---');
    console.log('Error name:', err.name);
    console.log('Error code:', err.code);
    console.log('Error message:', err.message);
    
    if (err.name === 'MongoServerSelectionError') {
      console.log('\nPOSSIBLE SOLUTIONS:');
      console.log('1. Check that your IP address is whitelisted in MongoDB Atlas');
      console.log('2. Verify your username and password are correct');
      console.log('3. Ensure the Atlas cluster is running and accessible');
      console.log('4. Try using a different network connection (not behind strict firewalls)');
    }
    
    return 'Connection test failed';
  } finally {
    await client.close();
  }
}

testConnection()
  .then(result => console.log(result))
  .catch(err => console.error('Unhandled error:', err)); 