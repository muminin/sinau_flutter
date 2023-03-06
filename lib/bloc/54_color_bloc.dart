import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent { toPink, toAmber, toPurple }

class ColorBloc extends Bloc<ColorEvent, Color> {
  @override
  Color get initialState => Colors.pink;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    yield (event == ColorEvent.toPink)
        ? Colors.pink
        : (event == ColorEvent.toAmber)
            ? Colors.amber
            : Colors.purple;
  }
}
