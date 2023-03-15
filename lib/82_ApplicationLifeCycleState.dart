/// Tutorial cara mendapatkan State dari Aplikasi
/// ? mengambil State terakhir meski Aplikasi running di background/tidak aktif

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

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    // ? Melakukan Observe pada class ini (this)
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // ? Untuk mengecek perubahan pada State
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.inactive) {
      debugPrint("-------> INACTIVE <-------");
    }

    if (state == AppLifecycleState.paused) {
      debugPrint("-------> PAUSED <-------");
    }

    if (state == AppLifecycleState.resumed) {
      debugPrint("-------> RESUMED <-------");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("82. Application Life Cycle State"),
        backgroundColor: Colors.black87,
      ),
      body: Container(),
    );
  }
}
