import 'package:pokedex/screens/list_pokemon/list_pokenmon_binding.dart';
import 'package:pokedex/screens/list_pokemon/list_pokenmon_page.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.listPokemonScreen,
      page: () => const ListPokemonPage(),
      binding: ListPokemonBinding(),
    ),
  ];
}
