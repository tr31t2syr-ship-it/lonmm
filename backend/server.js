// Main Backend Server Entry Point
const express = require('express');
const cors = require('cors');
require('dotenv').config();

const config = require('./config');

// Initialize Express App
const app = express();

// CORS Middleware
app.use(cors(config.cors));

// Body Parser Middleware
app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ limit: '10mb', extended: true }));

// Health Check Route
app.get('/health', (req, res) => {
  res.json({
    status: 'ok',
    message: 'Lonm API is running',
    timestamp: new Date().toISOString(),
  });
});

// API Routes (will be added later)
app.use('/api/v1/auth', require('./src/routes/auth'));
app.use('/api/v1/works', require('./src/routes/works'));
app.use('/api/v1/categories', require('./src/routes/categories'));
app.use('/api/v1/comments', require('./src/routes/comments'));
app.use('/api/v1/likes', require('./src/routes/likes'));
app.use('/api/v1/favorites', require('./src/routes/favorites'));
app.use('/api/v1/watchlater', require('./src/routes/watchlater'));
app.use('/api/v1/requests', require('./src/routes/requests'));
app.use('/api/v1/actors', require('./src/routes/actors'));
app.use('/api/v1/notifications', require('./src/routes/notifications'));
app.use('/api/v1/admin', require('./src/routes/admin'));

// 404 Error Handler
app.use((req, res) => {
  res.status(404).json({
    success: false,
    error: 'Route not found',
    message: `${req.method} ${req.path} is not defined`,
  });
});

// Error Handler
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({
    success: false,
    error: err.message || 'Internal Server Error',
    code: 'INTERNAL_SERVER_ERROR',
  });
});

// Start Server
const PORT = config.port;
app.listen(PORT, () => {
  console.log(`🚀 Lonm API Server is running on port ${PORT}`);
  console.log(`Environment: ${config.nodeEnv}`);
  console.log(`Admin Email: ${config.admin.email}`);
});

module.exports = app;
