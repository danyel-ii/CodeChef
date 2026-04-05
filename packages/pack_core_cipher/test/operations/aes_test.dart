import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:test/test.dart';

void main() {
  test('aes round-trips a CBC payload', () async {
    final AesOperation operation = const AesOperation();
    const Map<String, Object?> encryptParams = <String, Object?>{
      'mode': 'encrypt',
      'key': '00112233445566778899aabbccddeeff',
      'keyFormat': 'hex',
      'iv': '0102030405060708090a0b0c0d0e0f10',
      'ivFormat': 'hex',
      'inputFormat': 'text',
      'outputFormat': 'base64',
    };

    final StepExecutionResult encrypted = await operation.run(
      OperationContext(
        requestId: 'aes-encrypt',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 14, data: 'Attack at dawn'),
      encryptParams,
    );

    final StepExecutionResult decrypted = await operation.run(
      OperationContext(
        requestId: 'aes-decrypt',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: (encrypted.output.data as String).length,
        data: encrypted.output.data as String,
      ),
      const <String, Object?>{
        'mode': 'decrypt',
        'key': '00112233445566778899aabbccddeeff',
        'keyFormat': 'hex',
        'iv': '0102030405060708090a0b0c0d0e0f10',
        'ivFormat': 'hex',
        'inputFormat': 'base64',
        'outputFormat': 'text',
      },
    );

    expect(encrypted.output.data, isNot('Attack at dawn'));
    expect(decrypted.output.data, 'Attack at dawn');
  });
}
