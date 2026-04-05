import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class Rot47Operation implements Operation {
  const Rot47Operation();

  @override
  OperationManifest get manifest => rot47Manifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final String output = _transform(input.asText());
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

  String _transform(String input) {
    final StringBuffer buffer = StringBuffer();
    for (final int rune in input.runes) {
      if (rune >= 33 && rune <= 126) {
        buffer.writeCharCode(33 + ((rune - 33 + 47) % 94));
      } else {
        buffer.writeCharCode(rune);
      }
    }
    return buffer.toString();
  }
}
