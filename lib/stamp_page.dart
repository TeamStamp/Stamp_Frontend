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
import 'package:stamp_front/repository/Rank_repository.dart';

import 'Models/Rank.dart';

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
  final rankRepository = RankRepository();

  late Future<List<Rank>> rank;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    rank = rankRepository.Rank_List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: rank,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Column(
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
                                            child: Text('${snapshot.data![1].nickName!}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 12),
                                          child: Container(
                                            child: Text(''+snapshot.data![0].nickName!,
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
                                            child: Text('${snapshot.data![2].nickName!}',
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


                  Flexible(
                    flex: 5,
                      child: Container(
                        height: 400,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
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
                                      flex: 2,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text('등수'))),
                                  VerticalDivider(
                                    color: Color(0xffCDAD5C),
                                    thickness: 2,
                                  ),
                                  Expanded(
                                      flex: 4,
                                      child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text('닉네임'))),
                                  VerticalDivider(
                                    color: Color(0xffCDAD5C),
                                    thickness: 2,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text('총 개수'))),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Color(0xffCDAD5C),
                              thickness: 2,
                              height: 0,
                            ),
                            Expanded(
                              child: FutureBuilder<List<Rank>>(
                                future: rank,
                                builder: (context, snapshot) {
                                  if(snapshot.hasData) {
                                    var num=3;
                                    return ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        var num1 = 4 + index;
                                        return SizedBox(
                                            height: 60,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                            padding: EdgeInsets.only(
                                                                left: 20),
                                                            child: Text('$num1 등'))),
                                                    const SizedBox(
                                                      height: 60,
                                                      child: VerticalDivider(
                                                        color: Color(0xffCDAD5C),
                                                        thickness: 2,
                                                      ),
                                                    ),
                                                    Expanded(
                                                        flex: 4,
                                                        child: Padding(
                                                        padding: EdgeInsets.only(left: 10),
                                                        child: Text('${snapshot.data![num].nickName}'))),
                                                    const SizedBox(
                                                      height: 60,
                                                      child: VerticalDivider(
                                                        color: Color(0xffCDAD5C),
                                                        thickness: 2,
                                                      ),
                                                    ),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                        padding: EdgeInsets.only(left: 10),
                                                        child: Text('${snapshot.data![num].stamp} 개'))),
                                                  ],
                                                ),

                                              ],
                                            )
                                        );
                                      },
                                      separatorBuilder: (BuildContext context,
                                          int index) =>
                                      const Divider(
                                        color: Color(0xffCDAD5C),
                                        thickness: 2,
                                        height: 0,
                                      ),
                                    );
                                  }else if(snapshot.hasError){
                                    return Text('error');
                                  }else{
                                    return CircularProgressIndicator();
                                  }
                                }
                          ),
                            ),]
                        ),
                      )
                  ),
                ],
              );
            }else{
              return CircularProgressIndicator();
            }
          }
        )
    );
  }
}