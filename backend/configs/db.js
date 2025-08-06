const mysql = require('mysql2');

const db = mysql.createConnection({
   host: '172.31.21.179',   // ✅ database EC2 private IP
   port: '3306',
   user: 'lirw_user',
   password: 'cadd1',
   database: 'lirw_app'
});

module.exports = db;
