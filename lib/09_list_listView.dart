import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> widgets = [];
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "09. List & ListView",
            style: TextStyle(
              fontFamily: "EBGaramond",
              fontSize: 30,
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widgets.add(Text(
                            "Data ke-${counter.toString()}",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ));
                          counter++;
                        });
                      },
                      child: Text("Add")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (counter > 1) {
                            widgets.removeLast();
                            counter--;
                          }
                        });
                      },
                      child: Text("Delete")),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widgets,
              )
            ],
          ),
        ),
      ),
    );
  }
}
