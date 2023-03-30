/*
  23.03.30
    - 바텀 네비게이션 바를 유지하고 넘어가야 하는데 모르겠음 (도와줘요 영훈몬)





 */

import 'package:flutter/material.dart';

class coursepage extends StatefulWidget {
  const coursepage({Key? key}) : super(key: key);

  @override
  State<coursepage> createState() => _coursepageState();
}

class _coursepageState extends State<coursepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/12),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffF8BD53),
          elevation: 5,
          centerTitle: true,
          title: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height/20,
            color: Color(0xffF8BD53),
            child: Image(
              image: AssetImage('images/logo_appbar.png'),
              width: double.infinity,
              height: MediaQuery.of(context).size.height/20,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(child: Container(color: Colors.red,), flex: 1,),
          Flexible(child: Container(color: Colors.orange,), flex: 6,),
          Flexible(child: Container(color: Colors.green,), flex: 7,),
          Flexible(child: Container(color: Colors.blue,), flex: 6,)
        ],
      ),
    );
  }
}
