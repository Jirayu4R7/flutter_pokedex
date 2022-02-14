import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:pokedex/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('tap item to show pokemon info.', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.text('Pokedex'), findsOneWidget);

      final Finder listPokemon = find.byKey(const Key("list_pokemon"));
      expect(listPokemon, findsOneWidget);
      await tester.tap(find.byKey(const Key("item_0_pokemon")));
      await tester.pumpAndSettle();
      expect(
          find.byKey(const Key("bottom_sheet_pokemon_info")), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text("Bulbasaur"), findsWidgets);
      expect(find.text("Height:"), findsOneWidget);

      await tester.drag(find.text("Height:"), const Offset(0.0, 150.0));
      await tester.pumpAndSettle();

      await tester.drag(
          find.byKey(const Key("item_10_pokemon")), const Offset(0, -300));
      expect(find.byKey(const Key("loading_pokemons_more")), findsOneWidget);
      await tester.pumpAndSettle();
      await tester.drag(
          find.byKey(const Key("item_19_pokemon")), const Offset(0, -300));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key("item_20_pokemon")), findsOneWidget);
    });
  });
}
