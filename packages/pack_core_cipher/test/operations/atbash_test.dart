import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:test/test.dart';

void main() {
  test('atbash mirrors alphabetic characters', () async {
    final AtbashOperation operation = const AtbashOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'atbash',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 13, data: 'Hello, World!'),
      const <String, Object?>{},
    );

    expect(result.output.data, 'Svool, Dliow!');
  });
}
