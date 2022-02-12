import 'package:get/get.dart';

import 'list_pokenmon_controller.dart';

class ListPokemonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPokemonController>(
      () => ListPokemonController(),
    );
  }
}
