import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = "Hasil QR Scan";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("33. Membaca (scan) QR Code "),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  text = await scanner.scan();
                  setState(() {});
                },
                child: Text("Scan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
