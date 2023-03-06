import 'package:flutter/material.dart';

/// Press Ctrl+Shift+P
/// Type snip

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("55. How to Make Dart Snippet to Code Faster"),
        ),
      ),
    );
  }
}
