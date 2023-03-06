import 'package:belajar_flutter/30_ButtonTransform.dart';
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

class _MainPageState extends State<MainPage> {
  Person selectedPerson;
  List<Person> persons = [
    Person("Joni"),
    Person("Joko"),
  ];

  List<DropdownMenuItem> generateItems(List<Person> persons) {
    List<DropdownMenuItem> items = [];
    for (var item in persons) {
      items.add(
        DropdownMenuItem(
          value: item,
          child: Text(item.name),
        ),
      );
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("56. Drop Down Button"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: DropdownButton(
              style: TextStyle(
                fontSize: 20,
              ),
              dropdownColor: Colors.lightBlue,
              isExpanded: true,
              value: selectedPerson,
              items: generateItems(persons),
              onChanged: (item) {
                setState(() {
                  selectedPerson = item;
                });
              },
            ),
          ),
          Text(
            (selectedPerson != null) ? selectedPerson.name : "Pilih User",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Person {
  String name;

  Person(this.name);
}
