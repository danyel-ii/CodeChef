import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:test/test.dart';

void main() {
  test('vigenere encodes using a repeating alphabetic key', () async {
    final VigenereOperation operation = const VigenereOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'vigenere-encode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 12, data: 'ATTACKATDAWN'),
      const <String, Object?>{'key': 'LEMON', 'mode': 'encode'},
    );

    expect(result.output.data, 'LXFOPVEFRNHR');
  });

  test('vigenere decodes using the same repeating key', () async {
    final VigenereOperation operation = const VigenereOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'vigenere-decode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 12, data: 'LXFOPVEFRNHR'),
      const <String, Object?>{'key': 'LEMON', 'mode': 'decode'},
    );

    expect(result.output.data, 'ATTACKATDAWN');
  });
}
