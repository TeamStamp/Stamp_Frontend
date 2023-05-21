/*
 <고정적인 상단 AppBar & 하단 NavigationBar 구현 페이지, bady 부분은 다른 추가적인 .dart 파일들로 구현>

 23.03.25
  - 코드 수정하면서 혹시 팀원들도 알아야 할 내용 있을 시 여기에 적고 날짜 최신화 좀 해줘 얘들아 (이 줄은 지우지 말아줘)
  -

*/

import 'package:flutter/material.dart';
import 'package:stamp_front/stamp_page.dart';
import 'package:stamp_front/profile_page.dart';
import 'package:stamp_front/home_page.dart';


class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  int _selectedIndex = 1;

  final List<Widget> _widgetOptions = <Widget>[
    stamppage(),
    HomePage(),
    profilepage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(false);
      },
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/12),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: Image(
                image: AssetImage('images/logo_appbar.png'),
                height: MediaQuery.of(context).size.height/20,
              ),
            ),
          ),
          body: SafeArea(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            backgroundColor: Color(0xffF8BD53),
            elevation: 5,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.task_alt), label: 'Stamp'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle), label: 'Profile'),
            ],
          )
      ),
    );
  }

  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

}
