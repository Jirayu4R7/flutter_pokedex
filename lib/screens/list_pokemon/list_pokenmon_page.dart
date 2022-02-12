import 'package:flutter/material.dart';
import 'package:pokedex/utils/string_constant.dart';
import 'package:pokedex/widgets/bottom_sheet_view.dart';
import 'package:pokedex/widgets/pokemon_item_view.dart';
import 'package:pokedex/widgets/widgets.dart';
import 'package:get/get.dart';

import 'list_pokenmon_controller.dart';
import 'widgets/pokemon_detail_view.dart';

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
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
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
                      : ListView.builder(
                          itemCount: _dx.listPokemon.length,
                          itemBuilder: (context, index) => PokemonItemView(
                            title: _dx.listPokemon[index],
                            onPressed: () {
                              Get.bottomSheet(
                                const BottomSheetView(
                                  content: PokemonDetailView(
                                    weight: 99,
                                    backImage: IMAGE_DUMMY_URL,
                                    frontImage: IMAGE_DUMMY_URL,
                                    height: 123,
                                    name: "NAME",
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
                            },
                          ),
                        ),
                ),
              ),
      ),
    );
  }
}

void _settingModalBottomSheet(context, content) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(child: content);
      });
}
