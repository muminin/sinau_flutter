// http://jsonplaceholder.typicode.com/

import 'package:belajar_flutter/bloc/58_post_bloc.dart';
import 'package:belajar_flutter/ui/58_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<PostBloc>(
        create: (context) => PostBloc()..add(PostEvent()),
        child: MainPage(),
      ),
    );
  }
}
