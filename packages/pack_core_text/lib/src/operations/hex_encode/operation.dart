import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class HexEncodeOperation implements Operation {
  const HexEncodeOperation();

  @override
  OperationManifest get manifest => hexEncodeManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final bool uppercase = (params['uppercase'] as bool?) ?? false;
    final StringBuffer buffer = StringBuffer();
    for (final int byte in input.asBytes()) {
      buffer.write(byte.toRadixString(16).padLeft(2, '0'));
    }
    final String output = uppercase ? buffer.toString().toUpperCase() : buffer.toString();
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
