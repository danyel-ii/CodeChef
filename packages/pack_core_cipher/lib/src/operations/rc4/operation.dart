import 'dart:typed_data';

import 'package:execution_protocol/execution_protocol.dart';
import 'package:pointycastle/export.dart';

import '../shared/byte_format_codec.dart';
import 'manifest.dart';

class Rc4Operation implements Operation {
  const Rc4Operation();

  @override
  OperationManifest get manifest => rc4Manifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final String key = (params['key'] as String?) ?? '';
    if (key.isEmpty) {
      throw StateError('invalidParams:RC4 requires a non-empty key.');
    }
    final String keyFormat = (params['keyFormat'] as String?) ?? 'text';
    final String inputFormat = (params['inputFormat'] as String?) ?? 'text';
    final String outputFormat = (params['outputFormat'] as String?) ?? 'hex';
    final Uint8List keyBytes = decodeByteFormat(key, keyFormat, fieldLabel: 'Key');
    final Uint8List inputBytes = decodeByteFormat(input.asText(), inputFormat, fieldLabel: 'Input');
    final RC4Engine cipher = RC4Engine()..init(true, KeyParameter(keyBytes));
    final Uint8List outputBytes = cipher.process(inputBytes);
    final String rendered = encodeByteFormat(outputBytes, outputFormat);
    return StepExecutionResult(
      output: PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: rendered.length,
        data: rendered,
        mediaType: 'text/plain',
        characterEncoding: 'utf-8',
      ),
      metrics: StepMetrics(
        elapsedMs: 0,
        inputBytes: input.sizeBytes,
        outputBytes: rendered.length,
      ),
    );
  }
}
