import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ApplicationColor>(
        create: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white70,
            title: Consumer<ApplicationColor>(
              builder: (context, value, child) => Text(
                "42. Provider State Management",
                style: TextStyle(color: value.color),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(
                  builder: (context, value, child) => AnimatedContainer(
                    margin: const EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    color: Colors.lightBlue,
                    duration: const Duration(milliseconds: 500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: const Text("AB"),
                    ),
                    Consumer(
                      builder: (context, value, child) => Switch(
                        value: value.isLightBlue,
                        onChanged: (newValue) {
                          value.isLightBlue = newValue;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: const Text("LB"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ApplicationColor with ChangeNotifier {
  bool _isLightBlue = true;

  bool get isLightBlue => _isLightBlue;
  set isLightBlue(bool value) {
    _isLightBlue = value;
    notifyListeners();
  }

  Color get color => (_isLightBlue) ? Colors.lightBlue : Colors.amber;
}
