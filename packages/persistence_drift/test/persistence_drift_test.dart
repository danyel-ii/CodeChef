import 'package:agent_bridge/agent_bridge.dart';
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

  test('persists agent settings, sessions, and audit entries', () async {
    final database = RecipeDatabase(NativeDatabase.memory());
    final store = RecipeStore(database);

    final initialSettings = await store.loadAgentAccessSettings();
    expect(initialSettings.agentAccessEnabled, isFalse);

    final updatedSettings = initialSettings.copyWith(
      agentAccessEnabled: true,
      approvalMode: AgentApprovalMode.session,
      auditRetentionDays: 30,
      activeSessionId: 'session-1',
      activeAgentId: 'agent:test',
      activeTransport: AgentTransport.mcp,
      activePurpose: 'Local test session',
      activeStartedAt: DateTime.parse('2026-04-08T10:00:00Z'),
      updatedAt: DateTime.parse('2026-04-08T10:00:00Z'),
    );
    await store.saveAgentAccessSettings(updatedSettings);

    await store.saveAgentSession(
      AgentSessionRecord(
        sessionId: 'session-1',
        agentId: 'agent:test',
        transport: AgentTransport.mcp,
        purpose: 'Local test session',
        consentGranted: true,
        visible: true,
        startedAt: DateTime.parse('2026-04-08T10:00:00Z'),
      ),
    );

    await store.recordAgentAuditEntry(
      AgentAuditEntry(
        occurredAt: DateTime.parse('2026-04-08T10:05:00Z'),
        tool: AgentTool.runRecipe,
        kind: AgentAuditEventKind.execution,
        agentId: 'agent:test',
        transport: AgentTransport.mcp,
        allowed: true,
        sessionId: 'session-1',
        details: const <String, Object?>{
          'recipeId': 'recipe-1',
          'outputBytes': 64,
        },
      ),
    );

    final reloadedSettings = await store.loadAgentAccessSettings();
    final sessions = await store.listAgentSessions();
    final auditEntries = await store.listAgentAuditEntries();

    expect(reloadedSettings.agentAccessEnabled, isTrue);
    expect(reloadedSettings.auditRetentionDays, 30);
    expect(reloadedSettings.activeSessionId, 'session-1');
    expect(sessions.single.agentId, 'agent:test');
    expect(auditEntries.single.tool, AgentTool.runRecipe);
    expect(auditEntries.single.details['outputBytes'], 64);

    await store.close();
  });

  test('prunes old audit entries by retention cutoff', () async {
    final database = RecipeDatabase(NativeDatabase.memory());
    final store = RecipeStore(database);

    await store.recordAgentAuditEntry(
      AgentAuditEntry(
        occurredAt: DateTime.parse('2026-03-01T10:00:00Z'),
        tool: AgentTool.listPacks,
        kind: AgentAuditEventKind.discovery,
        agentId: 'agent:test',
        transport: AgentTransport.mcp,
        allowed: true,
        details: const <String, Object?>{'packCount': 1},
      ),
    );
    await store.recordAgentAuditEntry(
      AgentAuditEntry(
        occurredAt: DateTime.parse('2026-04-08T10:00:00Z'),
        tool: AgentTool.runRecipe,
        kind: AgentAuditEventKind.execution,
        agentId: 'agent:test',
        transport: AgentTransport.mcp,
        allowed: true,
        details: const <String, Object?>{'outputBytes': 32},
      ),
    );

    await store.pruneAgentAuditEntriesOlderThan(
      DateTime.parse('2026-04-01T00:00:00Z'),
    );

    final entries = await store.listAgentAuditEntries(limit: 10);
    expect(entries, hasLength(1));
    expect(entries.single.tool, AgentTool.runRecipe);
    await store.close();
  });
}
