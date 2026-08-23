// Actors Routes
const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.json({ success: true, message: 'Get all actors endpoint' });
});

router.get('/:id', (req, res) => {
  res.json({ success: true, message: 'Get actor details endpoint' });
});

router.get('/:id/works', (req, res) => {
  res.json({ success: true, message: "Get actor's works endpoint" });
});

module.exports = router;
