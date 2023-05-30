import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Models/Comment.dart';

class ApiService {
  static const String baseUrl = 'https://api.example.com'; // API의 기본 URL

  static Future<List<Comment>> fetchComments(int courseId) async {
    final response = await http.get(Uri.parse('$baseUrl/comments?courseId=$courseId'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<Comment> comments = data.map((item) => Comment.fromJson(item)).toList();
      return comments;
    } else {
      throw Exception('Failed to fetch comments');
    }
  }

// 다른 API 요청들을 추가로 구현할 수 있습니다.
}