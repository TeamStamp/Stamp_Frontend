/*
 <Profile 탭 구현 페이지>

 23.03.25
  - 코드 수정하면서 혹시 팀원들도 알아야 할 내용 있을 시 여기에 적고 날짜 최신화 좀 해줘 얘들아 (이 줄은 지우지 말아줘)
  -

*/

import 'package:flutter/material.dart';

class profilepage extends StatelessWidget {
  const profilepage({Key? key}) : super(key: key);

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
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Color(0xffF9F3E7),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: MediaQuery.of(context).size.width * 0.2,
                                                        right: MediaQuery.of(context).size.width * 0),
                                                    child: Text(
                                                        style: TextStyle(fontSize: 20,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black),
                                                        '회원 정보 수정'),
                                                  ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: MediaQuery.of(context).size.width * 0.05,
                                                      right: MediaQuery.of(context).size.width * 0),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                    icon: Icon(Icons.exit_to_app_rounded),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context).size.height * 0.03),
                                          Container(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                    flex: 1,
                                                    child: Text('새로운 닉네임 : ')),
                                                Flexible(
                                                  flex: 3,
                                                    child: TextFormField(
                                                      textAlign: TextAlign.left,
                                                      decoration: const InputDecoration(
                                                          border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(20.0)),
                                                          ),
                                                          filled: false,
                                                          fillColor: Colors.white,
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(20.0)),
                                                              borderSide: BorderSide(
                                                                  width: 1,
                                                                  color: Colors.blue))),
                                                    ),)
                                              ],
                                            ),
                                          ),
                                        ],
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
                          },
                          icon: Icon(Icons.settings, size: 20,
                          ),
                        )),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Color(0xffEBC668), width: 2),
                  ),
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Row(
                            children: [
                              Container(
                                child: Text('zzz'),
                                ),

                              Container(

                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                            color: Colors.black,
                            thickness: 2.0,
                        );
                      },
                      itemCount: ProfileItem.length,
                    ),
                )

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