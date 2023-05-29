class Update {
  final String email;
  final String nickname;
  final String password;

  Update({required this.email, required this.nickname, required this.password});

  factory Update.fromJson(Map<String, dynamic> json) {
    return Update(
      email: json['email'],
      nickname: json['nickname'],
      password: json['password']

    );
  }
}