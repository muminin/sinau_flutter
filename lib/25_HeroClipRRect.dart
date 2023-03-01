import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      appBar: AppBar(
        title: const Text(
          "25. Hero & ClipRRect Widget",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const SecondPage();
            },
          ));
        },
        child: Hero(
          tag: "anushka_sharma",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const SizedBox(
              width: 100,
              height: 100,
              child: Image(
                image: AssetImage('assets/images/anushka_sharma.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        title: const Text(
          "25. Hero & ClipRRect Widget",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: "anushka_sharma",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const SizedBox(
                width: 200,
                height: 200,
                child: Image(
                  image: AssetImage('assets/images/anushka_sharma.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
