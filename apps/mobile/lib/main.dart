import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_recipe_lab_mobile/src/app/mobile_recipe_lab_app.dart';

void main() {
  runApp(const ProviderScope(child: MobileRecipeLabApp()));
}
