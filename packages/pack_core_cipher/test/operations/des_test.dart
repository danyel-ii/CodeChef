import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:test/test.dart';

void main() {
  test('des round-trips a CBC payload', () async {
    final DesOperation operation = const DesOperation();
    const Map<String, Object?> encryptParams = <String, Object?>{
      'mode': 'encrypt',
      'key': 'Secr3tK!',
      'inputFormat': 'text',
      'outputFormat': 'base64',
    };

    final StepExecutionResult encrypted = await operation.run(
      OperationContext(
        requestId: 'des-encrypt',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 11, data: 'Open sesame'),
      encryptParams,
    );

    final StepExecutionResult decrypted = await operation.run(
      OperationContext(
        requestId: 'des-decrypt',
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
        'key': 'Secr3tK!',
        'inputFormat': 'base64',
        'outputFormat': 'text',
      },
    );

    expect(encrypted.output.data, isNot('Open sesame'));
    expect(decrypted.output.data, 'Open sesame');
  });
}
