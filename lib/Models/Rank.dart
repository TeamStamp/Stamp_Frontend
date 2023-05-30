import 'dart:ffi';

class Rank {
  final String? nickName;
  final int? stamp;

  Rank({required this.nickName, required this.stamp});

  factory Rank.fromJson(Map<String, dynamic> json) {
    return Rank(
      nickName: json['nickName'] as String,
      stamp: json['stamp'] as int,
    );
  }
}