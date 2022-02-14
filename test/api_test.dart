import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/api/client_defualt.dart';
import 'package:pokedex/data/config/config.dart';

void main() {
  group('ApiServices', () {
    late ClientDefualt clientDefualt;

    setUp(() {
      clientDefualt = ClientDefualt();
    });

    test('Check api return status 200', () async {
      Response response = await clientDefualt.dio.get(END_POINT_POKEMONS);
      expect(response.statusCode, 200);
    });
  });
}
