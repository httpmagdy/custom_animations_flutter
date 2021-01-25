import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'animations/ani_positiond.dart';
import 'animations/ani_rotate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashbord(),
    );
  }
}

class Dashbord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 90),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AniRotatePage(),
                    ),
                  );
                },
                child: Container(
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    color: Colors.white,
                  ),
                  child: Text('Ani Rotate'),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AniPositiondPage(),
                    ),
                  );
                },
                child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45),
                      color: Colors.white,
                    ),
                    child: Text('Ani Positiond')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
