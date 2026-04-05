import 'package:execution_protocol/execution_protocol.dart';
import 'package:executor_broker/executor_broker.dart';
import 'package:operation_registry/operation_registry.dart';
import 'package:pack_core_text/pack_core_text.dart';
import 'package:recipe_domain/recipe_domain.dart';
import 'package:test/test.dart';

void main() {
  test('runs a base64 decode recipe', () async {
    final OperationRegistry registry = OperationRegistry()
      ..registerPack(const CoreTextPack());
    final ExecutorBroker broker = ExecutorBroker(registry: registry);

    final ExecutionResult result = await broker.execute(
      ExecutionRequest(
        requestId: 'decode',
        input: const PayloadEnvelope(
          kind: PayloadKind.text,
          sizeBytes: 8,
          data: 'SGVsbG8=',
        ),
        recipe: RecipeDocument(
          schemaVersion: kRecipeSchemaVersion,
          recipeId: 'recipe',
          title: 'Decode',
          createdAt: DateTime.parse('2026-04-05T10:00:00Z'),
          updatedAt: DateTime.parse('2026-04-05T10:00:00Z'),
          tags: const <String>[],
          inputAssumptions: const InputAssumptions(
            preferredKind: PayloadKind.text,
          ),
          compatibility: const RecipeCompatibility(
            minAppProtocolVersion: kProtocolVersion,
            requiredPacks: <RequiredPackRef>[
              RequiredPackRef(packId: 'core.text', versionRange: '^1.0.0'),
            ],
          ),
          steps: const <RecipeStep>[
            RecipeStep(
              stepId: 's1',
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
        ),
      ),
    );

    expect(result.success, isTrue);
    expect(result.output?.data, 'Hello');
  });
}
