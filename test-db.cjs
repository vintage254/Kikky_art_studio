const { Client } = require('pg');

const client = new Client({
    connectionString: 'postgres://neondb_owner:npg_QwXBjWPOrZ62@ep-bitter-mouse-a46ix0ik-pooler.us-east-1.aws.neon.tech/neondb?sslmode=require',
});

client.connect()
    .then(() => console.log('Connected successfully'))
    .catch(err => console.error('Connection error', err.stack))
    .finally(() => client.end());
