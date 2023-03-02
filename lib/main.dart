import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;
  String chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("36. HTTP Request / Koneksi ke API (Post Method)"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                (postResult != null
                    ? '${postResult.id} | ${postResult.name} | ${postResult.job} | ${postResult.createdAt}'
                    : 'Tidak ada Data'),
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
