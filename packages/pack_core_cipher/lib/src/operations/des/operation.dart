import 'dart:convert';

import 'package:dart_3des/dart_3des.dart';
import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class DesOperation implements Operation {
  const DesOperation();

  @override
  OperationManifest get manifest => desManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final String mode = (params['mode'] as String?) ?? 'encrypt';
    final String key = (params['key'] as String?) ?? '';
    if (key.length != 8) {
      throw StateError('invalidParams:DES key must be exactly 8 characters.');
    }
    final String inputFormat = (params['inputFormat'] as String?) ?? 'text';
    final String outputFormat = (params['outputFormat'] as String?) ?? 'base64';
    final BlockCipher cipher = BlockCipher(DESEngine(), key);
    final String source = input.asText();
    final String output = mode == 'decrypt'
        ? _decrypt(cipher, source, inputFormat, outputFormat)
        : _encrypt(cipher, source, outputFormat);
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

  String _encrypt(BlockCipher cipher, String input, String outputFormat) {
    final String encrypted = cipher.encode(input);
    return outputFormat == 'text'
        ? encrypted
        : base64Encode(latin1.encode(encrypted));
  }

  String _decrypt(
    BlockCipher cipher,
    String input,
    String inputFormat,
    String outputFormat,
  ) {
    final String decrypted = switch (inputFormat) {
      'base64' => cipher.decodeB64(input.trim()),
      'text' => cipher.decode(input),
      _ => throw StateError('invalidInput:Unsupported DES input format $inputFormat.'),
    };
    return outputFormat == 'base64'
        ? base64Encode(latin1.encode(decrypted))
        : decrypted;
  }
}
