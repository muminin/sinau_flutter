import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

// * DUMMY API https://reqres.in

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;
  User user = null;

  // ? Generate random String BEGIN
  String chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  // ? Generate random String END

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:
              const Text("37. HTTP Request / Connecting to API (Get Method)"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("POST RESULT"),
              Text(
                (postResult != null
                    ? '${postResult.id} | ${postResult.name} | ${postResult.job} | ${postResult.createdAt}'
                    : 'Tidak ada Data POST'),
              ),
              ElevatedButton(
                onPressed: () {
                  PostResult.connectToAPI(
                          getRandomString(5), getRandomString(10))
                      .then((value) {
                    postResult = value;
                    setState(() {});
                  });
                },
                child: const Text("POST"),
              ),
              const Text("GET RESULT"),
              Image(
                width: 300,
                image: (user != null)
                    ? NetworkImage(user.avatar)
                    : const AssetImage("assets/images/anushka_sharma.jpg"),
              ),
              Text(
                (user != null
                    ? '${user.id} | ${user.email} | ${user.firstName} | ${user.lastName}'
                    : 'Tidak ada Data GET'),
              ),
              ElevatedButton(
                onPressed: () {
                  var rng = Random();
                  User.getData(rng.nextInt(13)).then((value) {
                    user = value;
                    setState(() {});
                  });
                },
                child: const Text("GET"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostResult {
  String id, name, job, createdAt;

  PostResult({this.id, this.name, this.job, this.createdAt});

  // * Mapping dari JSON
  // ? Map<String, dynamci> ==> Map<Key JSON, Value JSON>
  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      createdAt: object['createdAt'],
    );
  }

  // * Menghubungkan aplikasi ke API
  static Future<PostResult> connectToAPI(String name, String job) async {
    String apiURL = 'https://reqres.in/api/users';

    var apiResult = await http.post(apiURL, body: {
      'name': name,
      'job': job,
    });

    // * Convert from JSON
    var jsonObject = json.decode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}

class User {
  int id;
  String email, firstName, lastName, avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object['id'],
      email: object['email'],
      firstName: object['first_name'],
      lastName: object['last_name'],
      avatar: object['avatar'],
    );
  }

  static Future<User> getData(int id) async {
    String apiURL = 'https://reqres.in/api/users/$id';
    var apiResult = await http.get(apiURL);

    // * Convert from JSON
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }
}
