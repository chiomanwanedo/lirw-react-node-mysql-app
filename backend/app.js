const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const routes = require('./routes');
const cors = require('cors');
const db = require('./configs/db');

const app = express();

app.use(cors());
app.use(bodyParser.json());

db.connect((err) => {
   if (err) {
      console.error('Error connecting to MySQL: ' + err.stack);
      return;
   }
   console.log('Connected to MySQL Database');
});

// ✅ New test route
app.get('/api/test', (req, res) => {
  res.json({ message: 'API is working!' });
});

// ✅ New base paths
app.use('/api/books', require('./routes/books'));
app.use('/api/authors', require('./routes/authors'));

module.exports = app;
