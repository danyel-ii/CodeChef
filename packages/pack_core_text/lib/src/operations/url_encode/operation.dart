import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class UrlEncodeOperation implements Operation {
  const UrlEncodeOperation();

  @override
  OperationManifest get manifest => urlEncodeManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final bool spaceAsPlus = (params['spaceAsPlus'] as bool?) ?? false;
    String output = Uri.encodeComponent(input.data as String);
    if (spaceAsPlus) {
      output = output.replaceAll('%20', '+');
    }
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
