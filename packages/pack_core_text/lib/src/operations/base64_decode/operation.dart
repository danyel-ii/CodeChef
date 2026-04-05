import 'dart:convert';
import 'dart:typed_data';

import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class Base64DecodeOperation implements Operation {
  const Base64DecodeOperation();

  @override
  OperationManifest get manifest => base64DecodeManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final String mode = (params['treatOutputAs'] as String?) ?? 'text';
    try {
      final Uint8List decoded = Uint8List.fromList(
        base64Decode((input.data as String).replaceAll(RegExp(r'\s+'), '')),
      );
      final PayloadEnvelope output = mode == 'bytes'
          ? PayloadEnvelope(
              kind: PayloadKind.bytes,
              sizeBytes: decoded.length,
              data: decoded,
              mediaType: 'application/octet-stream',
            )
          : PayloadEnvelope(
              kind: PayloadKind.text,
              sizeBytes: decoded.length,
              data: utf8.decode(decoded),
              mediaType: 'text/plain',
              characterEncoding: 'utf-8',
            );
      return StepExecutionResult(
        output: output,
        metrics: StepMetrics(
          elapsedMs: 0,
          inputBytes: input.sizeBytes,
          outputBytes: output.sizeBytes,
        ),
      );
    } on FormatException catch (error) {
      throw StateError('invalidInput:${error.message}');
    }
  }
}
