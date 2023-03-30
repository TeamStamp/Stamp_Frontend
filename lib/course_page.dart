/*
  23.03.30
    - 바텀 네비게이션 바를 유지하고 넘어가야 하는데 모르겠음 (도와줘요 영훈몬)





 */

import 'package:flutter/material.dart';

class coursepage extends StatefulWidget {
  const coursepage({Key? key}) : super(key: key);

  @override
  State<coursepage> createState() => _coursepageState();
}

class _coursepageState extends State<coursepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/12),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffF8BD53),
          elevation: 5,
          centerTitle: true,
          title: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height/20,
            color: Color(0xffF8BD53),
            child: Image(
              image: AssetImage('images/logo_appbar.png'),
              width: double.infinity,
              height: MediaQuery.of(context).size.height/20,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.red,
                child: Text('카카오지하철 느낌의 이미지 넣는 구역'),
              ),
              flex: 2,
          ),
          Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.orange,
                child: Text('선택한 코스를 이루는 장소들 사진 나열하는 구역'),
              ),
              flex: 5
          ),
          Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.green,
                child: Text('각 장소별 상세 설명'),
              ),
              flex: 7
          ),
          Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.blue,
                child: Text('댓글 리스트 형식으로 넣는 구역'),
              ),
              flex: 6
          )
        ],
      ),
    );
  }
}
