// Likes Routes
const express = require('express');
const router = express.Router();

router.post('/like', (req, res) => {
  res.json({ success: true, message: 'Like work endpoint' });
});

router.post('/unlike', (req, res) => {
  res.json({ success: true, message: 'Unlike work endpoint' });
});

router.get('/:id/count', (req, res) => {
  res.json({ success: true, likes: 0, dislikes: 0 });
});

module.exports = router;
