import 'dart:math';

import 'package:flutter/material.dart';

/// Usage:
/// 1. AnimatedWidget
/// 2. AnimatedBuilder

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
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("81. Animated Widget & Animated Builder"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RotatingContainer(
              doubleAnimation: animation,
            ),
            RotationTransition(
              animation: animation,
              child: const Text(
                "AYEEEEE",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RotatingContainer extends AnimatedWidget {
  const RotatingContainer({Key key, Animation<double> doubleAnimation})
      : super(key: key, listenable: doubleAnimation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;

    return Transform.rotate(
      angle: animation.value,
      child: Container(
        width: 65,
        height: 65,
        color: Colors.red,
      ),
    );
  }
}

class RotationTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const RotationTransition({Key key, this.child, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: animation.value,
          child: child,
        );
      },
      child: child,
    );
  }
}
