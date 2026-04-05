import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/src/operations/shared/alpha_shift.dart';

import 'manifest.dart';

class CaesarOperation implements Operation {
  const CaesarOperation();

  @override
  OperationManifest get manifest => caesarManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final int shift = (params['shift'] as int?) ?? 3;
    final String mode = (params['mode'] as String?) ?? 'encode';
    final int appliedShift = mode == 'decode' ? -shift : shift;
    final output = shiftAlphabetic(input.asText(), shift: appliedShift);
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
