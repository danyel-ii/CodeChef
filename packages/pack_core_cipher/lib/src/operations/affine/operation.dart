import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class AffineOperation implements Operation {
  const AffineOperation();

  @override
  OperationManifest get manifest => affineManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final int a = (params['a'] as int?) ?? 5;
    final int b = (params['b'] as int?) ?? 8;
    final String mode = (params['mode'] as String?) ?? 'encode';
    final int? inverse = _modInverse(a, 26);
    if (inverse == null) {
      throw StateError('invalidParams:Affine multiplier must be coprime with 26.');
    }
    final String output = _transform(input.asText(), a: a, b: b, decode: mode == 'decode');
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

  String _transform(
    String input, {
    required int a,
    required int b,
    required bool decode,
  }) {
    final int inverse = _modInverse(a, 26)!;
    final StringBuffer buffer = StringBuffer();
    for (final int rune in input.runes) {
      if (rune >= 65 && rune <= 90) {
        buffer.writeCharCode(_transformLetter(rune, 65, a, b, inverse, decode));
      } else if (rune >= 97 && rune <= 122) {
        buffer.writeCharCode(_transformLetter(rune, 97, a, b, inverse, decode));
      } else {
        buffer.writeCharCode(rune);
      }
    }
    return buffer.toString();
  }

  int _transformLetter(int rune, int base, int a, int b, int inverse, bool decode) {
    final int value = rune - base;
    final int transformed = decode
        ? (inverse * (value - b + 26)) % 26
        : ((a * value) + b) % 26;
    return base + transformed;
  }

  int? _modInverse(int value, int modulus) {
    for (int candidate = 1; candidate < modulus; candidate++) {
      if ((value * candidate) % modulus == 1) {
        return candidate;
      }
    }
    return null;
  }
}
