import 'package:pokedex/models/pokemon_model.dart';

class PokemonsResponseModel {
  int? count;
  String? next;
  String? previous;
  List<PokemonModel>? pokemons;

  PokemonsResponseModel({this.count, this.next, this.previous, this.pokemons});

  PokemonsResponseModel.fromJson(Map<String, dynamic> json) {
    count = json['count'] ?? 0;
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      pokemons = <PokemonModel>[];
      json['results'].forEach((v) {
        pokemons!.add(PokemonModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (pokemons != null) {
      data['results'] = pokemons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
