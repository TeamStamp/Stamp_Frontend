import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Comment.dart';

class CommentRepository {
  Future<List<Comment>> fetchComments(int courseId) async {
    var url = Uri.http('54.215.135.43:8080', 'api/crscmt');
    Response response = await http.get(url,
      headers: {'Content-Type': 'application/json',
        'x-auth-token': await getToken()},
    );

    if(response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes)) as List;
      List<Comment> comments = data.map((item) => Comment.fromJson(item)).toList();
      return comments;
    }
    else {
      throw Exception('실패');
    }
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken') ?? '';
  }
}