import 'package:flutter/material.dart';

/// Dart v2.6 => sdk: '>=2.6.0 <3.0.0'
/// Extension adalah menambahkan fungsi pada Class yang sudah tersedia

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final int x = 5;
  final List<int> myList = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("60. Extension"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Bilangan:" &
                    x
                        .negate()
                        .toString(), // .negate() bisa dipakai pada Class int, & bisa dipakai pada Class String
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Text(
                myList.midElement.toString(),
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// // Contoh extension pada Class int
// extension IntegerExtension on int {
//   // Method tambahan pada int
//   int negate() => -1 * this;
// }

// // Contoh extension pada Class double
// extension DoubleExtension on double {
//   // Method tambahan pada double
//   double negate() => -1 * this;
// }

// Class int dan double bisa digabung karena dalam satu rangkaian Class num
extension NumberExtension<T extends num> on num {
  T negate() => -1 * this;
}

// Extension List untuk mengambil nilai tengahnya
extension ListExtension<T> on List {
  T get midElement =>
      (this.length == 0) ? null : this[(this.length / 2).floor()];
}

// Contoh menambahkan Operator pada Class String
extension StringExtension on String {
  // Menambahkan Operator & pada Class String
  String operator &(String other) => this + " " + other;
}
