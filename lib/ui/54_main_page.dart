import 'package:belajar_flutter/bloc/54_color_bloc.dart';
import 'package:belajar_flutter/bloc/54_counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '54_second_page.dart';
import 'package:belajar_flutter/ui/54_draft_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => DraftPage(
        backgroundColor: color,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<CounterBloc, int>(
                builder: (context, counter) => Text(
                  counter.toString(),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: StadiumBorder(),
                ),
                child: Text(
                  "Click to Change",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
