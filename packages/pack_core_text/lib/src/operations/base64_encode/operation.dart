import 'dart:convert';

import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class Base64EncodeOperation implements Operation {
  const Base64EncodeOperation();

  @override
  OperationManifest get manifest => base64EncodeManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final int lineBreakInterval = (params['lineBreakInterval'] as int?) ?? 0;
    final String encoded = base64Encode(input.asBytes());
    final String output = lineBreakInterval <= 0
        ? encoded
        : _chunk(encoded, lineBreakInterval).join('\n');
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

  List<String> _chunk(String input, int width) {
    final List<String> parts = <String>[];
    for (int offset = 0; offset < input.length; offset += width) {
      final int end = (offset + width).clamp(0, input.length);
      parts.add(input.substring(offset, end));
    }
    return parts;
  }
}
