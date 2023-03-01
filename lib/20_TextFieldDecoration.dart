import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("20. TextField (Decoration)"),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                decoration: InputDecoration(
                  icon: const Icon(
                      Icons.person_2_outlined), // ? diluar border/input field
                  fillColor: Colors.lightBlue.shade50,
                  filled: true,
                  prefix: Container(
                    // ? jika menggunakan Prefix => prefixIcon, prefixText, prefixStyle harus dihapus
                    width: 5,
                    height: 5,
                    color: Colors.red,
                  ),
                  suffix: Container(
                    // ? sama seperti prefix namun di belakang
                    width: 5,
                    height: 5,
                    color: Colors.blue,
                  ),
                  // prefixIcon:
                  //     Icon(Icons.abc_outlined), // ? didalam border/input field
                  // prefixText: "Type here: ",
                  // prefixStyle: TextStyle(
                  //   color: Colors.blue,
                  // ),
                  labelText: "Nama Lengkap",
                  labelStyle: const TextStyle(
                    color: Colors.green,
                  ),
                  hintText: "John Doe", // placeholder
                  hintStyle: TextStyle(
                    color: Colors.blueAccent.shade200,
                    fontSize: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                maxLength: 25,
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
