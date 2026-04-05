import 'package:persistence_drift/src/drift_database.dart';
import 'package:recipe_domain/recipe_domain.dart';

class RecipeStore {
  RecipeStore(this._database);

  final RecipeDatabase _database;

  Future<void> saveRecipe(RecipeDocument recipe) {
    return _database.saveRecipe(recipe);
  }

  Future<List<SavedRecipeRecord>> listRecipes() {
    return _database.listRecipes();
  }

  Future<RecipeDocument?> loadRecipe(String recipeId) {
    return _database.loadRecipe(recipeId);
  }

  Future<void> setFavorite(String recipeId, bool isFavorite) {
    return _database.setFavorite(recipeId, isFavorite);
  }

  Future<void> deleteRecipe(String recipeId) async {
    await _database.deleteRecipe(recipeId);
  }

  Future<void> close() {
    return _database.close();
  }
}
