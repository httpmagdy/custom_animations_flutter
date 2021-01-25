import 'package:flutter/material.dart';
import 'dart:math';

class AniRotatePage extends StatefulWidget {
  @override
  _AniRotatePageState createState() => _AniRotatePageState();
}

class _AniRotatePageState extends State<AniRotatePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    final curveAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);

    animation = Tween<double>(begin: 0, end: (2 * pi)).animate(curveAnimation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed)
          animationController.reverse();
        else if (status == AnimationStatus.dismissed)
          animationController.forward();
      });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: animation.value,
              child: Image.asset(
                'assets/logo.PNG',
                width: 90,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Crazy Idea Com ❤',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
