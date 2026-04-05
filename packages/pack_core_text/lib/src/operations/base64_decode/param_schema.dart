import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> base64DecodeParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'treatOutputAs',
    label: 'Treat output as',
    description:
        'Choose whether decoded bytes should be shown as text or kept as bytes.',
    type: ParamType.enumType,
    required: true,
    defaultValue: 'text',
    allowedValues: <Object>['text', 'bytes'],
    example: 'text',
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.segmentedChoice,
    secret: false,
  ),
];
