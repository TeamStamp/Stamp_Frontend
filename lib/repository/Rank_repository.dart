import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Rank.dart';

class RankRepository{

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken') ?? '';
  }

  Future<List<Rank>> Rank_List() async {
    var url = Uri.http('54.215.135.43:8080', 'api/auth/rank');

    Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'x-auth-token': await getToken()
    });
    if(response.statusCode == 200) {
      //print(json.decode(utf8.decode(response.bodyBytes))['data']);
      var data = (json.decode(utf8.decode(response.bodyBytes))['data']);
      //print(data != null ? data['data'] : 'Data is null');
      List<Rank> ranks = [];

      for (var item in data) {
        Rank rank = Rank.fromJson(item as Map<String, dynamic>);
        ranks.add(rank);
      }

      print(ranks);
      return ranks;
    }
    else {
      throw Exception('실패');
    }
  }
}