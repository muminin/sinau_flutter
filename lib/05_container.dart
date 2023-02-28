import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("05. Container Widget"),
        ),
        body: Container(
          color: Colors.red,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.amber,
                      Colors.blue,
                      Colors.redAccent
                    ])),
          ),
        ),
      ),
    );
  }
}
