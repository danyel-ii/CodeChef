import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class UrlDecodeOperation implements Operation {
  const UrlDecodeOperation();

  @override
  OperationManifest get manifest => urlDecodeManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final bool plusAsSpace = (params['plusAsSpace'] as bool?) ?? true;
    final String raw = input.data as String;
    final String prepared = plusAsSpace ? raw.replaceAll('+', '%20') : raw;
    final String output = Uri.decodeComponent(prepared);
    return StepExecutionResult(
      output: PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: output.length,
        data: output,
        mediaType: 'text/plain',
        characterEncoding: 'utf-8',
      ),
      metrics: StepMetrics(
        elapsedMs: 0,
        inputBytes: input.sizeBytes,
        outputBytes: output.length,
      ),
    );
  }
}
