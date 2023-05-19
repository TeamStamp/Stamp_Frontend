import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Course.dart';

class CourseRepository {
  Future<Course> readCourseInfo() async {
    var url = Uri.http('54.215.135.43:8080', 'api/courses');
    Response response = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': await getToken()
        });
    if(response.statusCode == 200) {
      return Course.fromJson(json.decode(response.body));
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