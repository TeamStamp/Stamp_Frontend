/*
 <Profile 탭 구현 페이지>

 23.03.25
  - 코드 수정하면서 혹시 팀원들도 알아야 할 내용 있을 시 여기에 적고 날짜 최신화 좀 해줘 얘들아 (이 줄은 지우지 말아줘)
  -

*/

import 'package:flutter/material.dart';
import 'package:stamp_front/repository/auth_repository.dart';
import 'Models/ReadUser.dart';
import 'Models/Update.dart';

class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepage();
}

class _profilepage extends State<profilepage> {
  final authRepository = AuthRepository();
  final usernameController = TextEditingController();

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


   late Future<ReadUser> readuser;
   late Future<Update> fetchAlbum;
  @override
  void initState() {
    super.initState();
    readuser = authRepository.readUserInfo();
    fetchAlbum  = authRepository.fetchalbum();
  }

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
                                  child: FutureBuilder<ReadUser>(
                                    future: readuser,
                                    builder: (context, snapshot){
                                      if(snapshot.hasData){
                                        return Text(snapshot.data!.username);
                                      }else{
                                        return Text('줫까세요');
                                      }
                                    },
                                  )
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('정보 수정',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0,
                              right: MediaQuery.of(context).size.width * 0),
                          child: IconButton(
                            onPressed: () {
                              ProfileuserShowDialog(context);
                            },
                            icon: Icon(
                              Icons.settings,
                              size: 20,
                            ),
                          )),
                    ],
                  ),
                  Expanded(
                    child: Container(
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

  Future<dynamic> ProfileuserShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xffF9F3E7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
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
                            child: Text('새로운 닉네임 :'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 6,
                            child: TextFormField(
                              controller: usernameController,
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 4.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.blue))),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Container(
                      child: Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: Text('기존 비밀번호 :'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 6,
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 4.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.blue))),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Container(
                      child: Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: Text('신규 비밀번호 :'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 6,
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 4.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.blue))),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Container(
                      child: Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: Text('비밀번호 확인 :'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 6,
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 4.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.blue))),
                            ),
                          )
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
                  child: FutureBuilder<Update>(
                    future: fetchAlbum,
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.done){
                        if(snapshot.hasData){
                          return ElevatedButton(
                            onPressed: () {
                              setState(() {
                                fetchAlbum = authRepository.updatealbum(usernameController.text);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffFFF3D3)),
                            child:
                            const Text('확인', style: TextStyle(color: Colors.black)),
                          );
                        }else if(snapshot.hasError){
                          return Text('${snapshot.error}');
                        }
                      }
                      return const CircularProgressIndicator();
                    }
                  ),
                ),
              )
            ],
          );
        });
  }
}
