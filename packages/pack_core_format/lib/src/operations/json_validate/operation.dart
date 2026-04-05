import 'dart:convert';

import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class JsonValidateOperation implements Operation {
  const JsonValidateOperation();

  @override
  OperationManifest get manifest => jsonValidateManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    jsonDecode(input.asText());
    return StepExecutionResult(
      output: PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: input.sizeBytes,
        data: input.asText(),
        mediaType: 'application/json',
        characterEncoding: 'utf-8',
      ),
      diagnostics: const <Diagnostic>[
        Diagnostic(
          code: 'validJson',
          severity: DiagnosticSeverity.info,
          message: 'Input is valid JSON.',
        ),
      ],
      metrics: StepMetrics(
        elapsedMs: 0,
        inputBytes: input.sizeBytes,
        outputBytes: input.sizeBytes,
      ),
    );
  }
}
