
import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/main.dart';


void main() {
  group('PokedexApp', () {
    testWidgets('Open list pokemon page.', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      expect(find.text('Pokedek'), findsOneWidget);
    });
  });
}
