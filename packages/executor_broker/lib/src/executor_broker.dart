import 'dart:async';

import 'package:execution_protocol/execution_protocol.dart';
import 'package:executor_isolate/executor_isolate.dart';
import 'package:operation_registry/operation_registry.dart';
import 'package:recipe_domain/recipe_domain.dart';

class ExecutorBroker {
  ExecutorBroker({
    required OperationRegistry registry,
    IsolateOperationExecutor? isolateExecutor,
  })  : _registry = registry,
        _isolateExecutor = isolateExecutor ?? IsolateOperationExecutor();

  final OperationRegistry _registry;
  final IsolateOperationExecutor _isolateExecutor;

  Future<ExecutionResult> execute(
    ExecutionRequest request, {
    CancellationToken? cancellationToken,
  }) async {
    final DateTime startedAt = DateTime.now().toUtc();
    final RecipeDocument recipe = request.recipe as RecipeDocument;
    final CancellationToken token =
        cancellationToken ?? CancellationController().token;
    PayloadEnvelope current = request.input;
    final List<StepTrace> traces = <StepTrace>[];
    int stepsAttempted = 0;

    try {
      for (int index = 0; index < recipe.steps.length; index++) {
        token.throwIfCancelled();
        final RecipeStep step = recipe.steps[index];
        if (!step.enabled) {
          continue;
        }
        stepsAttempted += 1;
        final RegisteredOperation registered = _registry.resolve(
          step.operation.id,
          versionRange: step.operation.versionRange,
        );
        final List<ParamValidationIssue> paramIssues =
            ParamSchemaValidator.validate(
          registered.operation.manifest.params,
          step.params,
        );
        if (paramIssues.isNotEmpty) {
          return _failureResult(
            startedAt: startedAt,
            stepsAttempted: stepsAttempted,
            traces: traces,
            error: ExecutionError(
              code: ExecutionErrorCode.invalidParams,
              userMessage: 'Parameters are invalid for ${step.operation.id}.',
              developerMessage: paramIssues
                  .map((ParamValidationIssue issue) => issue.message)
                  .join('; '),
              stepIndex: index,
              operationId: step.operation.id,
            ),
          );
        }
        final OperationContext context = OperationContext(
          requestId: request.requestId,
          previewMode: request.previewMode,
          cancellationToken: token,
        );
        final StepExecutionResult result = await _runOperation(
          registered.operation,
          context: context,
          input: current,
          params: step.params,
        );
        current = _applyPreviewLimit(
          result.output,
          previewMode: request.previewMode,
          previewOutputByteLimit: request.previewOutputByteLimit,
        );
        traces.add(
          StepTrace(
            stepIndex: index,
            operationId: registered.operation.manifest.id,
            success: true,
            diagnostics: result.diagnostics,
            metrics: result.metrics,
          ),
        );
      }
      return ExecutionResult(
        success: true,
        output: current,
        traces: traces,
        metrics: ExecutionMetrics(
          elapsedMs: DateTime.now().toUtc().difference(startedAt).inMilliseconds,
          stepsAttempted: stepsAttempted,
        ),
      );
    } on CancelledException {
      return _failureResult(
        startedAt: startedAt,
        stepsAttempted: stepsAttempted,
        traces: traces,
        error: const ExecutionError(
          code: ExecutionErrorCode.cancelled,
          userMessage: 'Execution was cancelled.',
        ),
      );
    } on StateError catch (error) {
      final String message = error.message.toString();
      final bool invalidInput = message.startsWith('invalidInput:');
      return _failureResult(
        startedAt: startedAt,
        stepsAttempted: stepsAttempted,
        traces: traces,
        error: ExecutionError(
          code: invalidInput
              ? ExecutionErrorCode.invalidInput
              : ExecutionErrorCode.internal,
          userMessage: invalidInput
              ? message.substring('invalidInput:'.length)
              : 'Execution failed.',
          developerMessage: message,
        ),
      );
    } on RegistryException catch (error) {
      return _failureResult(
        startedAt: startedAt,
        stepsAttempted: stepsAttempted,
        traces: traces,
        error: ExecutionError(
          code: ExecutionErrorCode.migrationRequired,
          userMessage: error.message,
          developerMessage: error.message,
        ),
      );
    } catch (error) {
      return _failureResult(
        startedAt: startedAt,
        stepsAttempted: stepsAttempted,
        traces: traces,
        error: ExecutionError(
          code: ExecutionErrorCode.internal,
          userMessage: 'Execution failed.',
          developerMessage: error.toString(),
        ),
      );
    }
  }

  Future<StepExecutionResult> _runOperation(
    Operation operation, {
    required OperationContext context,
    required PayloadEnvelope input,
    required Map<String, Object?> params,
  }) {
    if (operation.manifest.backendKind == BackendKind.backgroundIsolate) {
      return _isolateExecutor.execute(
        operation,
        context: context,
        input: input,
        params: params,
      );
    }
    return operation.run(context, input, params);
  }

  PayloadEnvelope _applyPreviewLimit(
    PayloadEnvelope output, {
    required bool previewMode,
    required int? previewOutputByteLimit,
  }) {
    if (!previewMode || previewOutputByteLimit == null) {
      return output;
    }
    if (output.sizeBytes <= previewOutputByteLimit) {
      return output;
    }
    if (output.kind == PayloadKind.text) {
      final String text = output.data as String;
      final int end = previewOutputByteLimit.clamp(0, text.length);
      final String truncated = text.substring(0, end);
      return PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: truncated.length,
        data: truncated,
        mediaType: output.mediaType,
        characterEncoding: output.characterEncoding,
        meta: <String, Object?>{
          ...output.meta,
          'truncated': true,
          'fullSizeBytes': output.sizeBytes,
        },
      );
    }
    return output;
  }

  ExecutionResult _failureResult({
    required DateTime startedAt,
    required int stepsAttempted,
    required List<StepTrace> traces,
    required ExecutionError error,
  }) {
    return ExecutionResult(
      success: false,
      traces: traces,
      error: error,
      metrics: ExecutionMetrics(
        elapsedMs: DateTime.now().toUtc().difference(startedAt).inMilliseconds,
        stepsAttempted: stepsAttempted,
      ),
    );
  }
}
