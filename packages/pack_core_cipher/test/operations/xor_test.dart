import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:test/test.dart';

void main() {
  test('xor encodes text input to hex output', () async {
    final XorOperation operation = const XorOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'xor-encode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 5, data: 'hello'),
      const <String, Object?>{
        'key': 'key',
        'inputFormat': 'text',
        'outputFormat': 'hex',
      },
    );

    expect(result.output.data, '030015070a');
  });

  test('xor decodes hex input back to text', () async {
    final XorOperation operation = const XorOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'xor-decode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 10, data: '030015070a'),
      const <String, Object?>{
        'key': 'key',
        'inputFormat': 'hex',
        'outputFormat': 'text',
      },
    );

    expect(result.output.data, 'hello');
  });
}
