import 'dart:ffi';
import 'dart:convert';

class ReadUser {
  final String email;
  final String nickname;
  final int stamp;
  final String imgUrl;

  ReadUser({required this.email, required this.nickname, required this.stamp, required this.imgUrl});

  factory ReadUser.fromJson(Map<String, dynamic> json) {
    return ReadUser(
      email: json['email'],
      nickname: json['nickname'],
      stamp: json['stamp'],
      imgUrl: json['imgUrl']
    );
  }
}