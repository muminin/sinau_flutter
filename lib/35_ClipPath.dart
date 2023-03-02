import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("35. ClipPath"),
        ),
        body: Center(
          child: ClipPath(
            clipper: MyClipper(),
            child: const Image(
              width: 350,
              image: AssetImage("assets/images/anushka_sharma.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    // path.quadraticBezierTo(
    //     size.width / 2, size.height * 0.75, size.width, size.height);
    path.conicTo(
        size.width / 2, size.height * 0.75, size.width, size.height, 100);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
