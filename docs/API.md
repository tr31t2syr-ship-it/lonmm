# Lonm API Documentation

## Base URL
```
http://localhost:3000/api/v1
```

## Authentication
All requests (except login) require a valid JWT token in the Authorization header:
```
Authorization: Bearer {token}
```

## Endpoints

### Authentication
- `POST /auth/google` - Google OAuth login
- `POST /auth/logout` - Logout

### Works (الأعمال)
- `GET /works` - Get all works with filters
- `GET /works/:id` - Get single work details
- `POST /works` - Create new work (Admin only)
- `PUT /works/:id` - Update work (Admin only)
- `DELETE /works/:id` - Delete work (Admin only)

### Categories (التصنيفات)
- `GET /categories` - Get all categories
- `GET /categories/:id/works` - Get works by category

### Comments (التعليقات)
- `POST /works/:id/comments` - Add comment
- `PUT /comments/:id` - Edit comment
- `DELETE /comments/:id` - Delete comment
- `POST /comments/:id/report` - Report comment

### Likes (الإعجابات)
- `POST /works/:id/like` - Like a work
- `POST /works/:id/unlike` - Unlike a work
- `GET /works/:id/likes/count` - Get likes count

### Favorites (المفضلات)
- `POST /favorites` - Add to favorites
- `DELETE /favorites/:id` - Remove from favorites
- `GET /favorites` - Get user favorites

### Watch Later (المشاهدة لاحقاً)
- `POST /watchlater` - Add to watch later
- `DELETE /watchlater/:id` - Remove from watch later
- `GET /watchlater` - Get watch later list

### Requests (الطلبات)
- `POST /requests` - Submit request
- `GET /requests` - Get user requests
- `PUT /requests/:id` - Edit request
- `DELETE /requests/:id` - Delete request
- `GET /admin/requests` - Get all requests (Admin only)
- `POST /admin/requests/:id/respond` - Respond to request (Admin only)
- `DELETE /admin/requests/:id` - Delete request (Admin only)

### Actors (الممثلون)
- `GET /actors` - Get all actors
- `GET /actors/:id` - Get actor details and works
- `GET /actors/:id/works` - Get actor's works

### Notifications (الإشعارات)
- `GET /notifications` - Get user notifications
- `POST /notifications/:id/read` - Mark as read
- `DELETE /notifications/:id` - Delete notification

### Admin (الإدارة)
- `POST /admin/verify` - Verify admin code
- `GET /admin/reports` - Get all reports
- `DELETE /admin/reports/:id` - Delete report
- `GET /admin/dashboard` - Get dashboard stats

## Response Format

### Success Response
```json
{
  "success": true,
  "data": {},
  "message": "Operation successful"
}
```

### Error Response
```json
{
  "success": false,
  "error": "Error message",
  "code": "ERROR_CODE"
}
```

## Rate Limiting
- Authenticated requests: 100 requests per minute
- Unauthenticated requests: 20 requests per minute

## Search
- Minimum 2 characters required
- Instant results
- Supports Arabic and English

---

Last Updated: 2024
