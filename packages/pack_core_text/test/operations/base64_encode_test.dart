import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_text/pack_core_text.dart';
import 'package:test/test.dart';

void main() {
  test('base64 encode encodes text', () async {
    final Base64EncodeOperation operation = const Base64EncodeOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'encode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 5, data: 'Hello'),
      const <String, Object?>{'lineBreakInterval': 0},
    );

    expect(result.output.data, 'SGVsbG8=');
  });
}
