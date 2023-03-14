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
        title: const Text("Contoh"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: getColor(75, 75),
          ),
        ),
      ),
    );
  }

  Color getColor(int nilai, int nilaiMax) {
    return (nilai > (nilaiMax / 8) * 7)
        ? const Color(0xffd73027)
        : (nilai > (nilaiMax / 8) * 6)
            ? const Color(0xfff46f43)
            : (nilai > (nilaiMax / 8) * 5)
                ? const Color(0xfffdae61)
                : (nilai > (nilaiMax / 8) * 4)
                    ? const Color(0xfffee08b)
                    : (nilai > (nilaiMax / 8) * 3)
                        ? const Color(0xffd9ef8b)
                        : (nilai > (nilaiMax / 8) * 2)
                            ? const Color(0xffa6d96a)
                            : (nilai > (nilaiMax / 8) * 1)
                                ? const Color(0xff66bd63)
                                : const Color(0xff1a9850);
  }
}
