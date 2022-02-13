import 'package:dio/dio.dart';
import 'package:pokedex/data/config/config.dart';
import 'package:pokedex/models/pokemon_info_model.dart';
import 'package:pokedex/models/pokemons_response_model.dart';

import 'client_defualt.dart';

class PokedexServices extends ClientDefualt {
  Future<PokemonsResponseModel?> getPokemons(
      {int offset = 0, int limit = 20}) async {
    PokemonsResponseModel pokemonsResponseModel;
    try {
      Response response = await dio.get(
        END_POINT_POKEMONS,
        queryParameters: {"offset": offset, "limit": limit},
      );
      if (response.statusCode == 200) {
        pokemonsResponseModel = PokemonsResponseModel.fromJson(response.data);
        return pokemonsResponseModel;
      } else {
        return null;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
      return null;
    }
  }

  Future<PokemonInfoModel?> getPokemonInfo(String? url) async {
    PokemonInfoModel pokemonInfoModel;
    try {
      if (url != null) {
        Response response = await dio.get(
          url,
        );
        if (response.statusCode == 200) {
          pokemonInfoModel = PokemonInfoModel.fromJson(response.data);
          return pokemonInfoModel;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
      return null;
    }
  }
}
