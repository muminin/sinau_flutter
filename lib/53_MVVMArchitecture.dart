import 'package:belajar_flutter/ui/main_page.dart';
import 'package:belajar_flutter/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// MVVM (MODEL - VIEW - VIEW MODEL)
/// View: komponen yang berfungsi menampilkan state dari sistem dan menerima input dari user -> (Flutter) widget/page
///
/// Model: komponen yang merepresentasikan objek yang terkait di dalam sistem.
/// Contoh: class User, class Product, class Store, dsb
///
/// Tujuan MVVM
/// Memisahkan state dan logic dari View menjadi sebuah komponen lain yang disebut View Model
///
/// Tugas View:
/// . Memberitahukan kepada View Model jika ada input dari user.
/// . Merespon perubahan state yang diberikan oleh View Model dan menampilkannya kepada user.
///
/// Tugas View Model:
/// . Merespon input yang diberikan oleh View.
/// . View Model tidak tahu dan tidak terkait dengan View manapun, ia hanya memberitahukan perubahan state pada View yang membutuhkan/terkait.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => UserBloc(),
        child: MainPage(),
      ),
    );
  }
}
