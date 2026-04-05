import 'dart:convert';
import 'dart:typed_data';

import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class XorOperation implements Operation {
  const XorOperation();

  @override
  OperationManifest get manifest => xorManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final String key = (params['key'] as String?) ?? '';
    if (key.isEmpty) {
      throw StateError('invalidInput:XOR requires a non-empty key.');
    }
    final String inputFormat = (params['inputFormat'] as String?) ?? 'text';
    final String outputFormat = (params['outputFormat'] as String?) ?? 'hex';
    final Uint8List inputBytes = _decodeInput(input.asText(), inputFormat);
    final Uint8List keyBytes = Uint8List.fromList(utf8.encode(key));
    final Uint8List outputBytes = Uint8List(inputBytes.length);
    for (int index = 0; index < inputBytes.length; index++) {
      outputBytes[index] = inputBytes[index] ^ keyBytes[index % keyBytes.length];
    }
    final String rendered = _encodeOutput(outputBytes, outputFormat);
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

  Uint8List _decodeInput(String input, String format) {
    switch (format) {
      case 'text':
        return Uint8List.fromList(utf8.encode(input));
      case 'hex':
        final normalized = input.trim();
        if (normalized.length.isOdd) {
          throw StateError('invalidInput:Hex input must contain an even number of digits.');
        }
        return Uint8List.fromList(
          List<int>.generate(
            normalized.length ~/ 2,
            (int index) => int.parse(normalized.substring(index * 2, index * 2 + 2), radix: 16),
          ),
        );
      case 'base64':
        return Uint8List.fromList(base64Decode(input.trim()));
      default:
        throw StateError('invalidInput:Unsupported XOR input format $format.');
    }
  }

  String _encodeOutput(Uint8List bytes, String format) {
    switch (format) {
      case 'text':
        return utf8.decode(bytes, allowMalformed: true);
      case 'hex':
        return bytes.map((int byte) => byte.toRadixString(16).padLeft(2, '0')).join();
      case 'base64':
        return base64Encode(bytes);
      default:
        throw StateError('invalidInput:Unsupported XOR output format $format.');
    }
  }
}
