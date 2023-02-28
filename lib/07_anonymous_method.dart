import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Gunakan Anonymous Method ketika Method tersebeut hanya digunakan sekali saja
  // Dan tidak dipanggil di tempat lain
  int number = 1;
  String message = "Ini adalah text";

  // Bisa langsung di taruh pada event onPressed
  // void pressedButton() {
  //   setState(() {
  //     message = "Pressed button";
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("07. Anonymous Method"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(message),
              ElevatedButton(
                child: Text("Press me"),
                onPressed: () {
                  setState(() {
                    message = "Pressed button ${number.toString()} times";
                    number++;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
