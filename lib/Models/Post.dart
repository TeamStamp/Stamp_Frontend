class Post {
  final String crsId;
  final String crsName;
  final String stamp;

  Post({required this.crsId, required this.crsName, required this.stamp});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      crsId: json['crsId'],
      crsName: json['crsName'],
      stamp: json['stamp'],
    );
  }
}

// class Post {
//   final int userId;
//   final int id;
//   final String title;
//   final bool completed;
//
//   Post({required this.userId, required this.id, required this.title, required this.completed});
//
//   factory Post.fromJson(Map<String, dynamic> json) {
//    return Post(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//       completed: json['completed'],
//     );
//   }
// }