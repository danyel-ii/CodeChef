import 'dart:typed_data';

import 'package:execution_protocol/execution_protocol.dart';

import '../shared/block_cipher_support.dart';
import '../shared/byte_format_codec.dart';
import 'manifest.dart';

class AesOperation implements Operation {
  const AesOperation();

  @override
  OperationManifest get manifest => aesManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final String mode = (params['mode'] as String?) ?? 'encrypt';
    final Uint8List key = decodeByteFormat(
      (params['key'] as String?) ?? '',
      (params['keyFormat'] as String?) ?? 'hex',
      fieldLabel: 'Key',
    );
    final Uint8List iv = decodeByteFormat(
      (params['iv'] as String?) ?? '',
      (params['ivFormat'] as String?) ?? 'hex',
      fieldLabel: 'IV',
    );
    if (!(key.length == 16 || key.length == 24 || key.length == 32)) {
      throw StateError('invalidParams:AES key must decode to 16, 24, or 32 bytes.');
    }
    if (iv.length != 16) {
      throw StateError('invalidParams:AES IV must decode to exactly 16 bytes.');
    }
    final Uint8List inputBytes = decodeByteFormat(
      input.asText(),
      (params['inputFormat'] as String?) ?? 'text',
      fieldLabel: 'Input',
    );
    final Uint8List outputBytes = runCbcCipher(
      algorithm: BlockCipherAlgorithm.aes,
      encrypt: mode == 'encrypt',
      key: key,
      iv: iv,
      input: inputBytes,
    );
    final String rendered = encodeByteFormat(
      outputBytes,
      (params['outputFormat'] as String?) ?? 'base64',
    );
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
