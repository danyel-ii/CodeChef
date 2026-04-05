import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:test/test.dart';

void main() {
  test('rail fence encodes using three rails', () async {
    final RailFenceOperation operation = const RailFenceOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'rail-fence-encode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: 25,
        data: 'WEAREDISCOVEREDFLEEATONCE',
      ),
      const <String, Object?>{'rails': 3, 'mode': 'encode'},
    );

    expect(result.output.data, 'WECRLTEERDSOEEFEAOCAIVDEN');
  });

  test('rail fence decodes using three rails', () async {
    final RailFenceOperation operation = const RailFenceOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'rail-fence-decode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: 25,
        data: 'WECRLTEERDSOEEFEAOCAIVDEN',
      ),
      const <String, Object?>{'rails': 3, 'mode': 'decode'},
    );

    expect(result.output.data, 'WEAREDISCOVEREDFLEEATONCE');
  });
}
