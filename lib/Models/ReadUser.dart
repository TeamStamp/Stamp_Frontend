import 'dart:ffi';
import 'dart:convert';

class ReadUser {
  final String email;
  final String nickname;
  final int stamp;

  ReadUser({required this.email, required this.nickname, required this.stamp});

  factory ReadUser.fromJson(Map<String, dynamic> json) {
    return ReadUser(
      email: json['email'],
      nickname: json['nickname'],
      stamp: json['stamp'],
    );
  }
}