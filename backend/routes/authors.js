const express = require('express');
const router = express.Router();
const AuthorsController = require('../controllers/AuthorsController');

router.get('/', AuthorsController.get);
router.post('/', AuthorsController.create);
router.put('/:id', AuthorsController.update);
router.delete('/:id', AuthorsController.delete);

module.exports = router;
