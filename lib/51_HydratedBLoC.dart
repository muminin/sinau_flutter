import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

// * Depedencies
// flutter_bloc: ^0.21.0
// hydrated_bloc: ^0.4.1

// * Hydrated BLOC digunakan untuk melakukan Save/Load State ke Memory (JSON) ketika melakukan perubahan
// * sehingga ketika aplikasi ditutup maka akan melakukan Load State otomatis

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(MyApp());
}

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
        title: const Text("51. Hydrated BLoC State Management"),
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

class ColorBloc extends HydratedBloc<ColorEvent, Color> {
  @override
  Color get initialState => super.initialState ?? Colors.amber;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    // * yield adalah perintah untuk memasukkan Data ke dalam Stream
    yield (event == ColorEvent.isAmber) ? Colors.amber : Colors.lightBlue;
  }

  @override
  Color fromJson(Map<String, dynamic> json) {
    // * load from memory on JSON format
    try {
      // * Merubah value int menjadi Color
      return Color(json['color'] as int);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, int> toJson(Color state) {
    // * save to memory on JSON format
    try {
      return {'color': state.value};
    } catch (_) {
      return null;
    }
  }
}
// ColorBloc END
