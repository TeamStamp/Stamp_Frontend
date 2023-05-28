import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Mapvisited.dart';

class MapRepository {
  Future<Mapvisited> visitPic(int crsId, int plcId, bool visited) async {
    var url = Uri.http('54.215.135.43:8080', 'api/cv/visitPlc');
    Response response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-auth-token': await getToken()
      },
      body: json.encode({
        "crsId": crsId,
        "plcId": plcId,
        "visited": visited,
      }),
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print(responseData);
      return Mapvisited.fromJson(responseData['data']);
    } else {
      throw Exception('Request failed');
    }
  }
  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken') ?? '';
  }
}