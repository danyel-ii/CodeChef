import 'package:execution_protocol/execution_protocol.dart';
import 'package:recipe_domain/recipe_domain.dart';
import 'package:test/test.dart';

void main() {
  test('recipe document serializes core fields', () {
    final RecipeDocument recipe = RecipeDocument(
      schemaVersion: kRecipeSchemaVersion,
      recipeId: '01JXEXAMPLEBASE64JSON',
      title: 'Base64 JSON Decode',
      description: 'Decode and pretty-print JSON.',
      createdAt: DateTime.parse('2026-04-05T10:00:00Z'),
      updatedAt: DateTime.parse('2026-04-05T10:00:00Z'),
      tags: const <String>['base64', 'json'],
      inputAssumptions: const InputAssumptions(
        preferredKind: PayloadKind.text,
        notes: 'Input should be Base64-encoded JSON.',
      ),
      compatibility: const RecipeCompatibility(
        minAppProtocolVersion: kProtocolVersion,
        requiredPacks: <RequiredPackRef>[
          RequiredPackRef(packId: 'core.text', versionRange: '^1.0.0'),
        ],
      ),
      steps: const <RecipeStep>[
        RecipeStep(
          stepId: '01JXSTEP1',
          enabled: true,
          operation: RecipeOperationRef(
            id: 'core.text.base64.decode',
            versionRange: '^1.0.0',
          ),
          params: <String, Object?>{'treatOutputAs': 'text'},
          label: 'Decode Base64',
        ),
      ],
      notes: const <RecipeNote>[
        RecipeNote(type: 'info', text: 'Useful for decoding API payloads.'),
      ],
      provenance: const RecipeProvenance(
        createdBy: 'user',
        source: 'manual',
      ),
    );

    final Map<String, Object?> json = recipe.toJson();

    expect(json['schemaVersion'], kRecipeSchemaVersion);
    expect(json['recipeId'], '01JXEXAMPLEBASE64JSON');
    expect((json['steps']! as List<Object?>), hasLength(1));
  });
}
