import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("29. Menampilkan QR Code"),
        ),
        body: Center(
          child: QrImage(
            version: 4,
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.black,
            errorCorrectionLevel: QrErrorCorrectLevel.M,
            padding: const EdgeInsets.all(20),
            size: 300,
            data: "www.google.com",
          ),
        ),
      ),
    );
  }
}
