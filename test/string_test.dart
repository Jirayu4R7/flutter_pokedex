import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/utils/cap_extension.dart';

void main() {
  test('Test capitalize', () {
    expect('charizard'.capitalizeFirstofEach, 'Charizard');
  });
}
