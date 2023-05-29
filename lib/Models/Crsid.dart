import 'Place.dart';

class Crsid {
  final int id;
  final String crsName;
  final String imgUrl;
  final String maker;
  final List<Place> plcList;

  Crsid({
    required this.id,
    required this.crsName,
    required this.imgUrl,
    required this.maker,
    required this.plcList,
  });

  factory Crsid.fromJson(Map<String, dynamic> json) {
    List<Place> places = [];
    if (json['plcList'] != null) {
      var plcList = json['plcList'] as List;
      places = plcList.map((item) => Place.fromJson(item)).toList();
    }

    return Crsid(
      id: json['id'],
      crsName: json['crsName'],
      imgUrl: json['imgUrl'],
      maker: json['maker'],
      plcList: places,
    );
  }
}
