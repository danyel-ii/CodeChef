import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_text/pack_core_text.dart';
import 'package:test/test.dart';

void main() {
  test('base64 decode decodes text output', () async {
    final Base64DecodeOperation operation = const Base64DecodeOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'decode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: 8,
        data: 'SGVsbG8=',
      ),
      const <String, Object?>{'treatOutputAs': 'text'},
    );

    expect(result.output.data, 'Hello');
  });

  test('base64 decode rejects invalid input', () async {
    final Base64DecodeOperation operation = const Base64DecodeOperation();

    expect(
      () => operation.run(
        OperationContext(
          requestId: 'decode-invalid',
          previewMode: false,
          cancellationToken: CancellationController().token,
        ),
        const PayloadEnvelope(
          kind: PayloadKind.text,
          sizeBytes: 3,
          data: '%%% ',
        ),
        const <String, Object?>{'treatOutputAs': 'text'},
      ),
      throwsA(isA<StateError>()),
    );
  });
}
