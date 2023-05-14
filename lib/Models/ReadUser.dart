class ReadUser {
  final String email;
  final String username;

  ReadUser({required this.email, required this.username});

  factory ReadUser.fromJson(Map<String, dynamic> json) {
    return ReadUser(
      email: json['email'],
      username: json['username'],
    );
  }
}