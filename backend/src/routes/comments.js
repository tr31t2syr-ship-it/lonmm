// Comments Routes
const express = require('express');
const router = express.Router();

router.post('/add', (req, res) => {
  res.json({ success: true, message: 'Add comment endpoint' });
});

router.put('/:id', (req, res) => {
  res.json({ success: true, message: 'Edit comment endpoint' });
});

router.delete('/:id', (req, res) => {
  res.json({ success: true, message: 'Delete comment endpoint' });
});

router.post('/:id/report', (req, res) => {
  res.json({ success: true, message: 'Report comment endpoint' });
});

module.exports = router;
