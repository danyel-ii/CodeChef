import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:test/test.dart';

void main() {
  test('rot47 rotates printable ASCII', () async {
    final Rot47Operation operation = const Rot47Operation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'rot47',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 6, data: 'Hello!'),
      const <String, Object?>{},
    );

    expect(result.output.data, 'w6==@P');
  });
}
