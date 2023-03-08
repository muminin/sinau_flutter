import 'package:belajar_flutter/model/69_person.dart';

void main() {
  Person person = Person(name: "Wulan", age: 23);

  if (person == Person(name: "Wulan", age: 23)) {
    print("sama");
  } else {
    print("tidak sama");
  }

  List<Person> persons = [person];
  if (persons.contains(Person(name: "Wulan", age: 23))) {
    print("ada");
  } else {
    print("tidak ada");
  }
}
