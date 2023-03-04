import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// * Depedencies
// flutter_bloc: ^0.20.1
// provider: ^3.0.0

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
        builder: (context) => ColorBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.dispatch(ColorEvent.isAmber);
            },
            backgroundColor: Colors.amber,
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              bloc.dispatch(ColorEvent.isLightBlue);
            },
            backgroundColor: Colors.lightBlue,
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text("45. BLoC State Management (flutter_bloc Package)"),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: 100,
            height: 100,
            color: currentColor,
          ),
        ),
      ),
    );
  }
}

// * Dibuat file sendiri
// ColorBloc BEGIN
enum ColorEvent { isAmber, isLightBlue }

class ColorBloc extends Bloc<ColorEvent, Color> {
  Color _color = Colors.amber;

  @override
  Color get initialState => Colors.amber;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    // * implement Event ke dalam State
    _color = (event == ColorEvent.isAmber) ? Colors.amber : Colors.lightBlue;

    // * yield adalah perintah untuk memasukkan Data ke dalam Stream
    yield _color;
  }
}
// ColorBloc END
