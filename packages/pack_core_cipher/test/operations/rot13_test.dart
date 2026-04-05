import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:test/test.dart';

void main() {
  test('rot13 rotates alphabetic characters by 13 places', () async {
    final Rot13Operation operation = const Rot13Operation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'rot13',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 11, data: 'Hello World'),
      const <String, Object?>{},
    );

    expect(result.output.data, 'Uryyb Jbeyq');
  });
}
