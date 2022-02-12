import 'package:get/get.dart';

class ListPokemonController extends GetxController {
  bool isLoading = true;
  List<String> listPokemon = List<String>.empty(growable: true);

  @override
  void onInit() async {
    await fetchListData();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchListData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    listPokemon = ["Name A", "Name B", "Name C"];
    isLoading = false;
    update();
  }

  Future<void> pullRefresh() async {
    isLoading = true;
    update();
    print('pull refresh');
    //TODO: handle pull refresh
    listPokemon = ["Name A", "Name B", "Name C"];
    isLoading = false;
    update();
  }
}
