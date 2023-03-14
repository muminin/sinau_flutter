import 'dart:math';

import 'package:flutter/material.dart';

/// Usage:
/// 1. SingleTickerProviderStateMixin
/// 2. AnimationController
/// 3. Animation

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    // * Befungsi menciptakan Nilai from Begin to End Animation
    animation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(animationController)
      ..addListener(() {
        // * Listener adalah perintah yang akan dilakukan setiap kali Tween menghasilkan Nilai
        setState(() {});
      })
      ..addStatusListener((status) {
        // * status akan menunjukkan status dari Listener
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("80. Animasi Dasar"),
      ),
      body: Center(
        child: Transform.rotate(
          angle: animation.value,
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              gradient: LinearGradient(
                colors: <Color>[Colors.red, Colors.amber],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
