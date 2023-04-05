import 'package:flutter/material.dart';

class mappage extends StatelessWidget {
  const mappage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Center(
          child: ElevatedButton(
            child: Text('지도'),
            onPressed: () {},
          )),
    );
  }
}
