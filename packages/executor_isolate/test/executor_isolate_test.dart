import 'package:execution_protocol/execution_protocol.dart';
import 'package:executor_isolate/executor_isolate.dart';
import 'package:test/test.dart';

void main() {
  test('cancellation token is checked before isolate work', () async {
    final CancellationController controller = CancellationController();
    controller.cancel();
    final IsolateOperationExecutor executor = IsolateOperationExecutor();

    await expectLater(
      executor.execute(
        _EchoOperation(),
        context: OperationContext(
          requestId: 'test',
          previewMode: false,
          cancellationToken: controller.token,
        ),
        input: const PayloadEnvelope(
          kind: PayloadKind.text,
          sizeBytes: 5,
          data: 'hello',
        ),
        params: const <String, Object?>{},
      ),
      throwsA(isA<CancelledException>()),
    );
  });
}

class _EchoOperation implements Operation {
  @override
  OperationManifest get manifest => const OperationManifest(
        id: 'test.echo',
        version: '1.0.0',
        title: 'Echo',
        shortDescription: 'Returns its input.',
        category: 'Test',
        tags: <String>['echo'],
        inputKinds: <PayloadKind>[PayloadKind.text],
        outputKinds: <PayloadKind>[PayloadKind.text],
        params: <ParamFieldSpec>[],
        capabilities: CapabilitySet(
          deterministic: true,
          reversible: true,
          previewSafe: true,
          supportsLargeInputs: true,
          supportsStreamingFuture: true,
          mayProduceBinary: false,
          requiresSecretParams: false,
          educational: false,
        ),
        stability: Stability.stable,
        backendKind: BackendKind.backgroundIsolate,
      );

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    return StepExecutionResult(
      output: input,
      metrics: const StepMetrics(elapsedMs: 0, inputBytes: 5, outputBytes: 5),
    );
  }
}
