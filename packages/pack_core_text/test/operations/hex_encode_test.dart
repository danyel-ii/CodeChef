import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_text/pack_core_text.dart';
import 'package:test/test.dart';

void main() {
  test('hex encode encodes text', () async {
    final HexEncodeOperation operation = const HexEncodeOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'hex-encode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 5, data: 'Hello'),
      const <String, Object?>{'uppercase': false},
    );

    expect(result.output.data, '48656c6c6f');
  });
}
