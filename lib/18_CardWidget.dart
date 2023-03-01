import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("18. Card Widget"),
        ),
        backgroundColor: const Color(0xff0080ff),
        body: Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: ListView(
            children: [
              buildCard(Icons.access_alarm, 'Access Alarm'),
              buildCard(Icons.ac_unit, 'AC Unit'),
              buildCard(Icons.abc, 'ABC'),
              buildCard(Icons.access_time, 'Access Time'),
            ],
          ),
        ),
      ),
    );
  }
}

Card buildCard(IconData iconData, String text) {
  return Card(
    elevation: 5,
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          child: Icon(
            iconData,
            color: const Color(0xff0080ff),
          ),
        ),
        Text(text),
      ],
    ),
  );
}
