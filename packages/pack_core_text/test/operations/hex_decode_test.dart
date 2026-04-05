import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_text/pack_core_text.dart';
import 'package:test/test.dart';

void main() {
  test('hex decode decodes text', () async {
    final HexDecodeOperation operation = const HexDecodeOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'hex-decode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: 10,
        data: '48656c6c6f',
      ),
      const <String, Object?>{'treatOutputAs': 'text'},
    );

    expect(result.output.data, 'Hello');
  });

  test('hex decode rejects odd-length input', () async {
    final HexDecodeOperation operation = const HexDecodeOperation();

    expect(
      () => operation.run(
        OperationContext(
          requestId: 'hex-invalid',
          previewMode: false,
          cancellationToken: CancellationController().token,
        ),
        const PayloadEnvelope(
          kind: PayloadKind.text,
          sizeBytes: 3,
          data: 'abc',
        ),
        const <String, Object?>{'treatOutputAs': 'text'},
      ),
      throwsA(isA<StateError>()),
    );
  });
}
