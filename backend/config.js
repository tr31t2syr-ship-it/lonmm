// Backend Configuration
module.exports = {
  // Server Configuration
  port: process.env.PORT || 3000,
  nodeEnv: process.env.NODE_ENV || 'development',
  
  // Firebase Configuration
  firebase: {
    projectId: process.env.FIREBASE_PROJECT_ID,
    privateKey: process.env.FIREBASE_PRIVATE_KEY,
    clientEmail: process.env.FIREBASE_CLIENT_EMAIL,
  },
  
  // API Keys
  apis: {
    imdbKey: process.env.IMDB_API_KEY,
    itdbKey: process.env.ITDB_API_KEY,
  },
  
  // JWT Configuration
  jwt: {
    secret: process.env.JWT_SECRET,
    expiresIn: '30d',
  },
  
  // Admin Configuration
  admin: {
    email: process.env.ADMIN_EMAIL || 'tr31t2syr@gmail.com',
    code: process.env.ADMIN_CODE || 'L2006',
  },
  
  // CORS Configuration
  cors: {
    origin: process.env.ALLOWED_ORIGINS?.split(',') || ['http://localhost:3000'],
    credentials: true,
  },
  
  // Rate Limiting
  rateLimit: {
    authenticated: 100, // per minute
    unauthenticated: 20, // per minute
  },
};
