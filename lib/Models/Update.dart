class Update {
  final String username;


  Update({required this.username});

  factory Update.fromJson(Map<String, dynamic> json) {
    return Update(
      username: json['username'],

    );
  }
}