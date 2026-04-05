import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> hexDecodeParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'treatOutputAs',
    label: 'Treat output as',
    description: 'Choose whether decoded bytes should be shown as text or bytes.',
    type: ParamType.enumType,
    required: true,
    defaultValue: 'text',
    allowedValues: <Object>['text', 'bytes'],
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.segmentedChoice,
    secret: false,
  ),
];
