class ReadUser {
  final String email;
  final String nickname;


  ReadUser({required this.email, required this.nickname});

  factory ReadUser.fromJson(Map<String, dynamic> json) {
    return ReadUser(
      email: json['email'],
      nickname: json['nickname'],

    );
  }
}