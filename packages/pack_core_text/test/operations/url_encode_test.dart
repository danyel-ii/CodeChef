import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_text/pack_core_text.dart';
import 'package:test/test.dart';

void main() {
  test('url encode percent encodes spaces', () async {
    final UrlEncodeOperation operation = const UrlEncodeOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'url-encode',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: 11,
        data: 'hello world',
      ),
      const <String, Object?>{'spaceAsPlus': false},
    );

    expect(result.output.data, 'hello%20world');
  });
}
