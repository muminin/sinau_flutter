import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  bool isOn = false;

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("nama", controller.text);
    pref.setBool("on", isOn);
  }

  Future<String> getNama() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getString("nama") ?? "No Name";
  }

  Future<bool> getOn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getBool("on") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "41. Shared Preferences & Double Question Mark Operator (??)",
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  controller: controller,
                ),
              ),
              Switch(
                value: isOn,
                onChanged: (newValue) {
                  setState(() {
                    isOn = newValue;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  saveData();
                },
                child: const Text("Save"),
              ),
              ElevatedButton(
                onPressed: () {
                  getNama().then((value) {
                    controller.text = value;
                    setState(() {});
                  });

                  getOn().then((value) {
                    isOn = value;
                    setState(() {});
                  });
                },
                child: const Text("Load"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
