import 'package:belajar_flutter/components/custom_button.dart';
import 'package:belajar_flutter/components/my_button.dart';
import 'package:belajar_flutter/styles/custom_style.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Txt(
          "62. Division (Styling Widget Inspired by CSS)",
          style: CustomStyle.txtStyle.clone()..fontSize(18),
        ),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.grey[350],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(CustomStyle.buttonStyle),
            const SizedBox(
              height: 20,
            ),
            CustomButton(CustomStyle.buttonStyle.clone()
              ..background.color(Colors.green[300])
              ..border(
                all: 3,
                color: Colors.green[900],
              )),
          ],
        ),
      ),
    );
  }
}
