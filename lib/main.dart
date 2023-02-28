import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("04. Row and Column"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Kolom 1"),
            Text("Kolom 2"),
            Text("Kolom 3"),
            Row(
              children: <Widget>[
                Text("Kolom 4"),
                Text("Kolom 5"),
                Text("Kolom 6"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
