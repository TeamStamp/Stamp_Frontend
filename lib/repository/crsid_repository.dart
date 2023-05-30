import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Crsid.dart';
import '../Models/Place.dart';

class CrsidRepository {

  Future<Crsid> readCrsidInfo() async {
    var url = Uri.http('54.215.135.43:8080', 'api/cv/9');
    Response response = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': await getToken()
        });
    if(response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      var crsidData = data['data'];
      print(crsidData);

      List<Place> places = [];
      for (var plcData in crsidData['plcList']) {
        Place place = Place(
          id: plcData['id'],
          plcName: plcData['plcName'],
          lat: plcData['lat'],
          lng: plcData['lng'],
          imgUrl: plcData['imgUrl'],
          visited: plcData['visited'],
        );
        places.add(place);
      }

      Crsid crsid = Crsid(
        id: crsidData['id'],
        crsName: crsidData['crsName'],
        imgUrl: crsidData['imgUrl'],
        maker: crsidData['maker'],
        plcList: places,
      );

      print(crsid);
      return crsid;
    }
    else {
      throw Exception('실패');
    }
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken') ?? '';
  }
}
