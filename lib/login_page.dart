/*
 <로그인 & 회원가입 구현 페이지, 도장깨기 앱의 가장 첫 화면>

 23.03.25
  - 코드 수정하면서 혹시 팀원들도 알아야 할 내용 있을 시 여기에 적고 날짜 최신화 좀 해줘 얘들아 (이 줄은 지우지 말아줘)
  - validateAndSave 기능 잘 몰라서 로그인 버튼 눌렀을 때 onPressed() 안에서 validateAndSave 실행 되는거 일단 지우고
    intent로 다음 페이지 넘기기 해놨거든? 나중에 수정할 때 잘 만져서 validateAndSave도 다시 추가해줘 @김민
  - 로고 .png파일 추가 했는데도 깨지는데 손 좀 봐줘 @김민
 23.03.26
  - 영훈이가 만들어 놓은 images 파일이랑 민이가 만들어 놓은 assets 파일 달라서 그거 하나 수정했음

*/

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:stamp_front/Models/Post.dart';
import 'package:stamp_front/main_page.dart';
import 'package:stamp_front/repository/auth_repository.dart';

void main() {
  runApp(const StampApp());
}

class FallbackUtf8Decoder extends Converter<List<int>, String> {
  const FallbackUtf8Decoder();

  @override
  String convert(List<int> input) {
    try {
      return utf8.decode(input, allowMalformed: true);
    } catch (e) {
      return utf8.decode(input, allowMalformed: false);
    }
  }
}

class StampApp extends StatelessWidget {
  const StampApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        backgroundColor: Color(0xffF8BD53),
        elevation: 5,
        centerTitle: true,
      )),
      home: new loginpage(),
    );
  }
}

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final authRepository = AuthRepository();
  final formKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();


  late String _id;
  late String _password;

  void validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      print('Form is valid Email: $_id, password: $_password');
    } else {
      print('Form is invalid Email: $_id, password: $_password');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'images/logo_main.png',
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 1,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) => value!.isEmpty ? 'ID를 입력해 주세요' : null,
                  onSaved: (value) => _id = value!,
                  textAlign: TextAlign.end,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      filled: true,
                      hintText: 'ID',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.blue))),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) =>
                      value!.isEmpty ? 'PASSWORD를 입력해 주세요!' : null,
                  onSaved: (value) => _id = value!,
                  textAlign: TextAlign.end,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      filled: true,
                      hintText: 'PASSWORD',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.blue))),
                  obscureText: true,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.3,
                    right: MediaQuery.of(context).size.width * 0.3),
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final result = await authRepository.login(
                          emailController.text, passwordController.text);
                      if (result) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mainpage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Color(0xffF8BD53),
                          behavior: SnackBarBehavior.floating,
                          content: const Text("ID, PW를 확인하세요"),
                          action: SnackBarAction(
                            label: '확인',
                            textColor: Colors.black,
                            onPressed: () {},
                          ),
                        ));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF8BD53),
                  ),
                  child:
                      const Text(style: TextStyle(color: Colors.black), '로그인'),
                ),
              ),
              // ElevatedButton(
              //     onPressed: () async {
              //       posts.addAll(await authRepository.apiTest());
              //       setState(() {});
              //     },
              //     child: Text('test')),
              // ListView.builder(
              //   shrinkWrap: true,
              //   itemBuilder: (context, index) => Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text('타이틀' + posts[index].title),
              //       Text('유저id' + posts[index].userId.toString()),
              //       Text('완성:' + posts[index].completed.toString()),
              //       SizedBox(height: 8,),
              //       Divider(),
              //     ],
              //   ),
              //   itemCount: posts.length,
              // ),
              // 회원가입 창
              Container(
                child: TextButton(
                  child:
                      const Text(style: TextStyle(color: Colors.black), '회원가입'),
                  onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>register_page()));
                    showRegisterDialog(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showRegisterDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xffF9F3E7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: SingleChildScrollView(
              child: Form(
                key: registerFormKey,
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
                            '회원가입'),
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0,
                          right: MediaQuery.of(context).size.width * 0.5),
                      child: Text('닉네임',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      child: TextFormField(
                        controller: usernameController,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.blue))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0,
                          right: MediaQuery.of(context).size.width * 0.5),
                      child: Text('아이디',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      child: TextFormField(
                        controller: emailController,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.blue))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0,
                          right: MediaQuery.of(context).size.width * 0.47),
                      child: Text('비밀번호',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      child: TextFormField(
                        controller: passwordController,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.blue))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0,
                          right: MediaQuery.of(context).size.width * 0.4),
                      child: Text('비밀번호 확인',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    TextFormField(
                      controller: passwordConfirmController,
                      textAlign: TextAlign.left,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '값을 입력해주세요';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.blue))),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Center(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () async {
                        if (registerFormKey.currentState!.validate()) {
                          await authRepository.register(usernameController.text,
                              emailController.text, passwordController.text);
                          Navigator.pop(context);
                        }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFFF3D3)),
                    child:
                        const Text('확인', style: TextStyle(color: Colors.black)),
                  ),
                ),
              )
            ],
          );
        });
  }
}
