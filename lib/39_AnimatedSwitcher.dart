import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isOn = false;
  Widget myWidget = Container(
    width: 200,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.red[100],
      border: Border.all(
        color: Colors.red[900],
        width: 3,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("39. Switch & AnimatedSwitcher Widget"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedSwitcher(
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                duration: const Duration(seconds: 1),
                child: myWidget,
              ),
              Switch(
                inactiveTrackColor: Colors.red[100],
                inactiveThumbColor: Colors.red[900],
                activeColor: Colors.green,
                value: isOn,
                onChanged: (newValue) {
                  isOn = newValue;
                  setState(() {
                    myWidget = (isOn)
                        ? createBox(Colors.green[100], Colors.green[900], 1)
                        : createBox(Colors.red[100], Colors.red[900], 2);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container createBox(Color bodyColor, Color borderColor, int key) {
    return Container(
      key: ValueKey(key),
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        color: bodyColor,
        border: Border.all(
          color: borderColor,
          width: 3,
        ),
      ),
    );
  }
}
