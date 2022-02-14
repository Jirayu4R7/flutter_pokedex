import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/widgets/widgets.dart';
import 'package:get/get.dart';

import 'list_pokemon_controller.dart';
import 'widgets/pokemon_detail_view.dart';
import 'widgets/pokemon_item_view.dart';

class ListPokemonPage extends GetView<ListPokemonController> {
  const ListPokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pokedex'),
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<ListPokemonController>(
        builder: (_dx) => _dx.isLoading
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const LoadingView(),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: RefreshIndicator(
                  onRefresh: _dx.pullRefresh,
                  child: _dx.listPokemon.isEmpty
                      ? ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) =>
                              const Text("No data."),
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                key: const Key("list_pokemon"),
                                controller: _dx.scrollController,
                                itemCount: _dx.listPokemon.length,
                                itemBuilder: (context, index) {
                                  PokemonModel pokemon = _dx.listPokemon[index];
                                  return PokemonItemView(
                                    key: Key("item_${index}_pokemon"),
                                    title: pokemon.name.toString(),
                                    onPressed: () async {
                                      if (pokemon.url != null) {
                                        Get.bottomSheet(
                                          BottomSheetView(
                                            key: const Key(
                                                "bottom_sheet_pokemon_info"),
                                            content: FutureBuilder(
                                              future: _dx.fetchPokemonInfo(
                                                pokemon.url,
                                              ),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot snapshot) {
                                                if (snapshot.hasData) {
                                                  return PokemonDetailView(
                                                    pokemonInfo: snapshot.data,
                                                  );
                                                } else {
                                                  return const LoadingView(
                                                    key: Key(
                                                        "loading_pokemon_info"),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          backgroundColor: Colors.white,
                                          isDismissible: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16.0),
                                              topRight: Radius.circular(16.0),
                                            ),
                                          ),
                                        );
                                      } else {
                                        Get.snackbar("Error", "No data.");
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                            LoadingView(
                              key: const Key("loading_pokemons_more"),
                              isLoading: _dx.isLoadingMore,
                            ),
                          ],
                        ),
                ),
              ),
      ),
    );
  }
}
