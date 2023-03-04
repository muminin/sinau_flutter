import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    bloc.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                // * Menghubungkan button dengan bloc
                bloc.eventSink.add(ColorEvent.toAmber);
              },
              backgroundColor: Colors.amber,
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                bloc.eventSink.add(ColorEvent.toLightBlue);
              },
              backgroundColor: Colors.blue,
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text(
              "44. BLoC State Management (Stream Controller & Stream Builder)"),
        ),
        body: Center(
          // * Menghubungkan AnimatedContainer dengan Bloc menggunakan StreamBuilder
          // * Untuk membuild Widget setiap kali dapat update dari Stream
          child: StreamBuilder(
            stream: bloc.stateStream,
            initialData: Colors.amber,
            builder: (context, snapshot) {
              return AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: 300,
                height: 300,
                color: snapshot.data,
              );
            },
          ),
        ),
      ),
    );
  }
}

// * sebaiknya dibuat file sendiri
// ColorBloc BEGIN
enum ColorEvent { toAmber, toLightBlue }

class ColorBloc {
  // * Variable untuk menyimpan State
  Color _color = Colors.amber;

  // * StreamController untuk event
  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  // * Sink event dibuat Public untuk bisa diakses
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  // * StreamController untuk State
  StreamController<Color> _stateController = StreamController<Color>();
  // * Sink state dibuat Private karena masuk melalui method _mapEventToState
  StreamSink<Color> get _stateSink => _stateController.sink;
  // * Stream dibuat Publik agar bisa diakses oleh Container
  Stream<Color> get stateStream => _stateController.stream;

  // * Input yang masuk ke _eventController akan diproses ke dalam method _mapEventToState
  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.toAmber) {
      _color = Colors.amber;
    } else {
      _color = Colors.blue;
    }

    // * Setelah diproses dimasukkan kembali ke dalam Sink state
    _stateSink.add(_color);
  }

  // * Menghubungkan Stream Controller dengan method _mapEventToState
  ColorBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  // * Menghapus Stream pada Memori
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
// ColorBloc END