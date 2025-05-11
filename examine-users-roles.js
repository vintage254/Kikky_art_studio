const { Pool } = require('pg');

// Create a connection pool for Neon
const pool = new Pool({
  connectionString: "postgres://neondb_owner:npg_qokrE9JIA3Df@ep-curly-frost-a4e3i8mt-pooler.us-east-1.aws.neon.tech/neondb?sslmode=require",
  ssl: {
    rejectUnauthorized: false // Required for some Neon connections
  }
});

async function examineUsersRoles() {
  let client;
  
  try {
    console.log('Connecting to Neon PostgreSQL...');
    client = await pool.connect();
    console.log('Connection successful!');
    
    // Get users_roles table structure
    const columns = await client.query(`
      SELECT column_name, data_type, is_nullable
      FROM information_schema.columns 
      WHERE table_name = 'users_roles'
      ORDER BY ordinal_position
    `);
    
    console.log('Users_roles table structure:');
    columns.rows.forEach(col => {
      console.log(`- ${col.column_name}: ${col.data_type} (nullable: ${col.is_nullable})`);
    });
    
    // Check for existing roles data
    const rolesData = await client.query(`
      SELECT * FROM users_roles LIMIT 10
    `);
    
    console.log('\nUsers_roles data:');
    rolesData.rows.forEach(row => {
      console.log(row);
    });

    // Check for enum types that might be related to roles
    const enumTypes = await client.query(`
      SELECT t.typname, e.enumlabel
      FROM pg_type t 
      JOIN pg_enum e ON t.oid = e.enumtypid  
      JOIN pg_catalog.pg_namespace n ON n.oid = t.typnamespace
      WHERE n.nspname = 'public'
      ORDER BY t.typname, e.enumsortorder;
    `);
    
    console.log('\nEnum types that might be related to roles:');
    const enums = {};
    enumTypes.rows.forEach(row => {
      if (!enums[row.typname]) {
        enums[row.typname] = [];
      }
      enums[row.typname].push(row.enumlabel);
    });
    
    Object.keys(enums).forEach(typeName => {
      console.log(`- ${typeName}: ${enums[typeName].join(', ')}`);
    });

    // Look for foreign key relationships to users table
    const fkRelationships = await client.query(`
      SELECT
        tc.table_name as source_table, 
        kcu.column_name as source_column, 
        ccu.table_name as target_table,
        ccu.column_name as target_column
      FROM 
        information_schema.table_constraints tc
        JOIN information_schema.key_column_usage kcu
          ON tc.constraint_name = kcu.constraint_name
          AND tc.table_schema = kcu.table_schema
        JOIN information_schema.constraint_column_usage ccu
          ON ccu.constraint_name = tc.constraint_name
          AND ccu.table_schema = tc.table_schema
      WHERE 
        tc.constraint_type = 'FOREIGN KEY' 
        AND (ccu.table_name = 'users' OR tc.table_name = 'users_roles')
    `);
    
    console.log('\nForeign key relationships with users or users_roles:');
    fkRelationships.rows.forEach(row => {
      console.log(`- ${row.source_table}.${row.source_column} -> ${row.target_table}.${row.target_column}`);
    });
    
    // Get the first user to understand relationship
    const firstUser = await client.query(`
      SELECT * FROM users LIMIT 1
    `);
    
    console.log('\nFirst user data:');
    console.log(firstUser.rows[0]);
    
    // Retrieve users_roles data that might be associated with our user
    if (firstUser.rows.length > 0) {
      const userId = firstUser.rows[0].id;
      
      // For Payload CMS, parent_id is typically used to link to the user
      const userRoles = await client.query(`
        SELECT * FROM users_roles WHERE parent_id = $1
      `, [userId]);
      
      console.log(`\nRoles for user ID ${userId}:`);
      console.log(userRoles.rows);
      
      // Try adding an admin role for this user
      if (userRoles.rows.length === 0) {
        // First check what role values are valid in the system
        if (Object.keys(enums).length > 0) {
          // There's likely an enum type for roles
          const relevantEnums = Object.keys(enums)
            .filter(typeName => typeName.includes('role') || enums[typeName].some(val => val === 'admin'))
            .map(typeName => enums[typeName]);
          
          if (relevantEnums.length > 0) {
            console.log('\nFound relevant role enum values:', relevantEnums.flat());
            
            // Assuming the first set of enums is for roles and contains 'admin'
            const adminValue = relevantEnums[0].find(val => val === 'admin') || relevantEnums[0][0];
            
            console.log(`\nTrying to add role '${adminValue}' to user ID ${userId}...`);
            
            try {
              await client.query(`
                INSERT INTO users_roles ("order", parent_id, value)
                VALUES (0, $1, $2)
              `, [userId, adminValue]);
              
              console.log('Role added successfully!');
            } catch (err) {
              console.error('Error adding role:', err.message);
            }
          }
        } else {
          // No enum types found, try with string 'admin'
          console.log('\nNo enum types found. Trying to add role "admin" as string...');
          
          try {
            await client.query(`
              INSERT INTO users_roles ("order", parent_id, value)
              VALUES (0, $1, 'admin')
            `, [userId]);
            
            console.log('Role added successfully!');
          } catch (err) {
            console.error('Error adding role as string:', err.message);
            
            // Try one more approach - check the data type of the value column
            if (columns.rows.some(col => col.column_name === 'value')) {
              const valueColumn = columns.rows.find(col => col.column_name === 'value');
              console.log(`\nValue column data type is: ${valueColumn.data_type}`);
              
              if (valueColumn.data_type === 'USER-DEFINED') {
                console.log('The value column is a custom type. Trying to find its actual enum type...');
                
                const columnType = await client.query(`
                  SELECT udt_name 
                  FROM information_schema.columns 
                  WHERE table_name = 'users_roles' AND column_name = 'value'
                `);
                
                if (columnType.rows.length > 0) {
                  console.log(`Actual type name: ${columnType.rows[0].udt_name}`);
                  
                  // Try casting to the enum type
                  try {
                    await client.query(`
                      INSERT INTO users_roles ("order", parent_id, value)
                      VALUES (0, $1, 'admin'::${columnType.rows[0].udt_name})
                    `, [userId]);
                    
                    console.log('Role added successfully with type casting!');
                  } catch (err) {
                    console.error('Error adding role with casting:', err.message);
                  }
                }
              }
            }
          }
        }
      }
    }
    
  } catch (err) {
    console.error('Error:', err);
  } finally {
    if (client) {
      client.release();
    }
    await pool.end();
  }
}

// Run the function
examineUsersRoles(); 