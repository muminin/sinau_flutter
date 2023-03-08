import 'package:belajar_flutter/model/67_person.dart';
import 'package:flutter_test/flutter_test.dart';

/// https://api.flutter.dev/flutter/package-matcher_matcher/package-matcher_matcher-library.html

void main() {
  group("Mengecek Class Person", () {
    Person person;
    person = Person();

    test('Inisialiasi Objek Person', () {
      print("1");
      expect(person.name, equals("No Name"));
      expect(person.age, equals(0));
    });

    test('Age harus positif', () {
      print("2");
      person.age = -5;
      expect(person.age, isPositive);
    });

    test("Lucky Numbers harus 3 buah bilangan positif", () {
      print("3");
      expect(
        person.luckyNumbers,
        allOf(
          hasLength(equals(3)),
          isNot(anyElement(isNegative)),
        ),
      );
    });
  });

  setUp(() {
    // Setiap test akan menjalankan setUp terlebih dahulu
    print("setUp");
  });

  tearDown(() {
    // tearDown akan dijalankan setiap selesai melakukan test
    print("tearDown");
  });
}
