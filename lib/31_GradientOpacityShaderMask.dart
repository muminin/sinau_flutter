import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              "31. Gradient Opacity / Transparansi Bergradasi (ShaderMask)"),
        ),
        body: Center(
          child: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [
                  Colors.amber,
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
            },
            blendMode: BlendMode.dstIn,
            child: const Image(
              width: 300,
              image: AssetImage("assets/images/anushka_sharma.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}
