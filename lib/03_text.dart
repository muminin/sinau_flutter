import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sinau Flutter"),
        ),
        body: Center(
            child: Container(
                color: Colors.amber,
                width: 200,
                height: 75,
                child: Text(
                  "Sedang belajar Flutter biar jadi istimewa, luar biasa dan kaya.",
                  style: TextStyle(
                      color: Colors.teal,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ))),
      ),
    );
  }
}
