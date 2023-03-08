import 'package:equatable/equatable.dart';

/// Equatable untuk menyederhanakan class untuk perbandingan pada object dengan class yang sama
/// Gunakan extend Equatable jika tidak mengextends apapun
/// Gunakan with EquatableMixin jika mengextends class selain Equatable
class Person extends BasePerson with EquatableMixin {
  String name;
  int age;

  Person({this.name = "no name", this.age = 0});

  /// Ini Equatable dari extends Equatable
  @override
  List<Object> get props => [name, age];

  /// contoh di bawah ini tidak perlu dipakai jika menggunakan Equatable
  // @override
  // operator ==(other) {
  //   if (other is Person) {
  //     if (name == other.name && age == other.age) {
  //       return true;
  //     }
  //   }

  //   return false;
  // }
}

class BasePerson {}
