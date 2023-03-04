import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  bool isBlack = false;
  bool isStop = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("47. Timer"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                counter.toString(),
                style: TextStyle(
                  color: (isBlack) ? Colors.black : Colors.red,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Timer(const Duration(seconds: 5), () {
                    setState(() {
                      isBlack = !isBlack;
                    });
                  });
                },
                child: const Text("Ubah warna 5 detik kemudian"),
              ),
              ElevatedButton(
                onPressed: () {
                  Timer.run(() {
                    setState(() {
                      isBlack = !isBlack;
                    });
                  });
                },
                child: const Text("Ubah warna secara langsung"),
              ),
              ElevatedButton(
                onPressed: () {
                  counter = 0;
                  isStop = false;
                  Timer.periodic(const Duration(seconds: 1), (timer) {
                    if (isStop) timer.cancel();
                    setState(() {
                      counter++;
                    });
                  });
                },
                child: const Text("start timer"),
              ),
              ElevatedButton(
                onPressed: () {
                  isStop = true;
                },
                child: const Text("stop timer"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
