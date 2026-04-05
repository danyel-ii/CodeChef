import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/src/operations/shared/alpha_shift.dart';

import 'manifest.dart';

class Rot13Operation implements Operation {
  const Rot13Operation();

  @override
  OperationManifest get manifest => rot13Manifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final output = shiftAlphabetic(input.asText(), shift: 13);
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
