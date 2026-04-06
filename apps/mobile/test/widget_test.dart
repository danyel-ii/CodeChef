import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile_recipe_lab_mobile/src/app/mobile_recipe_lab_app.dart';

void main() {
  testWidgets('app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MobileRecipeLabApp()));

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(
      find.text(
          'Build, test, save, and explain transformation recipes one step at a time.'),
      findsOneWidget,
    );
    expect(find.text('Save Recipe'), findsOneWidget);
  });
}
