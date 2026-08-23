import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000/api';
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  // Works API
  Future<List<dynamic>> getWorks() async {
    try {
      final response = await _dio.get('/works');
      return response.data['data'] ?? [];
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getWorkDetails(String workId) async {
    try {
      final response = await _dio.get('/works/$workId');
      return response.data['data'];
    } catch (e) {
      rethrow;
    }
  }

  // Search API
  Future<List<dynamic>> searchWorks(String query) async {
    try {
      final response = await _dio.get('/works', queryParameters: {
        'search': query,
      });
      return response.data['data'] ?? [];
    } catch (e) {
      rethrow;
    }
  }

  // Categories API
  Future<List<dynamic>> getCategories() async {
    try {
      final response = await _dio.get('/categories');
      return response.data['categories'] ?? [];
    } catch (e) {
      rethrow;
    }
  }

  // Favorites API
  Future<bool> addToFavorites(String workId) async {
    try {
      await _dio.post('/favorites/add', data: {
        'workId': workId,
      });
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> removeFromFavorites(String workId) async {
    try {
      await _dio.delete('/favorites/$workId');
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> getFavorites() async {
    try {
      final response = await _dio.get('/favorites/list');
      return response.data['favorites'] ?? [];
    } catch (e) {
      rethrow;
    }
  }

  // Watch Later API
  Future<bool> addToWatchLater(String workId) async {
    try {
      await _dio.post('/watchlater/add', data: {
        'workId': workId,
      });
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> removeFromWatchLater(String workId) async {
    try {
      await _dio.delete('/watchlater/$workId');
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> getWatchLater() async {
    try {
      final response = await _dio.get('/watchlater/list');
      return response.data['watchlater'] ?? [];
    } catch (e) {
      rethrow;
    }
  }

  // Comments API
  Future<bool> addComment(String workId, String comment) async {
    try {
      await _dio.post('/comments/add', data: {
        'workId': workId,
        'comment': comment,
      });
      return true;
    } catch (e) {
      rethrow;
    }
  }

  // Likes API
  Future<bool> likeWork(String workId) async {
    try {
      await _dio.post('/likes/like', data: {
        'workId': workId,
      });
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> unlikeWork(String workId) async {
    try {
      await _dio.post('/likes/unlike', data: {
        'workId': workId,
      });
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
