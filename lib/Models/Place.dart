class Place {
  final int id;
  final String plcName;
  final String lat;
  final String lng;
  final String imgUrl;
  final bool visited;

  Place({
    required this.id,
    required this.plcName,
    required this.lat,
    required this.lng,
    required this.imgUrl,
    required this.visited,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      plcName: json['plcName'],
      lat: json['lat'],
      lng: json['lng'],
      imgUrl: json['imgUrl'],
      visited: json['visited'],
    );
  }
}
