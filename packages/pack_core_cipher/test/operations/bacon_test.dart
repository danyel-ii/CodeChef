import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:test/test.dart';

void main() {
  test('bacon encodes HELLO in modern26 mode', () async {
    final BaconOperation operation = const BaconOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'bacon-encode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 5, data: 'HELLO'),
      const <String, Object?>{
        'mode': 'encode',
        'alphabetVariant': 'modern26',
        'groupOutput': true,
      },
    );

    expect(result.output.data, 'AABBB AABAA ABABB ABABB ABBBA');
  });

  test('bacon decodes modern26 groups', () async {
    final BaconOperation operation = const BaconOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'bacon-decode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: 29,
        data: 'AABBB AABAA ABABB ABABB ABBBA',
      ),
      const <String, Object?>{
        'mode': 'decode',
        'alphabetVariant': 'modern26',
        'groupOutput': true,
      },
    );

    expect(result.output.data, 'HELLO');
  });
}
