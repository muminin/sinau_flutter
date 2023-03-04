import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("48. Custom Progress Bar (Timer + Provider)"),
        ),
        body: Center(
          child: ChangeNotifierProvider<TimeState>(
            create: (context) => TimeState(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<TimeState>(
                    builder: (context, timeState, _) => CustomProgressBar(
                        width: 200, value: timeState.time, totalValue: 15)),
                const SizedBox(
                  height: 10,
                ),
                Consumer<TimeState>(
                  builder: (context, timeState, _) => ElevatedButton(
                    onPressed: () {
                      Timer.periodic(const Duration(seconds: 1), (timer) {
                        if (timeState.time == 0) {
                          timer.cancel();
                        } else {
                          timeState.time -= 1;
                        }
                      });
                    },
                    child: const Text("Start"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  final double width;
  final int value;
  final int totalValue;

  CustomProgressBar({this.width, this.value, this.totalValue});

  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.timer_outlined,
          color: Colors.grey[700],
        ),
        const SizedBox(
          width: 5,
        ),
        Stack(
          children: [
            Container(
              width: width,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(5),
              child: AnimatedContainer(
                height: 10,
                width: width * ratio,
                duration: const Duration(seconds: 1),
                decoration: BoxDecoration(
                  color: (ratio < 0.3)
                      ? Colors.pink
                      : (ratio < 0.6)
                          ? Colors.amber
                          : Colors.lightGreen,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class TimeState with ChangeNotifier {
  int _time = 15;

  int get time => _time;
  set time(int newTime) {
    _time = newTime;
    notifyListeners();
  }
}
