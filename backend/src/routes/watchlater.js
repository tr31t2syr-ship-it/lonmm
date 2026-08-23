// Watch Later Routes
const express = require('express');
const router = express.Router();

router.post('/add', (req, res) => {
  res.json({ success: true, message: 'Add to watch later endpoint' });
});

router.delete('/:id', (req, res) => {
  res.json({ success: true, message: 'Remove from watch later endpoint' });
});

router.get('/list', (req, res) => {
  res.json({ success: true, watchlater: [] });
});

module.exports = router;
