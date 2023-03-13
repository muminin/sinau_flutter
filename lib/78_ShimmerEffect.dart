import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// shimmer: ^1.1.1

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
        title: const Text("78. Shimmer Effect"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/anushka_sharma.jpg"),
                    ),
                  ),
                ),
                Shimmer(
                  gradient: LinearGradient(
                    begin: const Alignment(-1, 0.35),
                    end: const Alignment(1, -0.35),
                    stops: const <double>[
                      0.4,
                      0.5,
                      0.6,
                    ],
                    colors: <Color>[
                      Colors.pink.withOpacity(0),
                      Colors.amber.withOpacity(0.5),
                      Colors.pink.withOpacity(0),
                    ],
                  ),
                  child: Container(
                    width: 200,
                    height: 300,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Shimmer(
              direction: ShimmerDirection.rtl,
              period: const Duration(
                seconds: 5,
              ),
              loop: 5,
              gradient: LinearGradient(
                begin: const Alignment(-1, 0.35),
                end: const Alignment(1, -0.35),
                stops: const <double>[
                  0.4,
                  0.5,
                  0.6,
                ],
                colors: <Color>[
                  Colors.orange.withOpacity(1),
                  Colors.black.withOpacity(0.75),
                  Colors.orange.withOpacity(1),
                ],
              ),
              child: const Text(
                "Anushka Sharma",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
