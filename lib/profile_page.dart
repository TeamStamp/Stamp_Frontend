/*
 <Profile 탭 구현 페이지>

 23.03.25
  - 코드 수정하면서 혹시 팀원들도 알아야 할 내용 있을 시 여기에 적고 날짜 최신화 좀 해줘 얘들아 (이 줄은 지우지 말아줘)
  -

*/

import 'package:flutter/material.dart';

class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepage();
}

class _profilepage extends State<profilepage> {
  final List<String> profileplaces = <String> ['1번 장소', '2번 장소', '3번 장소', '4번 장소', '5번 장소'];
  final List<String> profileplacestoken = <String> ['1번 장소 개수', '2번 장소 개수', '3번 장소 개수', '4번 장소 개수', '5번 장소 개수'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              child:
                                  Text('최민성 님', style: TextStyle(fontSize: 20)),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,
                              child:
                                  Text('270 개', style: TextStyle(fontSize: 20)),
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
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.7,
                          right: MediaQuery.of(context).size.width * 0),
                      child: Text('정보 수정',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0,
                            right: MediaQuery.of(context).size.width * 0),
                        child: IconButton(
                          onPressed: () {
                            ProfileuserShowDialog(context);
                          },
                          icon: Icon(Icons.settings, size: 20,
                          ),
                        )),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                 Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.4,
                      child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Color(0xffCDAD5C), width: 2)
                          ),
                          child: ListView.separated(
                            padding: const EdgeInsets.all(15),
                            itemCount: profileplaces.length,
                            itemBuilder: (BuildContext context, int index){
                              return Container(
                                padding: EdgeInsets.all(5),
                                height: MediaQuery.of(context).size.height*0.05,
                                child: Row(
                                  children: [
                                    Text('${profileplaces[index]}에 대한 설명'),
                                    SizedBox(width: 40,),
                                    Text('${profileplacestoken[index]}에 대한 설명'),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) => const Divider(
                              color: Color(0xffCDAD5C),
                              thickness: 2,
                            ),
                          )
                      ),
                    ),


                /*
                SingleChildScrollView(
                  child: Container(padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black, width: 2)),
                      child: DataTable(

                        dataRowHeight: 50,
                        dividerThickness: 2,

                        columns: const [
                          DataColumn(label: Text('코스')),
                          DataColumn(label: Text('개수')),
                        ],
                        rows: const [
                          DataRow(cells: [
                            DataCell(Text('용인시 기흥구')),
                            DataCell(Text('1 / 30')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('용인시 기흥구')),
                            DataCell(Text('1 / 30')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('용인시 기흥구')),
                            DataCell(Text('1 / 30')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('용인시 기흥구')),
                            DataCell(Text('1 / 30')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('용인시 기흥구')),
                            DataCell(Text('1 / 30')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('용인시 기흥구')),
                            DataCell(Text('1 / 30')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('용인시 기흥구')),
                            DataCell(Text('1 / 30')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('용인시 기흥구')),
                            DataCell(Text('1 / 30')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('용인시 기흥구')),
                            DataCell(Text('1 / 30')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('용인시 기흥구')),
                            DataCell(Text('1 / 30')),
                          ]),
                        ],
                      )),
                )*/

              ],
            ),

        ),
      ],
    ));
  }

  Future<dynamic> ProfileuserShowDialog(BuildContext context) {
    return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Color(0xffF9F3E7),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  content: SingleChildScrollView(
                                    child: Form(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Text(
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black),
                                                  '회원정보 수정'),
                                              SizedBox(
                                                width: 50,
                                                child: Align(
                                                  alignment: Alignment.centerRight,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                    icon: Icon(Icons.exit_to_app_rounded),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                          Container(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  flex: 5,
                                                  child:
                                                    Text('새로운 닉네임 :'),
                                                ),
                                                SizedBox(width: 10,),
                                                Flexible(
                                                  flex: 6,
                                                    child: TextFormField(
                                                      textAlign: TextAlign.left,
                                                      decoration: const InputDecoration(
                                                          contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                                          border: OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius.all(Radius.circular(20.0)),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius:BorderRadius.all(Radius.circular(20.0)),
                                                              borderSide:BorderSide(width: 1, color: Colors.blue))),
                                                    ),)
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                          Container(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  flex: 5,
                                                  child:
                                                  Text('기존 비밀번호 :'),
                                                ),
                                                SizedBox(width: 10,),
                                                Flexible(
                                                  flex: 6,
                                                  child: TextFormField(
                                                    textAlign: TextAlign.left,
                                                    decoration: const InputDecoration(
                                                        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                                        border: OutlineInputBorder(
                                                          borderRadius:
                                                          BorderRadius.all(Radius.circular(20.0)),
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius:BorderRadius.all(Radius.circular(20.0)),
                                                            borderSide:BorderSide(width: 1, color: Colors.blue))),
                                                  ),)
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                          Container(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  flex: 5,
                                                  child:
                                                  Text('신규 비밀번호 :'),
                                                ),
                                                SizedBox(width: 10,),
                                                Flexible(
                                                  flex: 6,
                                                  child: TextFormField(
                                                    textAlign: TextAlign.left,
                                                    decoration: const InputDecoration(
                                                        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                                        border: OutlineInputBorder(
                                                          borderRadius:
                                                          BorderRadius.all(Radius.circular(20.0)),
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius:BorderRadius.all(Radius.circular(20.0)),
                                                            borderSide:BorderSide(width: 1, color: Colors.blue))),
                                                  ),)
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                          Container(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  flex: 5,
                                                  child:
                                                  Text('비밀번호 확인 :'),
                                                ),
                                                SizedBox(width: 10,),
                                                Flexible(
                                                  flex: 6,
                                                  child: TextFormField(
                                                    textAlign: TextAlign.left,
                                                    decoration: const InputDecoration(
                                                        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                                        border: OutlineInputBorder(
                                                          borderRadius:
                                                          BorderRadius.all(Radius.circular(20.0)),
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius:BorderRadius.all(Radius.circular(20.0)),
                                                            borderSide:BorderSide(width: 1, color: Colors.blue))),
                                                  ),)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    Center(
                                      child: Container(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xffFFF3D3)),
                                          child: const Text('확인',
                                              style: TextStyle(color: Colors.black)),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              });
  }
}
final ProfileItem = {
  "list": [
    {"course": "용인시 기흥구", "point": "1/30"},
    {"course": "용인시 기흥구", "point": "1/30"},
    {"course": "용인시 기흥구", "point": "1/30"},
    {"course": "용인시 기흥구", "point": "1/30"},
    {"course": "용인시 기흥구", "point": "1/30"},
    {"course": "용인시 기흥구", "point": "1/30"},
    {"course": "용인시 기흥구", "point": "1/30"},
    {"course": "용인시 기흥구", "point": "1/30"},
  ]
};