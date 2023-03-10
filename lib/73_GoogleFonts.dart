import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.srirachaTextTheme().copyWith(
          labelSmall: GoogleFonts.oswald(),
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final Color fontColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text("73. Google Fonts"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Text(
                "Nimanchan",
                style: TextStyle(
                  color: fontColor,
                  fontSize: 40,
                ),
              ),
              Text(
                "OOOOOOOOOKKEEEEEE",
                style: Theme.of(context).textTheme.labelSmall.copyWith(
                      color: fontColor,
                      fontSize: 40,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
