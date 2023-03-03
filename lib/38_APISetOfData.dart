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
  String output = "no data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:
              const Text("38. HTTP Request / Connection via API (Set of Data)"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(output),
              ElevatedButton(
                onPressed: () {
                  var rng = Random();

                  User.getUsers(rng.nextInt(3)).then((value) {
                    output = "";
                    for (var element in value) {
                      output += '[ ${element.id}, ${element.name} ], \n';
                      setState(() {});
                    }
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

// * Sebaiknya File terpisah
class User {
  int id;
  String name;

  User({this.id, this.name});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object['id'],
      name: '${object['first_name']} ${object['last_name']}',
    );
  }

  static Future<List<User>> getUsers(int page) async {
    String apiURL = 'https://reqres.in/api/users?page=$page';

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> usersData = (jsonObject as Map<String, dynamic>)['data'];

    List<User> users = [];
    for (var element in usersData) {
      users.add(User.createUser(element));
    }

    return users;
  }
}
