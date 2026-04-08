import 'package:agent_bridge/agent_bridge.dart';
import 'package:persistence_drift/src/drift_database.dart';
import 'package:recipe_domain/recipe_domain.dart';

class RecipeStore {
  RecipeStore(this._database);

  final RecipeDatabase _database;

  RecipeDatabase get database => _database;

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

  Future<AgentAccessSettingsRecord> loadAgentAccessSettings() {
    return _database.loadAgentAccessSettings();
  }

  Future<void> saveAgentAccessSettings(AgentAccessSettingsRecord settings) {
    return _database.saveAgentAccessSettings(settings);
  }

  Future<void> saveAgentSession(AgentSessionRecord session) {
    return _database.saveAgentSession(session);
  }

  Future<List<AgentSessionRecord>> listAgentSessions({int limit = 20}) {
    return _database.listAgentSessions(limit: limit);
  }

  Future<void> recordAgentAuditEntry(AgentAuditEntry entry) {
    return _database.recordAgentAuditEntry(entry);
  }

  Future<List<AgentAuditEntry>> listAgentAuditEntries({int limit = 50}) {
    return _database.listAgentAuditEntries(limit: limit);
  }

  Future<void> clearAgentAuditEntries() {
    return _database.clearAgentAuditEntries();
  }

  Future<int> pruneAgentAuditEntriesOlderThan(DateTime cutoffUtc) {
    return _database.pruneAgentAuditEntriesOlderThan(cutoffUtc);
  }

  Future<int> trimAgentAuditEntriesToLimit(int keepLatest) {
    return _database.trimAgentAuditEntriesToLimit(keepLatest);
  }

  Future<void> close() {
    return _database.close();
  }
}
