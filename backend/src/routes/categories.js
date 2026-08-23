// Categories Routes
const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.json({ 
    success: true, 
    categories: [
      'رعب', 'أكشن', 'كوميدي', 'سحر', 'إثارة', 
      'مغامرة', 'تاريخي', 'جريمة', 'حرب', 'غموض',
      'دراما', 'كي-دراما', 'وثائقي', 'فانتازيا'
    ]
  });
});

router.get('/:id/works', (req, res) => {
  res.json({ success: true, message: 'Get works by category endpoint' });
});

module.exports = router;
