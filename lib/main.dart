/// HIVE - NO SQL DATABASE IN PURE DART
/// . Hive contains multiple boxes.
/// . A box contains multiple pairs of key and value.
/// . Keys must be either of type String or int.
/// . Hive supports only primitive types like int or String, plus
/// additional standard types, which are List, Map and DateTime
///
/// ! To store custom Class, we have to convert it to JSON or
/// use a TypeAdapter
///
/// Usage
/// Create Data: use add(value)
/// Retrieve Data: use getAt(index)
/// Update Data: use putAt(index)
/// Delete Data: use deleteAt(index)
///
/// To rebuild the UI everytime a value inside a box changes,
/// use WatchBoxBuilder
///
/// build_runner: ^1.7.0
/// hive: ^1.1.0+1
/// hive_flutter: ^0.2.1
/// hive_generator: ^0.5.2
/// path_provider: ^1.3.1

import 'package:belajar_flutter/ui/57_main_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
