import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:execution_protocol/execution_protocol.dart';
import 'package:executor_broker/executor_broker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_recipe_lab_mobile/src/app/pack_catalog.dart';
import 'package:mobile_recipe_lab_mobile/src/features/workbench/report_exporter.dart';
import 'package:operation_registry/operation_registry.dart';
import 'package:pack_learning_content/pack_learning_content.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistence_drift/persistence_drift.dart';
import 'package:recipe_domain/recipe_domain.dart';

final operationRegistryProvider = Provider<OperationRegistry>((Ref ref) {
  final packs = ref.watch(installedPacksProvider);
  return PackLoader().load(packs.map((InstalledPackDescriptor entry) => entry.pack));
});

final executorBrokerProvider = Provider<ExecutorBroker>((Ref ref) {
  return ExecutorBroker(registry: ref.watch(operationRegistryProvider));
});

final workbenchServiceProvider = Provider<WorkbenchService>((Ref ref) {
  return WorkbenchService(ref.watch(executorBrokerProvider));
});

final recipeStoreProvider = FutureProvider<RecipeStore>((Ref ref) async {
  String? sqliteFilePath;
  if (!kIsWeb) {
    final directory = await getApplicationDocumentsDirectory();
    sqliteFilePath = '${directory.path}/mobile_recipe_lab.sqlite';
  }
  final store = RecipeStore(RecipeDatabase.open(sqliteFilePath: sqliteFilePath));
  ref.onDispose(() {
    unawaited(store.close());
  });
  return store;
});

final savedRecipesProvider = FutureProvider<List<SavedRecipeRecord>>((Ref ref) async {
  final store = await ref.watch(recipeStoreProvider.future);
  return store.listRecipes();
});

final availableOperationsProvider = Provider<List<RegisteredOperation>>((Ref ref) {
  final registry = ref.watch(operationRegistryProvider);
  final operations = registry.operations.toList(growable: false)
    ..sort(
      (RegisteredOperation a, RegisteredOperation b) {
        final categoryCompare = a.operation.manifest.category.compareTo(
          b.operation.manifest.category,
        );
        if (categoryCompare != 0) {
          return categoryCompare;
        }
        return a.operation.manifest.title.compareTo(b.operation.manifest.title);
      },
    );
  return operations;
});

final learningContentProvider =
    Provider<Map<String, OperationLearningContent>>((Ref ref) {
  return ref.watch(installedLearningContentProvider);
});

final workbenchControllerProvider =
    NotifierProvider<WorkbenchController, WorkbenchState>(
  WorkbenchController.new,
);

class WorkbenchState {
  const WorkbenchState({
    required this.input,
    required this.steps,
    required this.selectedOperationId,
    required this.recipeTitle,
    this.currentRecipeId,
    this.isRunning = false,
    this.output,
    this.error,
    this.infoMessage,
    this.lastRunRecipe,
  });

  factory WorkbenchState.initial(String selectedOperationId) {
    return WorkbenchState(
      input: '',
      steps: const <RecipeStep>[],
      selectedOperationId: selectedOperationId,
      recipeTitle: 'Workbench Recipe',
    );
  }

  final String input;
  final List<RecipeStep> steps;
  final String selectedOperationId;
  final String recipeTitle;
  final String? currentRecipeId;
  final bool isRunning;
  final PayloadEnvelope? output;
  final String? error;
  final String? infoMessage;
  final RecipeDocument? lastRunRecipe;

  WorkbenchState copyWith({
    String? input,
    List<RecipeStep>? steps,
    String? selectedOperationId,
    String? recipeTitle,
    String? currentRecipeId,
    bool? isRunning,
    PayloadEnvelope? output,
    String? error,
    String? infoMessage,
    bool clearOutput = false,
    bool clearError = false,
    bool clearInfo = false,
    RecipeDocument? lastRunRecipe,
  }) {
    return WorkbenchState(
      input: input ?? this.input,
      steps: steps ?? this.steps,
      selectedOperationId: selectedOperationId ?? this.selectedOperationId,
      recipeTitle: recipeTitle ?? this.recipeTitle,
      currentRecipeId: currentRecipeId ?? this.currentRecipeId,
      isRunning: isRunning ?? this.isRunning,
      output: clearOutput ? null : (output ?? this.output),
      error: clearError ? null : (error ?? this.error),
      infoMessage: clearInfo ? null : (infoMessage ?? this.infoMessage),
      lastRunRecipe: lastRunRecipe ?? this.lastRunRecipe,
    );
  }
}

class WorkbenchController extends Notifier<WorkbenchState> {
  int _stepCounter = 0;
  CancellationController? _cancellationController;

  @override
  WorkbenchState build() {
    final operations = ref.watch(availableOperationsProvider);
    return WorkbenchState.initial(operations.first.operation.manifest.id);
  }

  void setInput(String value) {
    state = state.copyWith(
      input: value,
      clearError: true,
      clearInfo: true,
    );
    unawaited(runRecipe());
  }

  void setRecipeTitle(String value) {
    state = state.copyWith(recipeTitle: value, clearInfo: true);
  }

  void selectOperation(String operationId) {
    state = state.copyWith(selectedOperationId: operationId);
  }

  void addSelectedOperation() {
    final registry = ref.read(operationRegistryProvider);
    final registered = registry.resolve(
      state.selectedOperationId,
      versionRange: '^1.0.0',
    );
    final RecipeStep step = _buildStep(registered);
    state = state.copyWith(
      steps: <RecipeStep>[...state.steps, step],
      clearError: true,
      clearInfo: true,
    );
    unawaited(runRecipe());
  }

  void removeStep(String stepId) {
    state = state.copyWith(
      steps: state.steps.where((RecipeStep step) => step.stepId != stepId).toList(),
      clearError: true,
      clearInfo: true,
    );
    unawaited(runRecipe());
  }

  void updateStep(RecipeStep updatedStep) {
    state = state.copyWith(
      steps: state.steps
          .map(
            (RecipeStep step) =>
                step.stepId == updatedStep.stepId ? updatedStep : step,
          )
          .toList(growable: false),
      clearError: true,
      clearInfo: true,
    );
    unawaited(runRecipe());
  }

  Future<void> loadLearningExample(
    String operationId,
    LearningExample example,
  ) async {
    final registry = ref.read(operationRegistryProvider);
    final registered = registry.resolve(
      operationId,
      versionRange: '^1.0.0',
    );
    state = state.copyWith(
      recipeTitle: example.title,
      currentRecipeId: null,
      input: example.input,
      selectedOperationId: operationId,
      steps: <RecipeStep>[
        _buildStep(
          registered,
          params: example.params,
          label: '${registered.operation.manifest.title} Example',
        ),
      ],
      clearError: true,
      clearInfo: true,
    );
    await runRecipe();
  }

  void moveStep(String stepId, int delta) {
    final int currentIndex =
        state.steps.indexWhere((RecipeStep step) => step.stepId == stepId);
    if (currentIndex == -1) {
      return;
    }
    final int nextIndex = currentIndex + delta;
    if (nextIndex < 0 || nextIndex >= state.steps.length) {
      return;
    }
    final List<RecipeStep> steps = List<RecipeStep>.from(state.steps);
    final RecipeStep item = steps.removeAt(currentIndex);
    steps.insert(nextIndex, item);
    state = state.copyWith(steps: steps, clearInfo: true, clearError: true);
    unawaited(runRecipe());
  }

  Future<void> saveRecipe() async {
    final store = await ref.read(recipeStoreProvider.future);
    final now = DateTime.now().toUtc();
    final recipe = _buildRecipe(
      recipeId: (state.currentRecipeId == null || state.currentRecipeId!.isEmpty)
          ? now.microsecondsSinceEpoch.toString()
          : state.currentRecipeId!,
      now: now,
    );
    final RecipeDocument persistedRecipe = _stripSecretParamsForPersistence(recipe);
    await store.saveRecipe(persistedRecipe);
    ref.invalidate(savedRecipesProvider);
    state = state.copyWith(
      currentRecipeId: recipe.recipeId,
      lastRunRecipe: recipe,
      infoMessage: _hasSecretParams(recipe)
          ? 'Recipe saved locally. Secret parameters were omitted from storage.'
          : 'Recipe saved locally.',
      clearError: true,
    );
  }

  Future<void> loadRecipe(RecipeDocument recipe) async {
    _stepCounter = recipe.steps.length;
    state = state.copyWith(
      recipeTitle: recipe.title,
      currentRecipeId: recipe.recipeId,
      steps: recipe.steps,
      clearError: true,
      infoMessage: 'Recipe loaded.',
      lastRunRecipe: recipe,
    );
    await runRecipe();
  }

  Future<void> deleteRecipe(String recipeId) async {
    final store = await ref.read(recipeStoreProvider.future);
    await store.deleteRecipe(recipeId);
    ref.invalidate(savedRecipesProvider);
    if (state.currentRecipeId == recipeId) {
      state = state.copyWith(
        currentRecipeId: '',
        infoMessage: 'Recipe deleted.',
      );
    }
  }

  Future<void> exportResultsMarkdown() async {
    if (kIsWeb) {
      state = state.copyWith(
        infoMessage: 'Markdown file export is available on device builds.',
        clearError: true,
      );
      return;
    }
    if (state.steps.where((RecipeStep step) => step.enabled).isEmpty) {
      state = state.copyWith(
        infoMessage: 'Add at least one enabled step before exporting a report.',
        clearError: true,
      );
      return;
    }

    final recipe = _buildRecipe(
      recipeId: (state.currentRecipeId == null || state.currentRecipeId!.isEmpty)
          ? 'recipe-export'
          : state.currentRecipeId!,
      now: DateTime.now().toUtc(),
    );
    final registry = ref.read(operationRegistryProvider);
    final learning = ref.read(learningContentProvider);
    final List<_ExportStepRecord> records = <_ExportStepRecord>[];
    PayloadEnvelope current = PayloadEnvelope(
      kind: PayloadKind.text,
      sizeBytes: state.input.length,
      data: state.input,
      mediaType: 'text/plain',
      characterEncoding: 'utf-8',
    );

    for (final RecipeStep step in recipe.steps) {
      if (!step.enabled) {
        continue;
      }
      final registered = registry.resolve(
        step.operation.id,
        versionRange: step.operation.versionRange,
      );
      final stepRecipe = RecipeDocument(
        schemaVersion: recipe.schemaVersion,
        recipeId: '${recipe.recipeId}-${step.stepId}',
        title: recipe.title,
        createdAt: recipe.createdAt,
        updatedAt: recipe.updatedAt,
        tags: <String>[registered.packId],
        inputAssumptions: recipe.inputAssumptions,
        compatibility: RecipeCompatibility(
          minAppProtocolVersion: kProtocolVersion,
          requiredPacks: <RequiredPackRef>[
            RequiredPackRef(packId: registered.packId, versionRange: '^1.0.0'),
          ],
        ),
        steps: <RecipeStep>[step],
        notes: recipe.notes,
        provenance: recipe.provenance,
        description: recipe.description,
      );
      final result = await ref.read(workbenchServiceProvider).runRecipe(
            ExecutionRequest(
              requestId: '${DateTime.now().microsecondsSinceEpoch}-${step.stepId}',
              input: current,
              recipe: stepRecipe,
              previewMode: false,
            ),
          );
      if (!result.success || result.output == null) {
        state = state.copyWith(
          infoMessage: 'Report export stopped at ${registered.operation.manifest.title}.',
          error: result.error?.userMessage ?? 'Export replay failed.',
        );
        return;
      }
      current = result.output!;
      records.add(
        _ExportStepRecord(
          step: step,
          operation: registered,
          learning: learning[registered.operation.manifest.id],
          output: current,
        ),
      );
    }

    final String markdown = _buildMarkdownReport(
      recipe: recipe,
      finalOutput: current,
      records: records,
    );
    final String safeTitle = recipe.title
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
        .replaceAll(RegExp(r'_+'), '_')
        .replaceAll(RegExp(r'^_|_$'), '');
    final String path = await exportMarkdownReport(
      fileName:
          '${safeTitle.isEmpty ? 'workbench_report' : safeTitle}_${DateTime.now().millisecondsSinceEpoch}.md',
      markdown: markdown,
    );
    state = state.copyWith(
      infoMessage: 'Report exported to $path',
      clearError: true,
    );
  }

  Future<void> runRecipe() async {
    _cancellationController?.cancel();
    final controller = CancellationController();
    _cancellationController = controller;

    if (state.steps.isEmpty) {
      state = state.copyWith(clearOutput: true, clearError: true);
      return;
    }

    final recipe = _buildRecipe(
      recipeId: (state.currentRecipeId == null || state.currentRecipeId!.isEmpty)
          ? 'recipe-preview'
          : state.currentRecipeId!,
      now: DateTime.now().toUtc(),
    );

    state = state.copyWith(isRunning: true, clearError: true);
    final result = await ref.read(workbenchServiceProvider).runRecipe(
          ExecutionRequest(
            requestId: DateTime.now().microsecondsSinceEpoch.toString(),
            input: PayloadEnvelope(
              kind: PayloadKind.text,
              sizeBytes: state.input.length,
              data: state.input,
              mediaType: 'text/plain',
              characterEncoding: 'utf-8',
            ),
            recipe: recipe,
            previewMode: true,
            previewOutputByteLimit: 4096,
          ),
          cancellationToken: controller.token,
        );

    if (_cancellationController != controller) {
      return;
    }

    state = state.copyWith(
      isRunning: false,
      output: result.output,
      error: result.success ? null : result.error?.userMessage ?? 'Execution failed.',
      clearOutput: !result.success,
      lastRunRecipe: recipe,
    );
  }

  RecipeDocument _buildRecipe({
    required String recipeId,
    required DateTime now,
  }) {
    final registry = ref.read(operationRegistryProvider);
    final requiredPackIds = state.steps
        .map(
          (RecipeStep step) => registry.resolve(
            step.operation.id,
            versionRange: step.operation.versionRange,
          ).packId,
        )
        .toSet()
        .toList(growable: false)
      ..sort();

    return RecipeDocument(
      schemaVersion: kRecipeSchemaVersion,
      recipeId: recipeId,
      title: state.recipeTitle.trim().isEmpty ? 'Untitled Recipe' : state.recipeTitle.trim(),
      createdAt: state.lastRunRecipe?.createdAt ?? now,
      updatedAt: now,
      tags: requiredPackIds,
      inputAssumptions: const InputAssumptions(preferredKind: PayloadKind.text),
      compatibility: RecipeCompatibility(
        minAppProtocolVersion: kProtocolVersion,
        requiredPacks: requiredPackIds
            .map(
              (String packId) => RequiredPackRef(
                packId: packId,
                versionRange: '^1.0.0',
              ),
            )
            .toList(growable: false),
      ),
      steps: state.steps,
      notes: const <RecipeNote>[],
      provenance: const RecipeProvenance(createdBy: 'user', source: 'manual'),
      description: 'Saved from the mobile workbench.',
    );
  }

  RecipeStep _buildStep(
    RegisteredOperation registered, {
    Map<String, Object?>? params,
    String? label,
  }) {
    final Map<String, Object?> defaultParams = <String, Object?>{
      for (final ParamFieldSpec field in registered.operation.manifest.params)
        if (field.defaultValue != null) field.id: field.defaultValue,
    };
    return RecipeStep(
      stepId: 'step_${_stepCounter++}',
      enabled: true,
      operation: RecipeOperationRef(
        id: registered.operation.manifest.id,
        versionRange: '^1.0.0',
      ),
      params: <String, Object?>{
        ...defaultParams,
        ...?params,
      },
      label: label ?? registered.operation.manifest.title,
    );
  }

  String _buildMarkdownReport({
    required RecipeDocument recipe,
    required PayloadEnvelope finalOutput,
    required List<_ExportStepRecord> records,
  }) {
    final StringBuffer buffer = StringBuffer()
      ..writeln('# ${recipe.title}')
      ..writeln()
      ..writeln('## Input')
      ..writeln()
      ..writeln('```text')
      ..writeln(state.input)
      ..writeln('```')
      ..writeln();

    for (int index = 0; index < records.length; index++) {
      final record = records[index];
      buffer
        ..writeln('## Step ${index + 1}: ${record.operation.operation.manifest.title}')
        ..writeln()
        ..writeln(record.operation.operation.manifest.shortDescription)
        ..writeln();

      if (record.learning != null) {
        buffer
          ..writeln('### Why This Step Exists')
          ..writeln()
          ..writeln(record.learning!.whatItDoes)
          ..writeln();
        if (record.learning!.howItWorks.isNotEmpty) {
          buffer.writeln('### How It Works');
          buffer.writeln();
          for (int stepIndex = 0; stepIndex < record.learning!.howItWorks.length; stepIndex++) {
            buffer.writeln('${stepIndex + 1}. ${record.learning!.howItWorks[stepIndex]}');
          }
          buffer.writeln();
        }
      }

      if (record.step.params.isNotEmpty) {
        buffer
          ..writeln('### Parameters')
          ..writeln();
        final Map<String, Object?> displayParams = _redactParamsForDisplay(record);
        for (final entry in displayParams.entries) {
          buffer.writeln('- `${entry.key}`: `${entry.value}`');
        }
        buffer.writeln();
      }

      buffer
        ..writeln('### Output After This Step')
        ..writeln()
        ..writeln('```text')
        ..writeln(record.output.asText())
        ..writeln('```')
        ..writeln();
    }

    buffer
      ..writeln('## Final Output')
      ..writeln()
      ..writeln('```text')
      ..writeln(finalOutput.asText())
      ..writeln('```');

    return buffer.toString();
  }

  RecipeDocument _stripSecretParamsForPersistence(RecipeDocument recipe) {
    final registry = ref.read(operationRegistryProvider);
    return recipe.copyWith(
      steps: recipe.steps.map((RecipeStep step) {
        final RegisteredOperation registered = registry.resolve(
          step.operation.id,
          versionRange: step.operation.versionRange,
        );
        final Set<String> secretFields = registered.operation.manifest.params
            .where((ParamFieldSpec field) => field.secret)
            .map((ParamFieldSpec field) => field.id)
            .toSet();
        if (secretFields.isEmpty) {
          return step;
        }
        final Map<String, Object?> sanitizedParams = Map<String, Object?>.from(step.params)
          ..removeWhere((String key, Object? value) => secretFields.contains(key));
        return step.copyWith(params: sanitizedParams);
      }).toList(growable: false),
    );
  }

  bool _hasSecretParams(RecipeDocument recipe) {
    final registry = ref.read(operationRegistryProvider);
    for (final RecipeStep step in recipe.steps) {
      final RegisteredOperation registered = registry.resolve(
        step.operation.id,
        versionRange: step.operation.versionRange,
      );
      final Set<String> secretFields = registered.operation.manifest.params
          .where((ParamFieldSpec field) => field.secret)
          .map((ParamFieldSpec field) => field.id)
          .toSet();
      if (step.params.keys.any(secretFields.contains)) {
        return true;
      }
    }
    return false;
  }

  Map<String, Object?> _redactParamsForDisplay(_ExportStepRecord record) {
    final Set<String> secretFields = record.operation.operation.manifest.params
        .where((ParamFieldSpec field) => field.secret)
        .map((ParamFieldSpec field) => field.id)
        .toSet();
    return <String, Object?>{
      for (final MapEntry<String, Object?> entry in record.step.params.entries)
        entry.key: secretFields.contains(entry.key) ? '<redacted>' : entry.value,
    };
  }
}

class _ExportStepRecord {
  const _ExportStepRecord({
    required this.step,
    required this.operation,
    required this.learning,
    required this.output,
  });

  final RecipeStep step;
  final RegisteredOperation operation;
  final OperationLearningContent? learning;
  final PayloadEnvelope output;
}
