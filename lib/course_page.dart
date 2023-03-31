/*
  23.03.30
    -





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
          // 앱바 바로 밑에 위치한 카카오지하철 느낌의 로고
          Flexible(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/course_page.image01.png')
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('수원시 영통구', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Color(0xffCDAD5C)),),
                  ],
                ),
              ),
              flex: 2,
          ),
          Flexible(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Color(0xffCDAD5C), width: 2)
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.blueGrey,
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Text('띠 모양은 배경이미지로 넣고 그 위에 장소별 이미지 Row로 정렬'),
                ),
              ),
              flex: 5
          ),
          Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Color(0xffFDFAF4),
                child: Text('1. 컨테이너 안에 리스트뷰 넣기 \n'
                            '2. 리스트뷰 안에 Column 넣기 \n'
                            '3. Coulmn 안에 여러개의 컨테이너 넣기 \n'
                            '4. 각 컨테이너 안에 장소별 상세 정보 넣기'),
              ),
              flex: 8
          ),
          Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Color(0xffFDFAF4),
                child: Text('댓글 리스트 형식으로 넣는 구역'),
              ),
              flex: 6
          )
        ],
      ),
    );
  }
}
