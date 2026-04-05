import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:test/test.dart';

void main() {
  test('rc4 matches a classic known vector', () async {
    final Rc4Operation operation = const Rc4Operation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'rc4-encrypt',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 9, data: 'Plaintext'),
      const <String, Object?>{
        'key': 'Key',
        'keyFormat': 'text',
        'inputFormat': 'text',
        'outputFormat': 'hex',
      },
    );

    expect(result.output.data, 'bbf316e8d940af0ad3');
  });
}
