class Update {
  final String email;
  final String username;
  final String password;

  Update({required this.email, required this.username, required this.password});

  factory Update.fromJson(Map<String, dynamic> json) {
    return Update(
      email: json['email'],
      username: json['username'],
      password: json['password'],

    );
  }
}