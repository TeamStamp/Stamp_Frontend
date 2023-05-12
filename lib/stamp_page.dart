/*
 <Stamp 탭 구현 페이지>

 23.03.25
  - 코드 수정하면서 혹시 팀원들도 알아야 할 내용 있을 시 여기에 적고 날짜 최신화 좀 해줘 얘들아 (이 줄은 지우지 말아줘)

 23.04.18 @의정
  - 랭킹 페이지 작성
  - 수정해야하는 것: 팝업창 띄울시에 팝업창 추가, 1~3등, 4~10등 데이터 따로 받기 가능? 불가능하면 수정
  - 혹시 오류나면 말해줭
*/

import 'package:flutter/material.dart';
import 'package:stamp_front/rank_popup_page.dart';

class stamppage extends StatelessWidget {
  const stamppage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListViewPage();
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  // 4등부터 10등까지 데이터 받아오기, 1~3등은 리스트뷰x 따로
  var nameList = [
    '김영훈',
    '김경모',
    '이도흔',
    '진다영',
    '윤준서',
    '김현우',
    '김의정'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Flexible(         //타이틀 Container, Flex 1
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: Text('Ranking',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)
                  ),
                ),
              ),
            ),


            Flexible(         //1등 2등 3등 Container, Flex 3
              flex: 4,
              child: Container(
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        child: Image(
                          image: AssetImage('images/Ranking.png'),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 21, right: 30),
                                child: Container(
                                  child: Text('2등 이름',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Container(
                                  child: Text('1등 이름',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 21, left:30),
                                child: Container(
                                  child: Text('3등 이름',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54),
                                      ),
                                ),
                              ),
                            ],
                          )
                        ),
                      )
                    ],
                  ),
                )
              ),
            ),


            Flexible(         //4등~ ListView Container, Flex 3
              flex: 4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: ListView.separated(
                  itemCount: nameList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => rankpopuppage()),
                        );
                      },
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                              nameList[index],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                              textAlign: TextAlign.center)
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    height: 8,
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}