import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<bool> isSelected = [true, false, false];
  ColorFilter colorFilter = ColorFilter.mode(Colors.blue, BlendMode.screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorFiltered(
        colorFilter: colorFilter,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
                "50. Flutter 1.9 (SelectableText, ToggleButtons, ColorFiltered)"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SelectableText(
                  "Selectable Text",
                  showCursor: true,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Text biasa"),
                SizedBox(
                  height: 10,
                ),
                ToggleButtons(
                  children: <Widget>[
                    Icon(Icons.abc),
                    Icon(Icons.baby_changing_station),
                    Icon(Icons.cabin),
                  ],
                  isSelected: isSelected,
                  onPressed: (index) {
                    setState(() {
                      if (index == 0) {
                        colorFilter =
                            ColorFilter.mode(Colors.blue, BlendMode.screen);
                      } else if (index == 1) {
                        colorFilter =
                            ColorFilter.mode(Colors.green, BlendMode.softLight);
                      } else if (index == 2) {
                        colorFilter =
                            ColorFilter.mode(Colors.purple, BlendMode.multiply);
                      }

                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = (i == index) ? true : false;
                      }
                    });
                  },
                  fillColor: Colors.red[50],
                  selectedColor: Colors.red,
                  selectedBorderColor: Colors.red,
                  splashColor: Colors.blue,
                  highlightColor: Colors.yellow,
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
