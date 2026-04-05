import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class LinesJoinOperation implements Operation {
  const LinesJoinOperation();

  @override
  OperationManifest get manifest => linesJoinManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    final String separator = (params['separator'] as String?) ?? ', ';
    final String output = input.asText().split('\n').join(separator);
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
