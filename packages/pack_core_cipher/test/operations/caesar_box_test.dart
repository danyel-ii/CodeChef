import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:test/test.dart';

void main() {
  test('caesar box encodes with five columns', () async {
    final CaesarBoxOperation operation = const CaesarBoxOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'caesar-box-encode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: 25,
        data: 'WEAREDISCOVEREDFLEEATONCE',
      ),
      const <String, Object?>{'columns': 5, 'mode': 'encode'},
    );

    expect(result.output.data, 'WDVFTEIELOASRENRCEECEODAE');
  });

  test('caesar box decodes with five columns', () async {
    final CaesarBoxOperation operation = const CaesarBoxOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'caesar-box-decode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: 25,
        data: 'WDVFTEIELOASRENRCEECEODAE',
      ),
      const <String, Object?>{'columns': 5, 'mode': 'decode'},
    );

    expect(result.output.data, 'WEAREDISCOVEREDFLEEATONCE');
  });
}
