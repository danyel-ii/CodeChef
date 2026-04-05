import 'package:execution_protocol/execution_protocol.dart';
import 'package:test/test.dart';

void main() {
  test('validates required and enum values', () {
    const List<ParamFieldSpec> specs = <ParamFieldSpec>[
      ParamFieldSpec(
        id: 'mode',
        label: 'Mode',
        description: 'Output mode',
        type: ParamType.enumType,
        required: true,
        defaultValue: 'text',
        allowedValues: <Object>['text', 'bytes'],
        validation: ValidationRuleSet.none(),
        uiHint: UiHint.segmentedChoice,
        secret: false,
      ),
    ];

    final List<ParamValidationIssue> missing = ParamSchemaValidator.validate(
      specs,
      <String, Object?>{'mode': 'invalid'},
    );

    expect(missing, hasLength(1));
    expect(missing.first.paramId, 'mode');
  });
}
