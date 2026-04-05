import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class AtbashOperation implements Operation {
  const AtbashOperation();

  @override
  OperationManifest get manifest => atbashManifest;

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
      if (rune >= 65 && rune <= 90) {
        buffer.writeCharCode(90 - (rune - 65));
      } else if (rune >= 97 && rune <= 122) {
        buffer.writeCharCode(122 - (rune - 97));
      } else {
        buffer.writeCharCode(rune);
      }
    }
    return buffer.toString();
  }
}
