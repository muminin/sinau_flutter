import 'package:flutter/material.dart';

/// Ganti default Splash Screen di
/// android/app/src/res/drawable/launch_background.xml

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              "83. Mengganti Splash Screen Default Flutter (Android)"),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
