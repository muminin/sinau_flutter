import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 0;
  void tekanTombol() {
    // setState: mengubah tampilan sesuai dengan Statenya
    setState(() {
      number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("06. Stateless & Stateful Widget"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                number.toString(),
                style: TextStyle(
                  fontSize: 10 + number.toDouble(),
                ),
              ),
              ElevatedButton(
                  onPressed: tekanTombol, child: Text("Tambah Bilangan"))
            ],
          ),
        ),
      ),
    );
  }
}
