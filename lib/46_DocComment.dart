import 'package:flutter/material.dart';

// * Reference https://dart.dev/guides/language/effective-dart/documentation

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final UserProfile profile = UserProfile(
    name: "Wulan",
    role: "Cakep",
    photoURL:
        "https://miro.medium.com/v2/resize:fit:4800/format:webp/0*4854g21ckB2LDlkw.png",
  );

  @override
  Widget build(BuildContext context) {
    profile.name;
    profile.role;
    profile.photoURL;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("46. Doc Comment"),
        ),
        body: Center(
          child: profile,
        ),
      ),
    );
  }
}

/// Class UserProfile digunakan untuk menampilkan Profile User ke layar
class UserProfile extends StatelessWidget {
  /// Field ini digunakan untuk menyimpan nama User
  final String name;

  /// Field ini digunakan untuk menyimpan nama User Role
  final String role;

  /// Field ini digunakan untuk menyimpan nama User Photo
  final String photoURL;

  // * ini Contructor
  // * Objectnya sama dengan nama Classnya dan akan dipanggil ketika kita membuat Object dari Class tersebut
  /// * [name] berisi *nama User*, default `No Name`
  ///
  /// * [role] berisi nama Role, default `No Role`
  ///
  /// * [photoURL] berisi **foto User**, default `null`
  /// Contoh:
  ///
  /// ```
  /// final UserProfile profile = UserProfile(
  ///   name: "Wulan",
  ///   role: "Cakep",
  ///   photoURL: "https://oke.com",
  /// );
  /// ```
  UserProfile({this.name = 'No Name', this.role = 'No Role', this.photoURL});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
          image: (photoURL != null)
              ? NetworkImage(photoURL)
              : const AssetImage('assets/images/anushka_sharma.jpg'),
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "[$role]",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
