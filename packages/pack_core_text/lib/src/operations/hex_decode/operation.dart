import 'dart:convert';
import 'dart:typed_data';

import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class HexDecodeOperation implements Operation {
  const HexDecodeOperation();

  @override
  OperationManifest get manifest => hexDecodeManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final String mode = (params['treatOutputAs'] as String?) ?? 'text';
    final String compact = (input.data as String).replaceAll(RegExp(r'\s+'), '');
    if (compact.length.isOdd) {
      throw StateError('invalidInput:Hex input must contain an even number of digits.');
    }
    final Uint8List bytes = Uint8List(compact.length ~/ 2);
    for (int i = 0; i < compact.length; i += 2) {
      final String pair = compact.substring(i, i + 2);
      final int? value = int.tryParse(pair, radix: 16);
      if (value == null) {
        throw StateError('invalidInput:Hex input contains non-hex characters.');
      }
      bytes[i ~/ 2] = value;
    }
    final PayloadEnvelope output = mode == 'bytes'
        ? PayloadEnvelope(
            kind: PayloadKind.bytes,
            sizeBytes: bytes.length,
            data: bytes,
            mediaType: 'application/octet-stream',
          )
        : PayloadEnvelope(
            kind: PayloadKind.text,
            sizeBytes: bytes.length,
            data: utf8.decode(bytes),
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
  }
}
