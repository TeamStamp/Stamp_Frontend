import 'dart:ffi';

class Rank {
  final String? email;
  final int? stamp;

  Rank({required this.email, required this.stamp});

  factory Rank.fromJson(Map<String, dynamic> json) {
    return Rank(
      email: json['email'] as String,
      stamp: json['stamp'] as int,
    );
  }
}