import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  final TabBar myTab = const TabBar(
    // indicatorColor: Colors.blue,
    indicator: BoxDecoration(
      color: Colors.green,
      border: Border(
        top: BorderSide(
          color: Colors.amber,
          width: 5,
        ),
      ),
    ),
    tabs: <Widget>[
      Tab(
        icon: Icon(Icons.comment),
        text: "Comments",
      ),
      Tab(
        icon: Icon(Icons.computer),
        text: "Computers",
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.red,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            title: const Text("28. Mengubah Tampilan TabBar"),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(myTab.preferredSize.height),
              child: Container(
                color: Colors.blue,
                child: myTab,
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
