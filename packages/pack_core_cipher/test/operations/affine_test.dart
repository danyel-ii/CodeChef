import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:test/test.dart';

void main() {
  test('affine encodes with a=5 b=8', () async {
    final AffineOperation operation = const AffineOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'affine-encode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 12, data: 'AFFINECIPHER'),
      const <String, Object?>{'a': 5, 'b': 8, 'mode': 'encode'},
    );

    expect(result.output.data, 'IHHWVCSWFRCP');
  });

  test('affine decodes with a=5 b=8', () async {
    final AffineOperation operation = const AffineOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'affine-decode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 12, data: 'IHHWVCSWFRCP'),
      const <String, Object?>{'a': 5, 'b': 8, 'mode': 'decode'},
    );

    expect(result.output.data, 'AFFINECIPHER');
  });
}
