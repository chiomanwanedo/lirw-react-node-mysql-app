const express = require('express');
const booksController = require('../controllers/BooksController');
const authorsController = require('../controllers/AuthorsController');

const router = express.Router();

// ✅ Test route to verify backend is working
router.get('/test', (req, res) => {
  res.json({ message: 'API is working!' });
});

// 📚 Author routes
router.get('/authors', authorsController.get);
router.post('/authors', authorsController.create);
router.put('/authors/:id', authorsController.update);
router.delete('/authors/:id', authorsController.delete);

// 📖 Book routes
router.get('/books', booksController.get);
router.post('/books', booksController.create);
router.put('/books/:id', booksController.update);
router.delete('/books/:id', booksController.delete);

module.exports = router;
