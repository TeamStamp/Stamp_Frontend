/*
 <Profile 탭 구현 페이지>

 23.03.25
  - 코드 수정하면서 혹시 팀원들도 알아야 할 내용 있을 시 여기에 적고 날짜 최신화 좀 해줘 얘들아 (이 줄은 지우지 말아줘)
  -

*/

import 'package:flutter/material.dart';

class rankpopuppage extends StatefulWidget {
  const rankpopuppage({Key? key}) : super(key: key);

  @override
  State<rankpopuppage> createState() => _rankpopuppage();
}

class _rankpopuppage extends State<rankpopuppage> {
  final List<String> profileplaces = <String>[
    '1번 장소',
    '2번 장소',
    '3번 장소',
    '4번 장소',
    '5번 장소',
    '6번 장소',
    '7번 장소'
  ];
  final List<String> profileplacestoken = <String>[
    '1번 장소 개수',
    '2번 장소 개수',
    '3번 장소 개수',
    '4번 장소 개수',
    '5번 장소 개수',
    '6번 장소 개수',
    '7번 장소 개수'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration:
                BoxDecoration(border: Border.all(color: Color(0xffC5C2B3))),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: double.infinity,
                        color: Color(0xffF6F3E0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xffC5C2B3))),
                          margin: EdgeInsets.fromLTRB(60, 25, 0, 25),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            margin: EdgeInsets.fromLTRB(7, 10, 10, 0),
                            child: Image(
                              image: AssetImage('images/user_icon.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: double.infinity,
                        color: Color(0xffF6F3E0),
                        child: Container(
                          color: Color(0xffF6F3E0),
                          margin: EdgeInsets.fromLTRB(30, 30, 50, 30),
                          child: Column(
                            children: [
                              Flexible(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text('최민성 님',
                                      style: TextStyle(fontSize: 20)),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text('270 개',
                                      style: TextStyle(fontSize: 20)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(10, 40, 10, 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border:
                            Border.all(color: Color(0xffCDAD5C), width: 2)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                              child: Row(
                                children: const [
                                  Expanded(
                                      flex: 3,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text('코스'))),
                                  VerticalDivider(
                                    color: Color(0xffCDAD5C),
                                    thickness: 2,
                                  ),
                                  Expanded(child: Text('개수')),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Color(0xffCDAD5C),
                              thickness: 2,
                              height: 0,
                            ),
                            Expanded(
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: profileplaces.length ,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 60,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: Padding(
                                                padding: EdgeInsets.only(left: 10),
                                                child: Text('${profileplaces[index ]}'))),
                                        const VerticalDivider(
                                          color: Color(0xffCDAD5C),
                                          thickness: 2,
                                        ),
                                        Expanded(child: Text('${profileplacestoken[index ]}')),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) =>
                                const Divider(
                                  color: Color(0xffCDAD5C),
                                  thickness: 2,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
