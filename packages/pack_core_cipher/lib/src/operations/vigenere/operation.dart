import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class VigenereOperation implements Operation {
  const VigenereOperation();

  @override
  OperationManifest get manifest => vigenereManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final String key = (params['key'] as String?) ?? '';
    if (key.isEmpty || !_isAlpha(key)) {
      throw StateError('invalidInput:Vigenere requires an alphabetic key.');
    }
    final String mode = (params['mode'] as String?) ?? 'encode';
    final output = _transform(input.asText(), key, decode: mode == 'decode');
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

  String _transform(String input, String key, {required bool decode}) {
    final shifts = key.toUpperCase().codeUnits.map((int unit) => unit - 65).toList(growable: false);
    int keyIndex = 0;
    final StringBuffer buffer = StringBuffer();
    for (final int rune in input.runes) {
      if (rune >= 65 && rune <= 90) {
        final int shift = shifts[keyIndex % shifts.length];
        final int effective = decode ? -shift : shift;
        buffer.writeCharCode(65 + ((rune - 65 + effective + 26) % 26));
        keyIndex++;
      } else if (rune >= 97 && rune <= 122) {
        final int shift = shifts[keyIndex % shifts.length];
        final int effective = decode ? -shift : shift;
        buffer.writeCharCode(97 + ((rune - 97 + effective + 26) % 26));
        keyIndex++;
      } else {
        buffer.writeCharCode(rune);
      }
    }
    return buffer.toString();
  }

  bool _isAlpha(String input) => RegExp(r'^[A-Za-z]+$').hasMatch(input);
}
