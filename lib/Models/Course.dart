import 'dart:convert';

class Course {
  final String imgUrl;
  final String crsName;
  final int id;


  Course({required this.imgUrl, required this.crsName, required this.id});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      imgUrl: json['imgUrl'],
      crsName: json['crsName'],
      id: json['id']
    );
  }
}