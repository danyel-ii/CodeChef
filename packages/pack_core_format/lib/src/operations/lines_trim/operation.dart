import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class LinesTrimOperation implements Operation {
  const LinesTrimOperation();

  @override
  OperationManifest get manifest => linesTrimManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    final String output =
        input.asText().split('\n').map((String line) => line.trim()).join('\n');
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
