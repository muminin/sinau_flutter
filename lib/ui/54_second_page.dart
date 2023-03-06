import 'package:belajar_flutter/bloc/54_color_bloc.dart';
import 'package:belajar_flutter/bloc/54_counter_bloc.dart';
import 'package:belajar_flutter/ui/54_draft_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => DraftPage(
        backgroundColor: color,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<CounterBloc, int>(
                builder: (context, counter) => GestureDetector(
                  onTap: () {
                    counterBloc.add(counter + 1);
                  },
                  child: Text(
                    counter.toString(),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      colorBloc.add(ColorEvent.toPink);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: (color == Colors.pink)
                          ? CircleBorder(
                              side: BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            )
                          : BeveledRectangleBorder(),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      colorBloc.add(ColorEvent.toAmber);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: (color == Colors.amber)
                          ? CircleBorder(
                              side: BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            )
                          : BeveledRectangleBorder(),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      colorBloc.add(ColorEvent.toPurple);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: (color == Colors.purple)
                          ? CircleBorder(
                              side: BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            )
                          : BeveledRectangleBorder(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
