import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_text/pack_core_text.dart';
import 'package:test/test.dart';

void main() {
  test('url decode decodes encoded text', () async {
    final UrlDecodeOperation operation = const UrlDecodeOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'url-decode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: 13,
        data: 'hello%20world',
      ),
      const <String, Object?>{'plusAsSpace': true},
    );

    expect(result.output.data, 'hello world');
  });
}
