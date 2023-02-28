import 'package:belajar_flutter/16_secondPage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("16. Multi Page/Screen Navigation"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to SECOND PAGE"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return SecondPage();
              },
            ));
          },
        ),
      ),
    );
  }
}
