/*
  23.03.30
    -
 */

import 'package:flutter/material.dart';

import 'map_page.dart';

class coursepage extends StatefulWidget {
  const coursepage({Key? key}) : super(key: key);

  @override
  State<coursepage> createState() => _coursepageState();
}

class _coursepageState extends State<coursepage> {
  final List<String> places = <String> ['1번 장소', '2번 장소', '3번 장소', '4번 장소', '5번 장소'];
  final List<String> user = <String> ['김민기', '김영훈', '최민성'];
  final List<String> comment = <String> ['댓글 1', '댓글 2', '댓글 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text('코스 이름 출력',textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Color(0xffCDAD5C)),),
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
                    border: Border.all(color: Color(0xffCDAD5C), width: 2),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/course_page.image02.png')
                    )
                ),
                child: Center(
                  child: ElevatedButton(
                    child: Text('map_page로 이동'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => mappage()),
                      );
                    },
                  ),
                ),
              ),
              flex: 5
          ),
          Flexible(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffCDAD5C), width: 2)
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(15),
                    itemCount: places.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        padding: EdgeInsets.all(5),
                        height: MediaQuery.of(context).size.height/7,
                        child: Text('${places[index]}에 대한 설명'),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(
                      color: Color(0xffCDAD5C),
                      thickness: 2,
                    ),
                  )
                ),
              ),
              flex: 8
          ),
          Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Color(0xffFDFAF4),
                child: ListView.separated(
                  padding: const EdgeInsets.all(15),
                  itemCount: user.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black45, width: 2)
                      ),
                      alignment: Alignment.centerLeft,
                      height: MediaQuery.of(context).size.height/12,
                      child: Column(
                        children: [
                          Text(' ${user[index]} :'),
                          Text('   ${comment[index]}')
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                )
              ),
              flex: 6
          )
        ],
      ),
    );
  }
}