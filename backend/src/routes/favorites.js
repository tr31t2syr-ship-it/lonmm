// Favorites Routes
const express = require('express');
const router = express.Router();

router.post('/add', (req, res) => {
  res.json({ success: true, message: 'Add to favorites endpoint' });
});

router.delete('/:id', (req, res) => {
  res.json({ success: true, message: 'Remove from favorites endpoint' });
});

router.get('/list', (req, res) => {
  res.json({ success: true, favorites: [] });
});

module.exports = router;
