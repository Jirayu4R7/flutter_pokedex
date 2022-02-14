import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/models/pokemon_info_model.dart';
import 'package:pokedex/models/pokemons_response_model.dart';

void main() {
  group('Pokemon data.', () {
    test('Test getPokemons', () async {
      final file =
          File('test/test_resources/random_pokemon.json').readAsStringSync();
      final pokemonsResponseModel = PokemonsResponseModel.fromJson(
          jsonDecode(file) as Map<String, dynamic>);

      expect(pokemonsResponseModel.pokemons?.length, 1);
    });

    test('Test getPokemonInfo', () async {
      final file =
          File('test/test_resources/pokemon_info.json').readAsStringSync();
      final pokemonInfo =
          PokemonInfoModel.fromJson(jsonDecode(file) as Map<String, dynamic>);

      expect(pokemonInfo.name, "Charizard");
      expect(pokemonInfo.weight, 905);
      expect(pokemonInfo.height, 17);
      expect(pokemonInfo.backImage,
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/6.png");
      expect(pokemonInfo.frontImage,
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png");
    });
  });
}
