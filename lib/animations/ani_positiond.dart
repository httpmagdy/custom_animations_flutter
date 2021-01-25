import 'package:flutter/material.dart';

class AniPositiondPage extends StatefulWidget {
  @override
  _AniPositiondPageState createState() => _AniPositiondPageState();
}

class _AniPositiondPageState extends State<AniPositiondPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  // double moveing = 0;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    final curveAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);

    animation = Tween<double>(begin: 0, end: 65).animate(curveAnimation)
      ..addListener(() {
        setState(() {
          // moveing = animation.value;
        });
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
        child: Container(
          height: 80,
          // color: Colors.yellowAccent,
          // height: 100,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AnimatedPositioned(
                top: animation.value,
                child: Image.asset(
                  'assets/logo.PNG',
                  width: 35,
                ),
                duration: Duration(seconds: 5),
              ),
              Text(
                'Crazy Idea Com ❤',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ],
          ),
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
