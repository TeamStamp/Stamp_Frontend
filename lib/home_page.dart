/*
 <Home 탭 구현 페이지>
 23.03.30
  - 코드 수정하면서 혹시 팀원들도 알아야 할 내용 있을 시 여기에 적고 날짜 최신화 좀 해줘 얘들아 (이 줄은 지우지 말아줘)
  - 코스페이지로 이동 버튼은 리스트뷰로 만들어진 코스들을 넣어야하지만, 아직 없어서 임의로 버튼으로 넘어가서 gui 구성 먼저 해놓으려고 만들어놨음

23.04.02
  - 코스 눌렀을 때 코스 이미지랑 세부 코스 내용 팝업창 뜨게 해놨음.
  - 리스트뷰 -> 그리드뷰로 변경 완. @의정
*/

import 'package:flutter/material.dart';
import 'package:stamp_front/course_page.dart';
import 'package:stamp_front/repository/auth_repository.dart';
import 'package:stamp_front/repository/course_repository.dart';
import 'Models/ReadUser.dart';
import 'Models/Update.dart';
import 'Models/Course.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final authRepository = AuthRepository();
  final courseRepository = CourseRepository();

  late Future<ReadUser> readuser;
  late Future<Update> fetchAlbum;
  late Future<List<Course>> course;

  bool _shouldUpdateProfile = false;

  @override
  void initState() {
    super.initState();
    readuser = authRepository.readUserInfo();
    fetchAlbum = authRepository.fetchalbum();
    course = courseRepository.readCourseInfo();
  }


  /*
  void showPopup(context, title, image, description) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 380,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                      image,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    description,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            width: MediaQuery.of(context).size.width,
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
                                  return Image(
                                    image: AssetImage('images/user_icon.png'),
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final reversedIndex = 5 - index;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => coursepage()),
                    );
                  },
                  child: Card(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Container(
                                width: MediaQuery.of(context).size.width*0.8,
                                height: MediaQuery.of(context).size.height*0.8,
                                child: FutureBuilder<List<Course>>(
                                  future: course,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final courses = snapshot.data;
                                      final course = courses![reversedIndex];
                                      if (course.imgUrl != null && course.imgUrl.isNotEmpty) {
                                        return Image.network(
                                          course.imgUrl!,
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          height: MediaQuery.of(context).size.height * 0.8,
                                        );
                                      } else {
                                        return Text('No Image');
                                      }
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  },
                                )
                            ),
                          ),
                          Flexible(
                              child: FutureBuilder<List<Course>>(
                                future: course,
                                builder: (context, snapshot){
                                  if(snapshot.hasData){
                                    return Text(snapshot.data![reversedIndex].crsName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54), textAlign: TextAlign.center,);
                                  }
                                  else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  }
                                  else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}



//버튼은 코스 페이지 gui 확인하기 위해서 만든 버튼임
/*        Container(
          child: ElevatedButton(
            child: Text('코스페이지로 이동'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => coursepage()),
              );
            },
          ),
        )
*/