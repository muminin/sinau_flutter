import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TextEditingController controller = TextEditingController(text: "Nilai awal"); // text: First Value
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("19. TextField Widget"),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                // obscureText: true, // untuk password
                // maxLength: 15,
                maxLines: 2,
                onChanged: (value) {
                  setState(() {});
                },
                controller: controller,
              ),
              Text(controller.text),
            ],
          ),
        ),
      ),
    );
  }
}
