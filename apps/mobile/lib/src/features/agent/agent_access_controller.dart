import 'dart:async';
import 'dart:convert';

import 'package:agent_bridge/agent_bridge.dart';
import 'package:agent_mcp/agent_mcp.dart';
import 'package:executor_broker/executor_broker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_recipe_lab_mobile/src/app/pack_catalog.dart';
import 'package:mobile_recipe_lab_mobile/src/app/persistence_providers.dart';
import 'package:mobile_recipe_lab_mobile/src/features/documents/file_save_dialog.dart';
import 'package:mobile_recipe_lab_mobile/src/features/workbench/workbench_controller.dart';
import 'package:operation_registry/operation_registry.dart';
import 'package:pack_learning_content/pack_learning_content.dart';
import 'package:persistence_drift/persistence_drift.dart';

class AgentApprovalRequest {
  const AgentApprovalRequest({
    required this.requestId,
    required this.tool,
    required this.context,
    required this.requestedAt,
  });

  final String requestId;
  final AgentTool tool;
  final AgentRequestContext context;
  final DateTime requestedAt;
}

class AgentAccessState {
  const AgentAccessState({
    required this.settings,
    required this.sessions,
    required this.auditEntries,
    this.pendingApproval,
  });

  final AgentAccessSettingsRecord settings;
  final List<AgentSessionRecord> sessions;
  final List<AgentAuditEntry> auditEntries;
  final AgentApprovalRequest? pendingApproval;

  AgentSessionRecord? get activeSession {
    if (settings.activeSessionId == null) {
      return null;
    }
    for (final AgentSessionRecord session in sessions) {
      if (session.sessionId == settings.activeSessionId) {
        return session;
      }
    }
    return null;
  }

  AgentPermissionPolicy toPermissionPolicy() {
    return AgentPermissionPolicy(
      allowedTools: settings.agentAccessEnabled
          ? const <AgentTool>{
              AgentTool.listPacks,
              AgentTool.listOperations,
              AgentTool.searchOperations,
              AgentTool.describeOperation,
              AgentTool.validateRecipe,
              AgentTool.runRecipe,
              AgentTool.runSingleOperation,
              AgentTool.loadLearningContent,
            }
          : const <AgentTool>{},
      approvalMode: settings.approvalMode,
      requireVisibleSession: settings.requireVisibleSession,
      allowDiscoveryWithoutConsent: settings.allowDiscoveryWithoutConsent,
    );
  }

  AgentAccessState copyWith({
    AgentAccessSettingsRecord? settings,
    List<AgentSessionRecord>? sessions,
    List<AgentAuditEntry>? auditEntries,
    AgentApprovalRequest? pendingApproval,
    bool clearPendingApproval = false,
  }) {
    return AgentAccessState(
      settings: settings ?? this.settings,
      sessions: sessions ?? this.sessions,
      auditEntries: auditEntries ?? this.auditEntries,
      pendingApproval: clearPendingApproval
          ? null
          : (pendingApproval ?? this.pendingApproval),
    );
  }
}

final agentAccessControllerProvider =
    AsyncNotifierProvider<AgentAccessController, AgentAccessState>(
  AgentAccessController.new,
);

final headlessAgentRuntimeProvider = FutureProvider<HeadlessAgentRuntime>((
  Ref ref,
) async {
  final store = await ref.watch(recipeStoreProvider.future);
  final accessState = await ref.watch(agentAccessControllerProvider.future);
  final OperationRegistry registry = ref.watch(operationRegistryProvider);
  final ExecutorBroker broker = ref.watch(executorBrokerProvider);
  final Map<String, OperationLearningContent> learningContent =
      ref.watch(installedLearningContentProvider);
  return HeadlessAgentRuntime(
    registry: registry,
    broker: broker,
    learningContent: learningContent,
    permissionPolicy: accessState.toPermissionPolicy(),
    authorizer: (AgentTool tool, AgentRequestContext context) {
      return ref
          .read(agentAccessControllerProvider.notifier)
          .authorize(tool, context);
    },
    auditLogSink: DriftAgentAuditLogSink(store.database),
  );
});

final agentMcpAdapterProvider = FutureProvider<AgentMcpAdapter>((Ref ref) async {
  final runtime = await ref.watch(headlessAgentRuntimeProvider.future);
  return AgentMcpAdapter(runtime);
});

class AgentAccessController extends AsyncNotifier<AgentAccessState> {
  Completer<AgentAuthorizationDecision>? _pendingApprovalCompleter;

  @override
  Future<AgentAccessState> build() async {
    return _load();
  }

  Future<void> refresh() async {
    state = const AsyncValue<AgentAccessState>.loading().copyWithPrevious(state);
    state = await AsyncValue.guard(_load);
  }

  Future<void> setAgentAccessEnabled(bool enabled) async {
    await _updateSettings(
      (AgentAccessSettingsRecord current) => current.copyWith(
        agentAccessEnabled: enabled,
        updatedAt: DateTime.now().toUtc(),
      ),
    );
  }

  Future<void> setRequireVisibleSession(bool enabled) async {
    await _updateSettings(
      (AgentAccessSettingsRecord current) => current.copyWith(
        requireVisibleSession: enabled,
        updatedAt: DateTime.now().toUtc(),
      ),
    );
  }

  Future<void> setAllowDiscoveryWithoutConsent(bool enabled) async {
    await _updateSettings(
      (AgentAccessSettingsRecord current) => current.copyWith(
        allowDiscoveryWithoutConsent: enabled,
        updatedAt: DateTime.now().toUtc(),
      ),
    );
  }

  Future<void> setApprovalMode(AgentApprovalMode mode) async {
    await _updateSettings(
      (AgentAccessSettingsRecord current) => current.copyWith(
        approvalMode: mode,
        updatedAt: DateTime.now().toUtc(),
      ),
    );
  }

  Future<void> setAuditRetentionDays(int days) async {
    await _updateSettings(
      (AgentAccessSettingsRecord current) => current.copyWith(
        auditRetentionDays: days,
        updatedAt: DateTime.now().toUtc(),
      ),
    );
    await applyAuditRetentionPolicy();
  }

  Future<void> startVisibleSession({
    required AgentTransport transport,
    String agentId = 'external-agent',
    String? purpose,
  }) async {
    final RecipeStore store = await ref.read(recipeStoreProvider.future);
    final DateTime now = DateTime.now().toUtc();
    final AgentSessionRecord session = AgentSessionRecord(
      sessionId: 'agent-session-${now.microsecondsSinceEpoch}',
      agentId: agentId,
      transport: transport,
      purpose: purpose,
      consentGranted: true,
      visible: true,
      startedAt: now,
    );
    await store.saveAgentSession(session);
    final AgentAccessSettingsRecord current =
        await store.loadAgentAccessSettings();
    await store.saveAgentAccessSettings(
      current.copyWith(
        activeSessionId: session.sessionId,
        activeAgentId: session.agentId,
        activeTransport: session.transport,
        activePurpose: session.purpose,
        activeStartedAt: session.startedAt,
        updatedAt: now,
      ),
    );
    await refresh();
  }

  Future<void> endActiveSession() async {
    final RecipeStore store = await ref.read(recipeStoreProvider.future);
    final AgentAccessSettingsRecord current =
        await store.loadAgentAccessSettings();
    final String? sessionId = current.activeSessionId;
    if (sessionId != null) {
      final List<AgentSessionRecord> sessions =
          await store.listAgentSessions(limit: 100);
      for (final AgentSessionRecord session in sessions) {
        if (session.sessionId == sessionId) {
          await store.saveAgentSession(
            session.copyWith(endedAt: DateTime.now().toUtc()),
          );
          break;
        }
      }
    }
    await store.saveAgentAccessSettings(
      current.copyWith(
        clearActiveSession: true,
        updatedAt: DateTime.now().toUtc(),
      ),
    );
    await refresh();
  }

  Future<void> clearAuditTrail() async {
    final RecipeStore store = await ref.read(recipeStoreProvider.future);
    await store.clearAgentAuditEntries();
    await refresh();
  }

  Future<void> applyAuditRetentionPolicy() async {
    final RecipeStore store = await ref.read(recipeStoreProvider.future);
    final AgentAccessSettingsRecord current =
        await store.loadAgentAccessSettings();
    final DateTime cutoff = DateTime.now()
        .toUtc()
        .subtract(Duration(days: current.auditRetentionDays));
    await store.pruneAgentAuditEntriesOlderThan(cutoff);
    await store.trimAgentAuditEntriesToLimit(500);
    await refresh();
  }

  Future<String?> exportAuditTrail() async {
    final currentState = state.valueOrNull;
    if (currentState == null) {
      return null;
    }
    final String payload = const JsonEncoder.withIndent(
      '  ',
    ).convert(<String, Object?>{
      'exportedAt': DateTime.now().toUtc().toIso8601String(),
      'retentionDays': currentState.settings.auditRetentionDays,
      'entries': currentState.auditEntries
          .map((AgentAuditEntry entry) => entry.toJson())
          .toList(growable: false),
    });
    return saveTextFileWithDialog(
      fileName: 'code_chef_agent_audit_${DateTime.now().millisecondsSinceEpoch}.json',
      text: payload,
    );
  }

  Future<AgentAuthorizationDecision> authorize(
    AgentTool tool,
    AgentRequestContext context,
  ) async {
    final currentState = state.valueOrNull ?? await _load();
    final activeSession = currentState.activeSession;
    if (!currentState.settings.agentAccessEnabled) {
      return const AgentAuthorizationDecision.deny(
        reason: 'Agent access is disabled on this device.',
      );
    }
    if (currentState.settings.approvalMode == AgentApprovalMode.none) {
      return const AgentAuthorizationDecision.allow(
        reason: 'Approval mode is disabled.',
      );
    }
    if (currentState.settings.approvalMode == AgentApprovalMode.session) {
      final bool matchesSession = activeSession != null &&
          activeSession.sessionId == context.sessionId &&
          activeSession.agentId == context.agentId &&
          activeSession.transport == context.transport &&
          activeSession.isActive;
      return matchesSession
          ? const AgentAuthorizationDecision.allow(
              reason: 'Active session consent is valid.',
            )
          : const AgentAuthorizationDecision.deny(
              reason: 'No matching active agent session is open.',
            );
    }

    final bool matchesActiveSession = activeSession != null &&
        activeSession.sessionId == context.sessionId &&
        activeSession.agentId == context.agentId &&
        activeSession.transport == context.transport &&
        activeSession.isActive;
    if (!matchesActiveSession) {
      return const AgentAuthorizationDecision.deny(
        reason: 'A matching active session is required for per-request approval.',
      );
    }

    if (_pendingApprovalCompleter != null) {
      return const AgentAuthorizationDecision.deny(
        reason: 'Another approval request is already pending.',
      );
    }

    final String requestId =
        'approval-${DateTime.now().toUtc().microsecondsSinceEpoch}';
    final Completer<AgentAuthorizationDecision> completer =
        Completer<AgentAuthorizationDecision>();
    _pendingApprovalCompleter = completer;

    state = AsyncValue.data(
      currentState.copyWith(
        pendingApproval: AgentApprovalRequest(
          requestId: requestId,
          tool: tool,
          context: context,
          requestedAt: DateTime.now().toUtc(),
        ),
      ),
    );

    return completer.future;
  }

  void resolvePendingApproval(bool allow) {
    final currentState = state.valueOrNull;
    final Completer<AgentAuthorizationDecision>? completer =
        _pendingApprovalCompleter;
    if (currentState == null || completer == null || completer.isCompleted) {
      return;
    }
    _pendingApprovalCompleter = null;
    state = AsyncValue.data(currentState.copyWith(clearPendingApproval: true));
    completer.complete(
      allow
          ? const AgentAuthorizationDecision.allow(
              reason: 'User approved this agent action.',
            )
          : const AgentAuthorizationDecision.deny(
              reason: 'User denied this agent action.',
            ),
    );
  }

  Future<AgentAccessState> _load() async {
    final RecipeStore store = await ref.read(recipeStoreProvider.future);
    final settings = await store.loadAgentAccessSettings();
    final DateTime cutoff = DateTime.now()
        .toUtc()
        .subtract(Duration(days: settings.auditRetentionDays));
    await store.pruneAgentAuditEntriesOlderThan(cutoff);
    await store.trimAgentAuditEntriesToLimit(500);
    final sessions = await store.listAgentSessions(limit: 20);
    final auditEntries = await store.listAgentAuditEntries(limit: 30);
    return AgentAccessState(
      settings: settings,
      sessions: sessions,
      auditEntries: auditEntries,
      pendingApproval: state.valueOrNull?.pendingApproval,
    );
  }

  Future<void> _updateSettings(
    AgentAccessSettingsRecord Function(AgentAccessSettingsRecord current) mutate,
  ) async {
    final RecipeStore store = await ref.read(recipeStoreProvider.future);
    final AgentAccessSettingsRecord current =
        await store.loadAgentAccessSettings();
    await store.saveAgentAccessSettings(mutate(current));
    await refresh();
  }
}
