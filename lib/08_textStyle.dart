/// Buat folder fonts di root
/// register font di pubspec.yaml

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("08. TextStyle"),
        ),
        body: Center(
          child: Text(
            "niman",
            style: TextStyle(
                fontFamily: "EBGaramond",
                fontSize: 50,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.redAccent.shade100,
                decorationThickness: 3,
                decorationStyle: TextDecorationStyle.solid),
          ),
        ),
      ),
    );
  }
}
