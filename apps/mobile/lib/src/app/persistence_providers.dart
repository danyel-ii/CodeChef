import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistence_drift/persistence_drift.dart';

final recipeStoreProvider = FutureProvider<RecipeStore>((Ref ref) async {
  String? sqliteFilePath;
  if (!kIsWeb) {
    final directory = await getApplicationDocumentsDirectory();
    sqliteFilePath = '${directory.path}/mobile_recipe_lab.sqlite';
  }
  final store = RecipeStore(RecipeDatabase.open(sqliteFilePath: sqliteFilePath));
  ref.onDispose(() {
    unawaited(store.close());
  });
  return store;
});

final savedRecipesProvider = FutureProvider<List<SavedRecipeRecord>>((Ref ref) async {
  final store = await ref.watch(recipeStoreProvider.future);
  return store.listRecipes();
});
