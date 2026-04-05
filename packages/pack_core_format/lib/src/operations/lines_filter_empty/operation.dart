import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class LinesFilterEmptyOperation implements Operation {
  const LinesFilterEmptyOperation();

  @override
  OperationManifest get manifest => linesFilterEmptyManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    final String output = input
        .asText()
        .split('\n')
        .where((String line) => line.trim().isNotEmpty)
        .join('\n');
    return StepExecutionResult(
      output: PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: output.length,
        data: output,
      ),
      metrics: StepMetrics(
        elapsedMs: 0,
        inputBytes: input.sizeBytes,
        outputBytes: output.length,
      ),
    );
  }
}
