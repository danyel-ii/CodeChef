import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:persistence_drift/src/query_executor_factory.dart';
import 'package:recipe_domain/recipe_domain.dart';

part 'drift_database.g.dart';

class SavedRecipes extends Table {
  TextColumn get recipeId => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get updatedAtIso8601 => text()();
  TextColumn get tagsJson => text()();
  TextColumn get documentJson => text()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{recipeId};
}

@DriftDatabase(tables: <Type>[SavedRecipes])
class RecipeDatabase extends _$RecipeDatabase {
  RecipeDatabase(super.executor);

  factory RecipeDatabase.open({String? sqliteFilePath}) {
    return RecipeDatabase(createRecipeQueryExecutor(sqliteFilePath: sqliteFilePath));
  }

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator migrator) async {
          await migrator.createAll();
        },
        onUpgrade: (Migrator migrator, int from, int to) async {
          if (from < 2) {
            await migrator.addColumn(savedRecipes, savedRecipes.isFavorite);
          }
        },
      );

  Future<void> saveRecipe(RecipeDocument recipe) {
    return into(savedRecipes).insertOnConflictUpdate(
      SavedRecipesCompanion(
        recipeId: Value(recipe.recipeId),
        title: Value(recipe.title),
        description: Value(recipe.description),
        updatedAtIso8601: Value(recipe.updatedAt.toUtc().toIso8601String()),
        tagsJson: Value(jsonEncode(recipe.tags)),
        documentJson: Value(jsonEncode(recipe.toJson())),
      ),
    );
  }

  Future<List<SavedRecipeRecord>> listRecipes() async {
    final rows = await (select(savedRecipes)
          ..orderBy(<OrderClauseGenerator<$SavedRecipesTable>>[
            (SavedRecipes tbl) => OrderingTerm.desc(tbl.updatedAtIso8601),
          ]))
        .get();
    return rows
        .map(
          (SavedRecipe row) => SavedRecipeRecord(
            recipeId: row.recipeId,
            title: row.title,
            description: row.description,
            updatedAt: DateTime.parse(row.updatedAtIso8601),
            tags: (jsonDecode(row.tagsJson) as List<Object?>)
                .map((Object? tag) => tag! as String)
                .toList(growable: false),
            isFavorite: row.isFavorite,
          ),
        )
        .toList(growable: false);
  }

  Future<RecipeDocument?> loadRecipe(String recipeId) async {
    final row = await (select(savedRecipes)
          ..where(($SavedRecipesTable tbl) => tbl.recipeId.equals(recipeId)))
        .getSingleOrNull();
    if (row == null) {
      return null;
    }
    final dynamic decoded = jsonDecode(row.documentJson);
    return RecipeDocument.fromJson(
      (decoded as Map<Object?, Object?>).map<String, dynamic>(
        (Object? key, Object? value) => MapEntry(key! as String, value),
      ),
    );
  }

  Future<void> setFavorite(String recipeId, bool isFavorite) async {
    await (update(savedRecipes)
          ..where(($SavedRecipesTable tbl) => tbl.recipeId.equals(recipeId)))
        .write(
      SavedRecipesCompanion(
        isFavorite: Value(isFavorite),
      ),
    );
  }

  Future<int> deleteRecipe(String recipeId) {
    return (delete(savedRecipes)
          ..where(($SavedRecipesTable tbl) => tbl.recipeId.equals(recipeId)))
        .go();
  }
}

class SavedRecipeRecord {
  const SavedRecipeRecord({
    required this.recipeId,
    required this.title,
    required this.description,
    required this.updatedAt,
    required this.tags,
    required this.isFavorite,
  });

  final String recipeId;
  final String title;
  final String? description;
  final DateTime updatedAt;
  final List<String> tags;
  final bool isFavorite;
}
