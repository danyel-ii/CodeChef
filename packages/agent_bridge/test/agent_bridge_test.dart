import 'package:agent_bridge/agent_bridge.dart';
import 'package:execution_protocol/execution_protocol.dart';
import 'package:executor_broker/executor_broker.dart';
import 'package:operation_registry/operation_registry.dart';
import 'package:pack_core_text/pack_core_text.dart';
import 'package:recipe_domain/recipe_domain.dart';
import 'package:test/test.dart';

void main() {
  late HeadlessAgentRuntime runtime;
  late InMemoryAgentAuditLogSink auditLog;
  const AgentRequestContext context = AgentRequestContext(
    agentId: 'agent:test',
    transport: AgentTransport.mcp,
    hasUserConsent: true,
    visibleSession: true,
    sessionId: 'session-1',
    purpose: 'integration test',
  );

  setUp(() {
    final OperationRegistry registry = PackLoader().load(
      const <OperationPack>[CoreTextPack()],
    );
    auditLog = InMemoryAgentAuditLogSink();
    runtime = HeadlessAgentRuntime(
      registry: registry,
      broker: ExecutorBroker(registry: registry),
      learningContent: coreTextLearningContent,
      auditLogSink: auditLog,
      permissionPolicy: const AgentPermissionPolicy(
        allowedTools: <AgentTool>{
          AgentTool.listPacks,
          AgentTool.listOperations,
          AgentTool.searchOperations,
          AgentTool.describeOperation,
          AgentTool.validateRecipe,
          AgentTool.runRecipe,
          AgentTool.runSingleOperation,
          AgentTool.loadLearningContent,
        },
        approvalMode: AgentApprovalMode.session,
      ),
    );
  });

  test('lists packs as machine-readable descriptors', () async {
    final packs = await runtime.listPacks(context);
    expect(packs, hasLength(1));
    expect(packs.first.manifest.packId, 'core.text');
    expect(packs.first.operationIds, contains('core.text.base64.encode'));
  });

  test('describes operations with learning content', () async {
    final description = await runtime.describeOperation(
      'core.text.hex.encode',
      context,
    );
    expect(description.packId, 'core.text');
    expect(description.learningContent, isNotNull);
    expect(description.manifest.title, 'Hex Encode');
  });

  test('validates recipe step params against manifests', () async {
    final RecipeDocument recipe = _recipeWithStep(
      operationId: 'core.text.url.encode',
      params: <String, Object?>{'spaceAsPlus': 'yes'},
    );

    final validation = await runtime.validateRecipe(recipe, context);
    expect(validation.isValid, isFalse);
    expect(validation.stepParamIssues['step_0'], isNotEmpty);
  });

  test('runs a single operation through the broker', () async {
    final AgentRunRecipeResult result = await runtime.runSingleOperation(
      'core.text.base64.encode',
      const PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: 5,
        data: 'hello',
        mediaType: 'text/plain',
        characterEncoding: 'utf-8',
      ),
      const <String, Object?>{},
      context,
    );

    expect(result.execution.success, isTrue);
    expect(result.execution.output?.asText(), 'aGVsbG8=');
    expect(result.stepExplanations, hasLength(1));
  });

  test('records sanitized audit entries', () async {
    await runtime.runSingleOperation(
      'core.text.hex.encode',
      const PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: 2,
        data: 'hi',
        mediaType: 'text/plain',
        characterEncoding: 'utf-8',
      ),
      const <String, Object?>{},
      context,
    );

    expect(auditLog.entries, isNotEmpty);
    final AgentAuditEntry entry = auditLog.entries.last;
    expect(entry.tool, AgentTool.runRecipe);
    expect(entry.details.containsKey('outputBytes'), isTrue);
    expect(entry.details.containsValue('hi'), isFalse);
  });
}

RecipeDocument _recipeWithStep({
  required String operationId,
  required Map<String, Object?> params,
}) {
  final DateTime now = DateTime.utc(2026, 4, 8);
  return RecipeDocument(
    schemaVersion: kRecipeSchemaVersion,
    recipeId: 'recipe-1',
    title: 'Recipe',
    description: 'Test recipe',
    createdAt: now,
    updatedAt: now,
    tags: const <String>['core.text'],
    inputAssumptions: const InputAssumptions(preferredKind: PayloadKind.text),
    compatibility: const RecipeCompatibility(
      minAppProtocolVersion: kProtocolVersion,
      requiredPacks: <RequiredPackRef>[
        RequiredPackRef(packId: 'core.text', versionRange: '^1.0.0'),
      ],
    ),
    steps: <RecipeStep>[
      RecipeStep(
        stepId: 'step_0',
        enabled: true,
        operation: RecipeOperationRef(id: operationId, versionRange: '^1.0.0'),
        params: params,
      ),
    ],
    notes: const <RecipeNote>[],
    provenance: const RecipeProvenance(createdBy: 'test', source: 'unit'),
  );
}
