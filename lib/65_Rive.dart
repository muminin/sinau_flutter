import 'package:belajar_flutter/ui/65_switch_daynight.dart';
import 'package:flutter/material.dart';

/// https://flare.rive.app

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("65. Rive + Flutter (Flutter Interact '19)"),
      ),
      body: Center(
        child: SwitchDayNight(),
      ),
    );
  }
}
