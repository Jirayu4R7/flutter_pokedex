import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/data/api/pokedex_services.dart';
import 'package:pokedex/models/pokemon_info_model.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/models/pokemons_response_model.dart';

class ListPokemonController extends GetxController {
  late ScrollController scrollController;
  final int pageLimit = 20;
  int page = 1;
  int totalItem = 0;
  bool isLoading = true;
  bool isLoadingMore = false;
  bool isLoadingPokemonInfo = true;
  RxInt io = 1.obs;
  PokedexServices pokedexServices = PokedexServices();
  List<PokemonModel> listPokemon = List<PokemonModel>.empty(growable: true);
  PokemonInfoModel? pokemonInfo;

  late PokemonsResponseModel? pokemonsResponseModel;

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(_loadMore);
    await fetchListPokemon();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.removeListener(_loadMore);
    super.onClose();
  }

  fetchListPokemon() async {
    isLoading = true;
    update();
    pokemonsResponseModel = await pokedexServices.getPokemons(offset: 0);
    if (pokemonsResponseModel != null) {
      listPokemon = pokemonsResponseModel?.pokemons ?? [];
      totalItem = pokemonsResponseModel?.count ?? 0;
    }
    isLoading = false;
    update();
  }

  Future<PokemonInfoModel?> fetchPokemonInfo(String? url) async {
    pokemonInfo = await pokedexServices.getPokemonInfo(url);
    if (pokemonInfo != null) {
      isLoadingPokemonInfo = false;
      update();
      return pokemonInfo;
    } else {
      return null;
    }
  }

  _loadMore() async {
    if (!isLoading &&
        scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (page * pageLimit < totalItem && pokemonsResponseModel != null) {
        isLoadingMore = true;
        update();
        pokemonsResponseModel = await pokedexServices.getPokemons(
          offset: page * pageLimit,
          limit: pageLimit,
        );
        listPokemon.addAll(pokemonsResponseModel?.pokemons ?? []);
        isLoadingMore = false;
        page += 1;
        update();
      }
    }
  }

  Future<void> pullRefresh() async {
    page = 1;
    isLoading = true;
    update();
    await fetchListPokemon();
    isLoading = false;
    update();
  }
}
