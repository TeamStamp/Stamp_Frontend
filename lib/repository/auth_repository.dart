import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stamp_front/Models/Post.dart';
import 'package:stamp_front/Models/Post.dart';

import '../Models/Post.dart';
import '../Models/Post.dart';
import '../Models/ReadUser.dart';
import '../Models/Update.dart';

class AuthRepository {
  Future<bool> register(String nickname, String email, String password) async {
    var url = Uri.http('54.215.135.43:8080', 'api/auth/register');
    try {
      Response response = await http.post(url,
          body: jsonEncode({"nickname": nickname, "email": email, "password": password}), headers: {
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
        final accessToken = jsonDecode(response.body)['data']['accessToken'];

        final SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('accessToken', accessToken);
        return true;
      }
    } catch (e){
      print(e);
      return false;
    }
    return false;
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken') ?? '';
  }


  // apiTest() async {
  //   var url = Uri.https('jsonplaceholder.typicode.com', 'todos');
  //   try {
  //     Response response = await http.get(url, headers: {
  //       'Authorization': await getToken(),
  //     });
  //
  //     final List<dynamic> data = jsonDecode(response.body);
  //     List<Post> posts = data.map<Post>((element) {
  //       return Post.fromJson(element);
  //     }).toList();
  //     return posts;
  //     // List<Post> posts =
  //   } catch (e){
  //     print(e);
  //   }
  // }

  Future<void> uploadImage(File imageFile) async {
    // final picker = ImagePicker();
    // final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (imageFile != null) {
      final url = 'http://54.215.135.43:8080/api/auth/uploadImg';
      final token = await getToken();

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['x-auth-token'] = token;
      request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        print('이미지 업로드 성공');
      } else {
        print('이미지 업로드 실패');
      }
    } else {
      print('이미지 파일을 선택하지 않았습니다.');
    }
  }
  Future<List<Post>> Course_List() async {
    var url = Uri.http('54.215.135.43:8080', 'api/cv/getVCrs');

      Response response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'x-auth-token': await getToken()
      });
        if(response.statusCode == 200) {
          //print(json.decode(utf8.decode(response.bodyBytes))['data']);
        var data = (json.decode(utf8.decode(response.bodyBytes))['data']);
          //print(data != null ? data['data'] : 'Data is null');
        List<Post> posts = [];

        for (var item in data) {
          Post post = Post.fromJson(item as Map<String, dynamic>);
          posts.add(post);
        }

        print(posts);
        return posts;
      }
      else {
        throw Exception('실패');
      }
  }
  Future<Update> fetchalbum() async {
    var url = Uri.http('54.215.135.43:8080', 'api/auth/read');
    Response response = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': await getToken()
        });
    if (response.statusCode == 200) {
      return Update.fromJson(json.decode(utf8.decode(response.bodyBytes))['data']);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Update> updatealbum(String nickname, String password) async {
    var url = Uri.http('54.215.135.43:8080', 'api/auth/update');
    Response response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': await getToken()
        },
        body: jsonEncode({"nickname": nickname,
                          "password": password
        }));
    if(response.statusCode == 200) {
      return Update.fromJson(json.decode(utf8.decode(response.bodyBytes))['data']);
    }else{
      throw Exception('실패');
    }
  }
  // Future<bool> updatealbum(String username, String password) async {
  //   var url = Uri.http('54.215.135.43:8080', 'api/auth/update');
  //   try {
  //     Response response = await http.put(url,
  //         body: jsonEncode({"username": username, "password": password}),
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'x-auth-token': await getToken()
  //         });
  //     if(response.statusCode == 200) {
  //       return true;
  //     }
  //   } catch (e){
  //     print(e);
  //     return false;
  //   }
  //   print('method end');
  //   return false;
  // }
  Future<ReadUser> readUserInfo() async {
    var url = Uri.http('54.215.135.43:8080', 'api/auth/read');
    Response response = await http.get(url,
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': await getToken()
        });
    var data1 = json.decode(utf8.decode(response.bodyBytes))['data'];
    print(data1);
    if(response.statusCode == 200) {
      return ReadUser.fromJson(json.decode(utf8.decode(response.bodyBytes))['data']);
    }else{
      throw Exception('실패');
    }
  }

}

