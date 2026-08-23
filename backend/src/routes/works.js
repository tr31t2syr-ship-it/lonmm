// Works Routes - Movie, Series, Anime Management
const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.json({ success: true, message: 'Get all works endpoint' });
});

router.get('/:id', (req, res) => {
  res.json({ success: true, message: 'Get single work endpoint' });
});

router.post('/', (req, res) => {
  res.json({ success: true, message: 'Create work endpoint (Admin only)' });
});

router.put('/:id', (req, res) => {
  res.json({ success: true, message: 'Update work endpoint (Admin only)' });
});

router.delete('/:id', (req, res) => {
  res.json({ success: true, message: 'Delete work endpoint (Admin only)' });
});

module.exports = router;
