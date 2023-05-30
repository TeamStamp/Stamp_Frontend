class Comment {
  final int id;
  final String content;
  final int userId;


  Comment({required this.id, required this.content, required this.userId});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      content: json['content'],
        userId: json['usr']
    );
  }
}