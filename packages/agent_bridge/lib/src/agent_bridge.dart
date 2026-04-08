import 'dart:async';

import 'package:execution_protocol/execution_protocol.dart';
import 'package:executor_broker/executor_broker.dart';
import 'package:operation_registry/operation_registry.dart';
import 'package:pack_learning_content/pack_learning_content.dart';
import 'package:recipe_domain/recipe_domain.dart';

enum AgentTransport { mcp, https }

enum AgentTool {
  listPacks,
  listOperations,
  searchOperations,
  describeOperation,
  validateRecipe,
  runRecipe,
  runSingleOperation,
  loadLearningContent,
}

enum AgentApprovalMode { none, session, perRequest }

class AgentRequestContext {
  const AgentRequestContext({
    required this.agentId,
    required this.transport,
    required this.hasUserConsent,
    required this.visibleSession,
    this.sessionId,
    this.purpose,
    this.meta = const <String, Object?>{},
  });

  final String agentId;
  final AgentTransport transport;
  final bool hasUserConsent;
  final bool visibleSession;
  final String? sessionId;
  final String? purpose;
  final Map<String, Object?> meta;
}

class AgentPermissionPolicy {
  const AgentPermissionPolicy({
    this.allowedTools = const <AgentTool>{},
    this.approvalMode = AgentApprovalMode.perRequest,
    this.requireVisibleSession = true,
    this.allowDiscoveryWithoutConsent = true,
  });

  const AgentPermissionPolicy.restrictive()
      : allowedTools = const <AgentTool>{},
        approvalMode = AgentApprovalMode.perRequest,
        requireVisibleSession = true,
        allowDiscoveryWithoutConsent = true;

  final Set<AgentTool> allowedTools;
  final AgentApprovalMode approvalMode;
  final bool requireVisibleSession;
  final bool allowDiscoveryWithoutConsent;
}

class AgentAuthorizationDecision {
  const AgentAuthorizationDecision({
    required this.allowed,
    this.reason,
  });

  const AgentAuthorizationDecision.allow({this.reason}) : allowed = true;

  const AgentAuthorizationDecision.deny({this.reason}) : allowed = false;

  final bool allowed;
  final String? reason;
}

typedef AgentAuthorizer = FutureOr<AgentAuthorizationDecision> Function(
  AgentTool tool,
  AgentRequestContext context,
);

enum AgentAuditEventKind {
  discovery,
  learningLookup,
  validation,
  execution,
}

class AgentAuditEntry {
  const AgentAuditEntry({
    required this.occurredAt,
    required this.tool,
    required this.kind,
    required this.agentId,
    required this.transport,
    required this.allowed,
    required this.details,
    this.sessionId,
    this.reason,
  });

  final DateTime occurredAt;
  final AgentTool tool;
  final AgentAuditEventKind kind;
  final String agentId;
  final AgentTransport transport;
  final bool allowed;
  final String? sessionId;
  final String? reason;
  final Map<String, Object?> details;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'occurredAt': occurredAt.toIso8601String(),
      'tool': tool.name,
      'kind': kind.name,
      'agentId': agentId,
      'transport': transport.name,
      'allowed': allowed,
      'sessionId': sessionId,
      'reason': reason,
      'details': details,
    };
  }
}

abstract class AgentAuditLogSink {
  Future<void> record(AgentAuditEntry entry);
}

class NoopAgentAuditLogSink implements AgentAuditLogSink {
  const NoopAgentAuditLogSink();

  @override
  Future<void> record(AgentAuditEntry entry) async {}
}

class InMemoryAgentAuditLogSink implements AgentAuditLogSink {
  final List<AgentAuditEntry> _entries = <AgentAuditEntry>[];

  List<AgentAuditEntry> get entries =>
      List<AgentAuditEntry>.unmodifiable(_entries);

  @override
  Future<void> record(AgentAuditEntry entry) async {
    _entries.add(entry);
  }
}

class AgentBridgeException implements Exception {
  const AgentBridgeException(this.message);

  final String message;

  @override
  String toString() => 'AgentBridgeException: $message';
}

class AgentPackDescriptor {
  const AgentPackDescriptor({
    required this.manifest,
    required this.operationIds,
  });

  final PackManifest manifest;
  final List<String> operationIds;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'manifest': manifest.toJson(),
      'operationIds': operationIds,
    };
  }
}

class AgentOperationSummary {
  const AgentOperationSummary({
    required this.packId,
    required this.packVersion,
    required this.manifest,
  });

  final String packId;
  final String packVersion;
  final OperationManifest manifest;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'packId': packId,
      'packVersion': packVersion,
      'manifest': manifest.toJson(),
    };
  }
}

class AgentOperationDescription {
  const AgentOperationDescription({
    required this.packId,
    required this.packVersion,
    required this.manifest,
    this.learningContent,
  });

  final String packId;
  final String packVersion;
  final OperationManifest manifest;
  final OperationLearningContent? learningContent;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'packId': packId,
      'packVersion': packVersion,
      'manifest': manifest.toJson(),
      'learningContent': learningContent == null
          ? null
          : _learningContentToJson(learningContent!),
    };
  }
}

class AgentRecipeValidationResult {
  const AgentRecipeValidationResult({
    required this.isValid,
    required this.recipeIssues,
    required this.stepParamIssues,
    required this.registryIssues,
  });

  final bool isValid;
  final List<Map<String, Object?>> recipeIssues;
  final Map<String, List<ParamValidationIssue>> stepParamIssues;
  final List<String> registryIssues;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'isValid': isValid,
      'recipeIssues': recipeIssues,
      'stepParamIssues': <String, Object?>{
        for (final MapEntry<String, List<ParamValidationIssue>> entry
            in stepParamIssues.entries)
          entry.key: entry.value
              .map((ParamValidationIssue issue) => issue.toJson())
              .toList(growable: false),
      },
      'registryIssues': registryIssues,
    };
  }
}

class AgentRunRecipeResult {
  const AgentRunRecipeResult({
    required this.execution,
    required this.stepExplanations,
  });

  final ExecutionResult execution;
  final List<Map<String, Object?>> stepExplanations;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'execution': _executionResultToJson(execution),
      'stepExplanations': stepExplanations,
    };
  }
}

class HeadlessAgentRuntime {
  HeadlessAgentRuntime({
    required OperationRegistry registry,
    required ExecutorBroker broker,
    required Map<String, OperationLearningContent> learningContent,
    this.permissionPolicy = const AgentPermissionPolicy.restrictive(),
    AgentAuthorizer? authorizer,
    AgentAuditLogSink? auditLogSink,
  })  : _registry = registry,
        _broker = broker,
        _learningContent = Map<String, OperationLearningContent>.unmodifiable(
          learningContent,
        ),
        _authorizer = authorizer,
        _auditLogSink = auditLogSink ?? const NoopAgentAuditLogSink();

  final OperationRegistry _registry;
  final ExecutorBroker _broker;
  final Map<String, OperationLearningContent> _learningContent;
  final AgentPermissionPolicy permissionPolicy;
  final AgentAuthorizer? _authorizer;
  final AgentAuditLogSink _auditLogSink;

  Future<List<AgentPackDescriptor>> listPacks(
      AgentRequestContext context) async {
    await _authorize(
      AgentTool.listPacks,
      context,
      kind: AgentAuditEventKind.discovery,
      details: <String, Object?>{},
    );
    final List<AgentPackDescriptor> packs = _registry.packs
        .map(
          (PackManifest pack) => AgentPackDescriptor(
            manifest: pack,
            operationIds: pack.operations
                .map((OperationManifest operation) => operation.id)
                .toList(growable: false),
          ),
        )
        .toList(growable: false)
      ..sort(
        (AgentPackDescriptor a, AgentPackDescriptor b) =>
            a.manifest.packId.compareTo(b.manifest.packId),
      );
    await _recordAllowedAudit(
      AgentTool.listPacks,
      AgentAuditEventKind.discovery,
      context,
      <String, Object?>{
        'packCount': packs.length,
      },
    );
    return packs;
  }

  Future<List<AgentOperationSummary>> listOperations(
    AgentRequestContext context,
  ) async {
    await _authorize(
      AgentTool.listOperations,
      context,
      kind: AgentAuditEventKind.discovery,
      details: <String, Object?>{},
    );
    final List<AgentOperationSummary> operations = _registry.operations
        .map(
          (RegisteredOperation operation) => AgentOperationSummary(
            packId: operation.packId,
            packVersion: operation.packVersion,
            manifest: operation.operation.manifest,
          ),
        )
        .toList(growable: false)
      ..sort(
        (AgentOperationSummary a, AgentOperationSummary b) =>
            a.manifest.id.compareTo(b.manifest.id),
      );
    await _recordAllowedAudit(
      AgentTool.listOperations,
      AgentAuditEventKind.discovery,
      context,
      <String, Object?>{
        'operationCount': operations.length,
      },
    );
    return operations;
  }

  Future<List<AgentOperationSummary>> searchOperations(
    String query,
    AgentRequestContext context,
  ) async {
    await _authorize(
      AgentTool.searchOperations,
      context,
      kind: AgentAuditEventKind.discovery,
      details: <String, Object?>{
        'queryLength': query.length,
      },
    );
    final Set<String> matchingIds = _registry
        .search(query)
        .map((OperationSearchEntry entry) => entry.id)
        .toSet();
    final List<AgentOperationSummary> operations = _registry.operations
        .where(
          (RegisteredOperation operation) =>
              matchingIds.contains(operation.operation.manifest.id),
        )
        .map(
          (RegisteredOperation operation) => AgentOperationSummary(
            packId: operation.packId,
            packVersion: operation.packVersion,
            manifest: operation.operation.manifest,
          ),
        )
        .toList(growable: false)
      ..sort(
        (AgentOperationSummary a, AgentOperationSummary b) =>
            a.manifest.id.compareTo(b.manifest.id),
      );
    await _recordAllowedAudit(
      AgentTool.searchOperations,
      AgentAuditEventKind.discovery,
      context,
      <String, Object?>{
        'queryLength': query.length,
        'resultCount': operations.length,
      },
    );
    return operations;
  }

  Future<AgentOperationDescription> describeOperation(
    String operationId,
    AgentRequestContext context, {
    String versionRange = '^1.0.0',
  }) async {
    await _authorize(
      AgentTool.describeOperation,
      context,
      kind: AgentAuditEventKind.discovery,
      details: <String, Object?>{
        'operationId': operationId,
      },
    );
    final RegisteredOperation operation = _registry.resolve(
      operationId,
      versionRange: versionRange,
    );
    final AgentOperationDescription description = AgentOperationDescription(
      packId: operation.packId,
      packVersion: operation.packVersion,
      manifest: operation.operation.manifest,
      learningContent: _learningContent[operationId],
    );
    await _recordAllowedAudit(
      AgentTool.describeOperation,
      AgentAuditEventKind.discovery,
      context,
      <String, Object?>{
        'operationId': operationId,
        'packId': description.packId,
      },
    );
    return description;
  }

  Future<OperationLearningContent?> loadLearningContent(
    String operationId,
    AgentRequestContext context,
  ) async {
    await _authorize(
      AgentTool.loadLearningContent,
      context,
      kind: AgentAuditEventKind.learningLookup,
      details: <String, Object?>{
        'operationId': operationId,
      },
    );
    final OperationLearningContent? learning = _learningContent[operationId];
    await _recordAllowedAudit(
      AgentTool.loadLearningContent,
      AgentAuditEventKind.learningLookup,
      context,
      <String, Object?>{
        'operationId': operationId,
        'found': learning != null,
      },
    );
    return learning;
  }

  Future<AgentRecipeValidationResult> validateRecipe(
    RecipeDocument recipe,
    AgentRequestContext context,
  ) async {
    await _authorize(
      AgentTool.validateRecipe,
      context,
      kind: AgentAuditEventKind.validation,
      details: <String, Object?>{
        'recipeId': recipe.recipeId,
        'stepCount': recipe.steps.length,
      },
    );

    final RecipeValidator recipeValidator = RecipeValidator();
    final List<Map<String, Object?>> recipeIssues = recipeValidator
        .validate(recipe)
        .map(
          (RecipeValidationIssue issue) => <String, Object?>{
            'code': issue.code,
            'message': issue.message,
            'stepId': issue.stepId,
          },
        )
        .toList(growable: false);

    final Map<String, List<ParamValidationIssue>> paramIssues =
        <String, List<ParamValidationIssue>>{};
    final List<String> registryIssues = <String>[];

    for (final RecipeStep step in recipe.steps) {
      try {
        final RegisteredOperation operation = _registry.resolve(
          step.operation.id,
          versionRange: step.operation.versionRange,
        );
        final List<ParamValidationIssue> issues = ParamSchemaValidator.validate(
          operation.operation.manifest.params,
          step.params,
        );
        if (issues.isNotEmpty) {
          paramIssues[step.stepId] = issues;
        }
      } on RegistryException catch (error) {
        registryIssues.add('${step.stepId}: ${error.message}');
      }
    }

    final AgentRecipeValidationResult result = AgentRecipeValidationResult(
      isValid:
          recipeIssues.isEmpty && paramIssues.isEmpty && registryIssues.isEmpty,
      recipeIssues: recipeIssues,
      stepParamIssues: paramIssues,
      registryIssues: registryIssues,
    );
    await _recordAllowedAudit(
      AgentTool.validateRecipe,
      AgentAuditEventKind.validation,
      context,
      <String, Object?>{
        'recipeId': recipe.recipeId,
        'isValid': result.isValid,
        'recipeIssueCount': result.recipeIssues.length,
        'paramIssueStepCount': result.stepParamIssues.length,
        'registryIssueCount': result.registryIssues.length,
      },
    );
    return result;
  }

  Future<AgentRunRecipeResult> runRecipe(
    RecipeDocument recipe,
    PayloadEnvelope input,
    AgentRequestContext context, {
    ExecutionPolicy policy = const ExecutionPolicy(),
    bool previewMode = false,
    int? previewOutputByteLimit,
  }) async {
    await _authorize(
      AgentTool.runRecipe,
      context,
      kind: AgentAuditEventKind.execution,
      details: <String, Object?>{
        'recipeId': recipe.recipeId,
        'stepCount': recipe.steps.length,
        'inputKind': input.kind.name,
        'inputBytes': input.sizeBytes,
        'previewMode': previewMode,
      },
    );

    final ExecutionResult execution = await _broker.execute(
      ExecutionRequest(
        requestId: _buildRequestId(context, recipe.recipeId),
        input: input,
        recipe: recipe,
        previewMode: previewMode,
        previewOutputByteLimit: previewOutputByteLimit,
        policy: policy,
      ),
    );

    final List<Map<String, Object?>> stepExplanations =
        recipe.steps.map((RecipeStep step) {
      final OperationLearningContent? learning =
          _learningContent[step.operation.id];
      return <String, Object?>{
        'stepId': step.stepId,
        'operationId': step.operation.id,
        'learning': learning == null ? null : _learningContentToJson(learning),
        'redactedParams': _redactParams(step),
      };
    }).toList(growable: false);

    await _auditLogSink.record(
      AgentAuditEntry(
        occurredAt: DateTime.now().toUtc(),
        tool: AgentTool.runRecipe,
        kind: AgentAuditEventKind.execution,
        agentId: context.agentId,
        transport: context.transport,
        allowed: true,
        sessionId: context.sessionId,
        details: <String, Object?>{
          'recipeId': recipe.recipeId,
          'success': execution.success,
          'outputKind': execution.output?.kind.name,
          'outputBytes': execution.output?.sizeBytes,
          'stepsAttempted': execution.metrics.stepsAttempted,
          'elapsedMs': execution.metrics.elapsedMs,
        },
      ),
    );

    return AgentRunRecipeResult(
      execution: execution,
      stepExplanations: stepExplanations,
    );
  }

  Future<AgentRunRecipeResult> runSingleOperation(
    String operationId,
    PayloadEnvelope input,
    Map<String, Object?> params,
    AgentRequestContext context, {
    String versionRange = '^1.0.0',
    ExecutionPolicy policy = const ExecutionPolicy(),
  }) async {
    await _authorize(
      AgentTool.runSingleOperation,
      context,
      kind: AgentAuditEventKind.execution,
      details: <String, Object?>{
        'operationId': operationId,
        'inputKind': input.kind.name,
        'inputBytes': input.sizeBytes,
      },
    );
    await _recordAllowedAudit(
      AgentTool.runSingleOperation,
      AgentAuditEventKind.execution,
      context,
      <String, Object?>{
        'operationId': operationId,
        'inputKind': input.kind.name,
        'inputBytes': input.sizeBytes,
      },
    );

    final RegisteredOperation operation = _registry.resolve(
      operationId,
      versionRange: versionRange,
    );
    final DateTime now = DateTime.now().toUtc();
    final RecipeDocument recipe = RecipeDocument(
      schemaVersion: kRecipeSchemaVersion,
      recipeId:
          '${context.agentId}_${operationId}_${now.microsecondsSinceEpoch}',
      title: operation.operation.manifest.title,
      description: 'Single-operation agent execution.',
      createdAt: now,
      updatedAt: now,
      tags: <String>[operation.packId],
      inputAssumptions: InputAssumptions(preferredKind: input.kind),
      compatibility: RecipeCompatibility(
        minAppProtocolVersion: kProtocolVersion,
        requiredPacks: <RequiredPackRef>[
          RequiredPackRef(
            packId: operation.packId,
            versionRange: versionRange,
          ),
        ],
      ),
      steps: <RecipeStep>[
        RecipeStep(
          stepId: 'step_0',
          enabled: true,
          operation: RecipeOperationRef(
            id: operationId,
            versionRange: versionRange,
          ),
          params: params,
          label: operation.operation.manifest.title,
        ),
      ],
      notes: const <RecipeNote>[],
      provenance: const RecipeProvenance(
        createdBy: 'agent',
        source: 'agent_bridge',
      ),
    );

    return runRecipe(
      recipe,
      input,
      context,
      policy: policy,
    );
  }

  Future<void> _authorize(
    AgentTool tool,
    AgentRequestContext context, {
    required AgentAuditEventKind kind,
    required Map<String, Object?> details,
  }) async {
    final bool isDiscoveryTool = tool == AgentTool.listPacks ||
        tool == AgentTool.listOperations ||
        tool == AgentTool.searchOperations ||
        tool == AgentTool.describeOperation ||
        tool == AgentTool.loadLearningContent;

    if (!permissionPolicy.allowedTools.contains(tool)) {
      await _denyAudit(
        tool,
        kind,
        context,
        details,
        reason: 'Tool is not enabled by the current permission policy.',
      );
      throw const AgentBridgeException(
        'Agent tool is not enabled by the current permission policy.',
      );
    }

    if (!context.hasUserConsent &&
        !(permissionPolicy.allowDiscoveryWithoutConsent && isDiscoveryTool)) {
      await _denyAudit(
        tool,
        kind,
        context,
        details,
        reason: 'User consent is required for this agent action.',
      );
      throw const AgentBridgeException(
        'User consent is required for this agent action.',
      );
    }

    if (permissionPolicy.requireVisibleSession && !context.visibleSession) {
      await _denyAudit(
        tool,
        kind,
        context,
        details,
        reason: 'A visible user session is required for agent access.',
      );
      throw const AgentBridgeException(
        'A visible user session is required for agent access.',
      );
    }

    if (_authorizer != null) {
      final AgentAuthorizer authorizer = _authorizer;
      final AgentAuthorizationDecision decision = await authorizer(
        tool,
        context,
      );
      if (!decision.allowed) {
        await _denyAudit(
          tool,
          kind,
          context,
          details,
          reason: decision.reason ?? 'Agent action denied.',
        );
        throw AgentBridgeException(decision.reason ?? 'Agent action denied.');
      }
    }
  }

  Future<void> _denyAudit(
    AgentTool tool,
    AgentAuditEventKind kind,
    AgentRequestContext context,
    Map<String, Object?> details, {
    required String reason,
  }) {
    return _auditLogSink.record(
      AgentAuditEntry(
        occurredAt: DateTime.now().toUtc(),
        tool: tool,
        kind: kind,
        agentId: context.agentId,
        transport: context.transport,
        allowed: false,
        sessionId: context.sessionId,
        reason: reason,
        details: details,
      ),
    );
  }

  Future<void> _recordAllowedAudit(
    AgentTool tool,
    AgentAuditEventKind kind,
    AgentRequestContext context,
    Map<String, Object?> details,
  ) {
    return _auditLogSink.record(
      AgentAuditEntry(
        occurredAt: DateTime.now().toUtc(),
        tool: tool,
        kind: kind,
        agentId: context.agentId,
        transport: context.transport,
        allowed: true,
        sessionId: context.sessionId,
        details: details,
      ),
    );
  }

  String _buildRequestId(AgentRequestContext context, String recipeId) {
    final String session = context.sessionId ?? 'no_session';
    return '${context.agentId}_${session}_$recipeId';
  }

  Map<String, Object?> _redactParams(RecipeStep step) {
    try {
      final RegisteredOperation operation = _registry.resolve(
        step.operation.id,
        versionRange: step.operation.versionRange,
      );
      final Set<String> secretFields = operation.operation.manifest.params
          .where((ParamFieldSpec field) => field.secret)
          .map((ParamFieldSpec field) => field.id)
          .toSet();
      return <String, Object?>{
        for (final MapEntry<String, Object?> entry in step.params.entries)
          entry.key:
              secretFields.contains(entry.key) ? '<redacted>' : entry.value,
      };
    } on RegistryException {
      return Map<String, Object?>.from(step.params);
    }
  }
}

Map<String, Object?> _learningContentToJson(OperationLearningContent content) {
  return <String, Object?>{
    'operationId': content.operationId,
    'whatItDoes': content.whatItDoes,
    'whenToUse': content.whenToUse,
    'gotchas': content.gotchas,
    'howItWorks': content.howItWorks,
    'relatedOperations': content.relatedOperations,
    'examples': content.examples
        .map(
          (LearningExample example) => <String, Object?>{
            'title': example.title,
            'input': example.input,
            'params': example.params,
            'expectedOutputText': example.expectedOutputText,
          },
        )
        .toList(growable: false),
  };
}

Map<String, Object?> _executionResultToJson(ExecutionResult result) {
  return <String, Object?>{
    'success': result.success,
    'output': result.output?.toJson(),
    'traces': result.traces
        .map((StepTrace trace) => trace.toJson())
        .toList(growable: false),
    'error': result.error?.toJson(),
    'metrics': result.metrics.toJson(),
  };
}
