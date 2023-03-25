/*
 <로그인 & 회원가입 구현 페이지, 도장깨기 앱의 가장 첫 화면>

 23.03.25
  - 코드 수정하면서 혹시 팀원들도 알아야 할 내용 있을 시 여기에 적고 날짜 최신화 좀 해줘 얘들아 (이 줄은 지우지 말아줘)
  - validateAndSave 기능 잘 몰라서 로그인 버튼 눌렀을 때 onPressed() 안에서 validateAndSave 실행 되는거 일단 지우고
    intent로 다음 페이지 넘기기 해놨거든? 나중에 수정할 때 잘 만져서 validateAndSave도 다시 추가해줘 @김민
  - 로고 .png파일 추가 했는데도 깨지는데 손 좀 봐줘 @김민

*/

import 'package:flutter/material.dart';
import 'package:stamp_front/main_page.dart';

void main() {
  runApp(const StampApp());
}

class StampApp extends StatelessWidget {
  const StampApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new loginpage(),
    );
  }
}

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final formKey = GlobalKey<FormState>();

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(height: MediaQuery.of(context).size.height*0.5,'assets/logo_main.png'),
              Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.15
                    ,right:  MediaQuery.of(context).size.width*0.15),
                child: TextFormField(
                  validator: (value) =>
                  value!.isEmpty ? 'ID를 입력해 주세요' : null,
                  onSaved: (value) => _id = value!,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      filled: true,
                      hintText: 'ID',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(width: 1, color: Colors.blue))),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01),
              Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.15
                    ,right:  MediaQuery.of(context).size.width*0.15),
                child: TextFormField(
                  validator: (value) =>
                  value!.isEmpty ? 'PASSWORD를 입력해 주세요!' : null,
                  onSaved: (value) => _id = value!,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      filled: true,
                      hintText: 'PASSWORD',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(width: 1, color: Colors.blue)
                      )
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01),
              Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.3
                    ,right:  MediaQuery.of(context).size.width*0.3),
                child: ElevatedButton(
                  child: Text(style: TextStyle(color: Colors.black), '로그인'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => mainpage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF8BD53),
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  child: Text(style: TextStyle(color: Colors.black), '회원가입'),
                  onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>register_page()));
                    showDialog(
                        context: context,
                        barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
                        builder: (BuildContext context) {
                          return AlertDialog(
                            actions: [
                              Container(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Text(textAlign: TextAlign.left ,style:
                                      TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black),'회원가입'),
                                      Container(),
                                      Container(
                                        child: TextFormField(
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                              ),
                                              filled: true,
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                  borderSide: BorderSide(width: 1, color: Colors.blue)
                                              )
                                          ),
                                        ),
                                      ),
                                      Text('아이디'),
                                      Container(
                                        child: TextFormField(
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                              ),
                                              filled: true,
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                  borderSide: BorderSide(width: 1, color: Colors.blue)
                                              )
                                          ),
                                        ),
                                      ),
                                      Text('비밀번호'),
                                      Container(
                                        child: TextFormField(
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                              ),
                                              filled: true,
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                  borderSide: BorderSide(width: 1, color: Colors.blue)
                                              )
                                          ),
                                        ),
                                      ),
                                      Text('비밀번호 확인'),
                                      Container(
                                        child: TextFormField(
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                              ),
                                              filled: true,
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                  borderSide: BorderSide(width: 1, color: Colors.blue)
                                              )
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        child: const Text('확인'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}