import 'dart:isolate';

import 'package:execution_protocol/execution_protocol.dart';

class IsolateOperationExecutor {
  Future<StepExecutionResult> execute(
    Operation operation, {
    required OperationContext context,
    required PayloadEnvelope input,
    required Map<String, Object?> params,
  }) async {
    context.cancellationToken.throwIfCancelled();
    final _OperationInvocation invocation = _OperationInvocation(
      operation: operation,
      context: context,
      input: input,
      params: params,
    );
    final StepExecutionResult result =
        await Isolate.run<StepExecutionResult>(() => _runInvocation(invocation));
    context.cancellationToken.throwIfCancelled();
    return result;
  }
}

class _OperationInvocation {
  const _OperationInvocation({
    required this.operation,
    required this.context,
    required this.input,
    required this.params,
  });

  final Operation operation;
  final OperationContext context;
  final PayloadEnvelope input;
  final Map<String, Object?> params;
}

Future<StepExecutionResult> _runInvocation(_OperationInvocation invocation) {
  return invocation.operation.run(
    invocation.context,
    invocation.input,
    invocation.params,
  );
}
