import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:test/test.dart';

void main() {
  test('caesar encodes with a positive shift', () async {
    final CaesarOperation operation = const CaesarOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'caesar-encode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 14, data: 'Attack at dawn'),
      const <String, Object?>{'shift': 3, 'mode': 'encode'},
    );

    expect(result.output.data, 'Dwwdfn dw gdzq');
  });

  test('caesar decodes with the same shift', () async {
    final CaesarOperation operation = const CaesarOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'caesar-decode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 14, data: 'Dwwdfn dw gdzq'),
      const <String, Object?>{'shift': 3, 'mode': 'decode'},
    );

    expect(result.output.data, 'Attack at dawn');
  });
}
