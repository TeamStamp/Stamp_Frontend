class Course {
  final String imgUrl;
  final String crsName;


  Course({required this.imgUrl, required this.crsName});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      imgUrl: json['imgUrl'],
      crsName: json['crsName'],

    );
  }
}