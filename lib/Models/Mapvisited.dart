class Mapvisited {
  final int crsId;
  final int plcId;
  final bool visited;

  Mapvisited(this.crsId, this.plcId, this.visited);

  factory Mapvisited.fromJson(dynamic json) {
    if (json != null) {
      return Mapvisited(
        json['crsId'] as int,
        json['plcId'] as int,
        json['visited'] as bool,
      );
    } else {
      throw Exception('Invalid JSON data111');
    }
  }
}

