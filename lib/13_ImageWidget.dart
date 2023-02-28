import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("13. Image Widget"),
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.blueAccent.shade100,
                width: 200,
                height: 200,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(5),
                child: const Image(
                  image: NetworkImage("https://i.mydramalist.com/R74zz_5c.jpg"),
                  fit: BoxFit.contain,
                  repeat: ImageRepeat.noRepeat,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.greenAccent.shade200,
                width: 300,
                height: 300,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(5),
                child: const Image(
                  image: AssetImage("assets/images/anushka_sharma.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
