import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color color1 = Colors.red;
  Color color2 = Colors.green;
  Color targetColor;
  bool isAcceptColor = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("15. Draggable, DragTarget, SizedBox, Material"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Draggable<Color>(
                  data: color1,
                  childWhenDragging: SizedBox(
                    width: 60,
                    height: 50,
                    child: Material(
                      color: Colors.grey.withOpacity(0.5),
                      shape: const StadiumBorder(),
                    ),
                  ),
                  feedback: SizedBox(
                    width: 60,
                    height: 50,
                    child: Material(
                      color: color1.withOpacity(0.75),
                      shape: const StadiumBorder(),
                      elevation: 5,
                    ),
                  ),
                  child: SizedBox(
                    width: 60,
                    height: 50,
                    child: Material(
                      color: color1,
                      shape: const StadiumBorder(),
                      elevation: 5,
                    ),
                  ),
                ),
                Draggable<Color>(
                  data: color2,
                  childWhenDragging: SizedBox(
                    width: 60,
                    height: 50,
                    child: Material(
                      color: Colors.grey.withOpacity(0.5),
                      shape: const StadiumBorder(),
                    ),
                  ),
                  feedback: SizedBox(
                    width: 60,
                    height: 50,
                    child: Material(
                      color: color2.withOpacity(0.75),
                      shape: const StadiumBorder(),
                      elevation: 5,
                    ),
                  ),
                  child: SizedBox(
                    width: 60,
                    height: 50,
                    child: Material(
                      color: color2,
                      shape: const StadiumBorder(),
                      elevation: 5,
                    ),
                  ),
                ),
              ],
            ),
            DragTarget<Color>(
              onWillAccept: (value) => true,
              onAccept: (value) {
                print(value);

                isAcceptColor = true;
                targetColor = value;
              },
              builder: (context, candidates, rejected) {
                return (isAcceptColor)
                    ? SizedBox(
                        width: 200,
                        height: 80,
                        child: Material(
                          color: targetColor,
                          elevation: 5,
                        ),
                      )
                    : SizedBox(
                        width: 200,
                        height: 80,
                        child: Material(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
