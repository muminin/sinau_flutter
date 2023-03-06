import 'package:belajar_flutter/bloc/54_color_bloc.dart';
import 'package:belajar_flutter/bloc/54_counter_bloc.dart';
import 'package:belajar_flutter/ui/54_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Bungkus di root/MaterialApp nya jika mengaplikasikan Bloc pada Multiple Page
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(),
        ),
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
