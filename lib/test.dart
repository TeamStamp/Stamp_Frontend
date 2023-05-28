import 'package:flutter/material.dart';
import 'package:stamp_front/repository/map_repository.dart';

class TestPage extends StatelessWidget {
  final MapRepository mapRepository = MapRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            int crsId=9;
            int plcId=5;
            bool visited=false;
            updateServerData(crsId,plcId,visited);
          },
          child: Text('Update Server Data'),
        ),
      ),
    );
  }

  void updateServerData(int crsId, int plcId,bool visited) {
    mapRepository.visitPic(crsId, plcId, visited)
        .then((updatedData) {
      // 서버에서 업데이트된 데이터 처리
      print('Data updated: $updatedData');
    })
        .catchError((error) {
      // 오류 처리
      print('Error updating data: $error');
    });
  }
}
