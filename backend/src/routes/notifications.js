// Notifications Routes
const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.json({ success: true, message: 'Get notifications endpoint' });
});

router.post('/:id/read', (req, res) => {
  res.json({ success: true, message: 'Mark notification as read endpoint' });
});

router.delete('/:id', (req, res) => {
  res.json({ success: true, message: 'Delete notification endpoint' });
});

module.exports = router;
