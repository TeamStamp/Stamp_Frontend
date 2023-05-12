import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthRepository {
  Future<bool> register(String username, String email, String password) async {
    var url = Uri.http('54.215.135.43:8080', 'api/auth/register');
    try {
      Response response = await http.post(url,
          body: jsonEncode({"username": username, "email": email, "password": password}), headers: {
            'Content-Type': 'application/json'
          });
      if(response.statusCode == 200) {
        return true;
      }
    } catch (e){
      print(e);
      return false;
    }
    print('method end');
    return false;
  }

  Future<bool> login(String email, String password) async {
    var url = Uri.http('54.215.135.43:8080', 'api/auth/login');
    try {
      Response response = await http.post(url,
          body: jsonEncode({"email": email, "password": password}), headers: {
            'Content-Type': 'application/json'
          });
      if(response.statusCode == 200) {
        return true;
      }
    } catch (e){
      print(e);
      return false;
    }
    return false;
  }
}