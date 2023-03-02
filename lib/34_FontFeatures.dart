import 'dart:ui';

import 'package:flutter/material.dart';

// https://learn.microsoft.com/en-us/typography/opentype/spec/featurelist

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("34. Font Features (Flutter 1.7)"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Contoh 01 (tanpa apapun)",
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                "Contoh 02 (Small Caps)",
                style: TextStyle(
                  fontSize: 20,
                  fontFeatures: [
                    FontFeature.enable('smcp'),
                  ],
                ),
              ),
              const Text(
                "Contoh 03 (Frac)",
                style: TextStyle(
                  fontSize: 20,
                  fontFeatures: [
                    FontFeature.enable('smcp'),
                    FontFeature.enable('frac')
                  ],
                ),
              ),
              const Text(
                "Contoh 04 (tabularFigures)",
                style: TextStyle(
                  fontSize: 20,
                  fontFeatures: [
                    FontFeature.tabularFigures(),
                    // FontFeature.enable('smcp'),
                    // FontFeature.enable('frac')
                  ],
                  fontFamily: "EBGaramond",
                ),
              ),
              Text(
                "Contoh 05 (Style set nomor 5)",
                style: TextStyle(
                  fontSize: 20,
                  fontFeatures: [
                    FontFeature.stylisticSet(7),
                  ],
                  fontFamily: "EBGaramond",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
