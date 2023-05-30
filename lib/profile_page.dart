/*
 <Profile 탭 구현 페이지>

 23.03.25
  - 코드 수정하면서 혹시 팀원들도 알아야 할 내용 있을 시 여기에 적고 날짜 최신화 좀 해줘 얘들아 (이 줄은 지우지 말아줘)
  -

*/
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stamp_front/repository/auth_repository.dart';
import 'Models/Post.dart';
import 'Models/ReadUser.dart';
import 'Models/Update.dart';
import 'dart:ffi';
import 'package:image_picker/image_picker.dart';

class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepage();
}


class _profilepage extends State<profilepage> {
  final authRepository = AuthRepository();
  final profileformKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final newpasswordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

   late Future<ReadUser> readuser;
   late Future<Update> fetchAlbum;
   late Future<List<Post>> post;
  var A = '비밀번호 불일치';
  @override
  void initState() {
    super.initState();
    post = authRepository.Course_List();
    readuser = authRepository.readUserInfo();
    fetchAlbum  = authRepository.fetchalbum();
  }
  Future<File?> getImageFileFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
  void handleUploadButton() async {
    File? imageFile = await getImageFileFromGallery();

    if (imageFile != null) {
      await authRepository.uploadImage(imageFile);
      print('이미지 업로드 완료');
    } else {
      print('이미지 파일을 선택하지 않았습니다.');
    }
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
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: FutureBuilder<ReadUser>(
                              future: readuser,
                              builder: (context, snapshot){
                                if (snapshot.hasData) {
                                  if (snapshot.data!.imgUrl != null) {
                                    return Image.network(snapshot.data!.imgUrl!);
                                  } else {
                                    return IconButton(
                                      icon: Icon(Icons.upload),
                                      onPressed: handleUploadButton,
                                    );
                                  }
                                } else if (snapshot.hasError) {
                                  return CircularProgressIndicator();
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            )
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
                                        return Text(snapshot.data!.nickname!+' 님', style: TextStyle(fontSize: 20));
                                      }else{
                                        return CircularProgressIndicator();
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
                                  child: FutureBuilder<ReadUser>(
                                    future: readuser,
                                    builder: (context, snapshot) {
                                      if(snapshot.hasData){
                                      return Text(snapshot.data!.stamp.toString()+' 개',
                                          style: TextStyle(fontSize: 20));}
                                      else{
                                        return CircularProgressIndicator();
                                      }
                                    }
                                  ),
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
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text('코스'))),
                              VerticalDivider(
                                color: Color(0xffCDAD5C),
                                thickness: 2,
                              ),
                              Expanded(child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                  child: Text('개수'))),
                            ],
                          ),
                        ),
                            const Divider(
                              color: Color(0xffCDAD5C),
                              thickness: 2,
                              height: 0,
                            ),
                            Expanded(
                              child: FutureBuilder<List<Post>>(
                                future: post,
                                builder: (context, snapshot) {
                                  if(snapshot.hasData) {
                                    return ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        return SizedBox(
                                          height: 60,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                          padding: EdgeInsets.only(
                                                              left: 15),
                                                          child: Text('${snapshot.data![index].crsName}'))),
                                                  const SizedBox(
                                                    height: 60,
                                                    child: VerticalDivider(
                                                      color: Color(0xffCDAD5C),
                                                      thickness: 2,
                                                    ),
                                                  ),
                                                  Expanded(child: Padding(
                                                      padding: EdgeInsets.only(left: 10),
                                                      child: Text('${snapshot.data![index].stamp} 개'))),
                                                ],
                                              ),
                                              const Divider(
                                                color: Color(0xffCDAD5C),
                                                thickness: 2,
                                                height: 0,
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
                              )
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
            content: FutureBuilder<Update>(
              future: fetchAlbum,
              builder: (context, snapshot) {
                return SingleChildScrollView(
                  child: Form(
                    key: profileformKey,
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
                                  validator: (value) =>
                                  value!.isEmpty ? '새로운 닉네임을 입력해 주세요!' : null,
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
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return '값을 입력해주세요';
                                    } else{
                                      return null;
                                    }
                                  },
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
                                  controller: newpasswordController,
                                  validator: (value) =>
                                  value!.isEmpty ? '새로운 비밀번호를 입력해 주세요!' : null,
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
                                  controller: passwordConfirmController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return '값을 입력해주세요';
                                    }else if(newpasswordController.text != passwordConfirmController.text){
                                      return '비밀번호가 일치하지 않습니다.';
                                    }else{
                                      return null;
                                    }
                                  },
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
                                  obscureText: true,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),
            actions: [
              Center(
                child: Container(
                      child:  ElevatedButton(
                                onPressed: () {
                                setState(() {
                                    if(profileformKey.currentState!.validate()){
                                      if(newpasswordController.text == passwordConfirmController.text){
                                        fetchAlbum = authRepository.updatealbum(
                                            usernameController.text,
                                            newpasswordController.text);
                                        A = '';
                                        Navigator.pop(context);
                                      }else{
                                        A = '비밀번호 불일치';
                                      }
                                    }
                                });
                                  },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffFFF3D3)),
                                child: const Text(
                                    '확인', style: TextStyle(color: Colors.black)),
                              )
                    )
              )
            ],
          );
        });
  }
}
