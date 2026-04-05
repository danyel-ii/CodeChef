import 'package:drift/native.dart';
import 'package:execution_protocol/execution_protocol.dart';
import 'package:persistence_drift/src/drift_database.dart';
import 'package:persistence_drift/src/recipe_store.dart';
import 'package:recipe_domain/recipe_domain.dart';
import 'package:test/test.dart';

void main() {
  test('saves and loads a recipe document', () async {
    final database = RecipeDatabase(NativeDatabase.memory());
    final store = RecipeStore(database);
    final recipe = RecipeDocument(
      schemaVersion: kRecipeSchemaVersion,
      recipeId: 'recipe-1',
      title: 'Base64 Decode',
      createdAt: DateTime.parse('2026-04-05T10:00:00Z'),
      updatedAt: DateTime.parse('2026-04-05T10:00:00Z'),
      tags: const <String>['base64'],
      inputAssumptions: const InputAssumptions(preferredKind: PayloadKind.text),
      compatibility: const RecipeCompatibility(
        minAppProtocolVersion: kProtocolVersion,
        requiredPacks: <RequiredPackRef>[
          RequiredPackRef(packId: 'core.text', versionRange: '^1.0.0'),
        ],
      ),
      steps: const <RecipeStep>[
        RecipeStep(
          stepId: 'step-1',
          enabled: true,
          operation: RecipeOperationRef(
            id: 'core.text.base64.decode',
            versionRange: '^1.0.0',
          ),
          params: <String, Object?>{'treatOutputAs': 'text'},
        ),
      ],
      notes: const <RecipeNote>[],
      provenance: const RecipeProvenance(createdBy: 'user', source: 'manual'),
    );

    await store.saveRecipe(recipe);

    final loaded = await store.loadRecipe('recipe-1');
    final list = await store.listRecipes();

    expect(loaded?.title, 'Base64 Decode');
    expect(loaded?.steps.first.operation.id, 'core.text.base64.decode');
    expect(list, hasLength(1));
    await store.close();
  });

  test('updates favorite flag in listing', () async {
    final database = RecipeDatabase(NativeDatabase.memory());
    final store = RecipeStore(database);
    final recipe = RecipeDocument(
      schemaVersion: kRecipeSchemaVersion,
      recipeId: 'recipe-2',
      title: 'Favorite Me',
      createdAt: DateTime.parse('2026-04-05T10:00:00Z'),
      updatedAt: DateTime.parse('2026-04-05T10:00:00Z'),
      tags: const <String>['hash'],
      inputAssumptions: const InputAssumptions(preferredKind: PayloadKind.text),
      compatibility: const RecipeCompatibility(
        minAppProtocolVersion: kProtocolVersion,
        requiredPacks: <RequiredPackRef>[
          RequiredPackRef(packId: 'core.hash', versionRange: '^1.0.0'),
        ],
      ),
      steps: const <RecipeStep>[],
      notes: const <RecipeNote>[],
      provenance: const RecipeProvenance(createdBy: 'user', source: 'manual'),
    );

    await store.saveRecipe(recipe);
    await store.setFavorite('recipe-2', true);

    final list = await store.listRecipes();

    expect(list.single.isFavorite, isTrue);
    await store.close();
  });
}
