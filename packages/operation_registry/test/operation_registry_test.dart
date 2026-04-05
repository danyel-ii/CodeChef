import 'package:operation_registry/operation_registry.dart';
import 'package:pack_core_text/pack_core_text.dart';
import 'package:test/test.dart';

void main() {
  test('registers and resolves core.text operations', () {
    final OperationRegistry registry = OperationRegistry();

    registry.registerPack(const CoreTextPack());

    final result = registry.resolve(
      'core.text.base64.encode',
      versionRange: '^1.0.0',
    );

    expect(result.operation.manifest.title, 'Base64 Encode');
  });

  test('pack loader registers packs', () {
    final registry = PackLoader().load(const <CoreTextPack>[CoreTextPack()]);

    expect(
      registry.operations.map((RegisteredOperation op) => op.operation.manifest.id),
      contains('core.text.url.decode'),
    );
  });
}
