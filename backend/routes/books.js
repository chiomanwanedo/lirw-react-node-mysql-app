const express = require('express');
const router = express.Router();
const BooksController = require('../controllers/BooksController');

router.get('/', BooksController.get);
router.post('/', BooksController.create);
router.put('/:id', BooksController.update);
router.delete('/:id', BooksController.delete);

module.exports = router;
