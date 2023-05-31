/*
  23.03.30
    -
 */

import 'package:flutter/material.dart';
import 'package:stamp_front/repository/crsid_repository.dart';
import 'package:stamp_front/repository/comment_repository.dart';
import 'Models/Crsid.dart';
import 'package:stamp_front/map_page.dart';
import 'package:stamp_front/stamp_page.dart';
import 'package:stamp_front/profile_page.dart';
import 'package:stamp_front/home_page.dart';

import 'Models/Place.dart'; // Place 클래스를 import 해야 합니다.
import 'Models/Comment.dart'; // Comment 클래스를 import 해야 합니다.


class coursepage extends StatefulWidget {
  const coursepage({Key? key}) : super(key: key);

  @override
  State<coursepage> createState() => _coursepageState();
}

class _coursepageState extends State<coursepage> {
  final textController = TextEditingController();

  final List<String> user = <String> ['탐켄치', '김경모', '최민성', '임노선', '김민기'];
  final List<String> users = <String> ['탐켄치', '김경모', '최민성', '임노선', '김민기'];
  final List<String> asd = <String> [
    '카페가 너무 이뻐요',
    '애견 동반 카페 너무 좋아요...',
    '스시율 미쳤어요 ㅠㅠ',
    '공부하기 딱 좋아요 !!',

  ];

  final List<String> nums = <String> ['경양카츠', '포멜로', '몬지벨로', '아지트', '스시율'];
  final List<String> comments = <String> [
    '돈까스 전문식당',
    '파스타 전문 레스토랑',
    '애견 동반 카페',
    '스터디 카페',
    '스시/초밥집'
  ];
  final List<String> phones = <String> [
    '031-897-3133',
    '031-895-2752',
    '031-845-6687',
    '031-889-7896',
    '031-898-1125'
  ];
  final List<String> maps = <String> [
    '경기도 용인시 보정동 죽전로 15번길 7-12',
    '경기도 용인시 보정동 1189-3번지',
    '경기도 용인시 보정동 죽전로 15번길 11-5',
    '경기도 용인시 보정동 죽전로 144번길 15-10',
    '경기도 용인시 보정동 1187-8'
  ];

  int _selectedIndex = 1;

  final List<Widget> _widgetOptions = <Widget>[
    stamppage(),
    HomePage(),
    profilepage()
  ];

  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Image(
              image: AssetImage('images/logo_appbar.png'),
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 20,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  showDialog(context: context,
                      barrierDismissible: true,
                      builder: ((context) {
                        return AlertDialog(
                          title: Text("댓글 작성", style: TextStyle(color: Color(
                              0xffCDAD5C))),
                          content: Container(
                            child: TextField(
                              controller: textController,
                              decoration: InputDecoration(
                                  labelText: '댓글을 작성해주세요.'
                              ),
                            ),
                          ),
                          actions: [
                            Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("취소"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xffCDAD5C)
                                  )
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      asd.add(textController.text);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("완료"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xffCDAD5C)
                                  )
                              ),
                            )
                          ],
                        );
                      })
                  );
                },
              )
            ]
        ),
        body: Column(
          children: [
            // 앱바 바로 밑에 위치한 카카오지하철 느낌의 로고
            Flexible(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/course_page.image01.png')
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('보정동 카페거리', textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12, color: Color(0xffCDAD5C)),),
                  ],
                ),
              ),
              flex: 2,
            ),
            Flexible(
                child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Color(0xffCDAD5C), width: 2),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/course_page.image02.png')
                        )
                    ),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(15, 0, 5, 0),
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  border: Border.all(color: Color(0xffCDAD5C),
                                      width: 2),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('images/num01.jpg')
                                  )
                              ),
                            ),
                            onTap: () {
                              double latitude = 37.275760;
                              double longitude = 127.132564;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    mappage(latitude: latitude, longitude: longitude, plcId: 9,),
                                ),
                              );
                            },
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  border: Border.all(color: Color(0xffCDAD5C),
                                      width: 2),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('images/num02.jpg')
                                  )
                              ),
                            ),
                            onTap: () {
                              double latitude = 37.5682;
                              double longitude = 126.9784;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      mappage(latitude: latitude,
                                          longitude: longitude, plcId: 9,),
                                  )
                              );
                            },
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  border: Border.all(color: Color(0xffCDAD5C),
                                      width: 2),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('images/num03.jpg')
                                  )
                              ),
                            ),
                            onTap: () {
                              double latitude = 40.7128;
                              double longitude = -74.0060;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      mappage(latitude: latitude,
                                          longitude: longitude, plcId: 9,),
                                  )
                              );
                            },
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  border: Border.all(color: Color(0xffCDAD5C),
                                      width: 2),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('images/num04.jpg')
                                  )
                              ),
                            ),
                            onTap: () {
                              double latitude = 40.7128;
                              double longitude = -74.0060;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      mappage(latitude: latitude,
                                          longitude: longitude, plcId: 9,),
                                  )
                              );
                            },
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  border: Border.all(color: Color(0xffCDAD5C),
                                      width: 2),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('images/num05.jpg')
                                  )
                              ),
                            ),
                            onTap: () {
                              double latitude = 40.7128;
                              double longitude = -74.0060;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      mappage(latitude: latitude,
                                          longitude: longitude, plcId: 9,),
                                  )
                              );
                            },
                          ),
                        ],
                      ),
                    )
                ),
                flex: 5
            ),
            Flexible(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xffCDAD5C), width: 2)
                      ),
                      child: ListView.separated(
                        padding: const EdgeInsets.all(15),
                        itemCount: nums.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(

                            height: 85,
                            child: Column(
                              children: [
                                Text('${index+1}번 장소 : ' + '${nums[index]}', style: TextStyle(fontWeight: FontWeight.bold),),
                                Text('${comments[index]}'),
                                Text('${phones[index]}'),
                                Text('${maps[index]}')
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    color: Color(0xffFDFAF4),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(15),
                      itemCount: asd.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black45, width: 2),
                          ),
                          height: MediaQuery.of(context).size.height / 12,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            alignment: Alignment.centerLeft,
                            color: Colors.black26,
                            child: Column(
                              children: [
                                Text(' ${users[index]} :\n  ${asd[index]}')
                              ],
                            ),
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
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          backgroundColor: Color(0xffF8BD53),
          elevation: 5,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.task_alt), label: 'Stamp'),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), label: 'Profile'),
          ],
        )
    );
  }

}