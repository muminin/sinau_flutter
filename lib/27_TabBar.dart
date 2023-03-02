import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text("27. TabBar "),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.comment),
                  text: "Comments",
                ),
                Tab(
                  child: Image(
                    image: AssetImage('assets/images/anushka_sharma.jpg'),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.computer),
                ),
                Tab(
                  text: "News",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              Center(
                child: Text("Tab 1"),
              ),
              Center(
                child: Text("Tab 2"),
              ),
              Center(
                child: Text("Tab 3"),
              ),
              Center(
                child: Text("Tab 4"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
