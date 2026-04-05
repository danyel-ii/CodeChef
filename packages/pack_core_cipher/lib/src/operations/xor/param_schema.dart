import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> xorParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'key',
    label: 'Key',
    description: 'Repeating XOR key used against the input bytes.',
    type: ParamType.string,
    required: true,
    validation: ValidationRuleSet(<ValidationRule>[
      ValidationRule(kind: ValidationRuleKind.minLength, value: 1),
    ]),
    uiHint: UiHint.secretText,
    secret: true,
    example: 'key',
  ),
  ParamFieldSpec(
    id: 'inputFormat',
    label: 'Input Format',
    description: 'How the incoming text should be interpreted before XOR is applied.',
    type: ParamType.enumType,
    required: true,
    defaultValue: 'text',
    allowedValues: <Object?>['text', 'hex', 'base64'],
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.segmentedChoice,
    secret: false,
  ),
  ParamFieldSpec(
    id: 'outputFormat',
    label: 'Output Format',
    description: 'How the XOR result should be rendered.',
    type: ParamType.enumType,
    required: true,
    defaultValue: 'hex',
    allowedValues: <Object?>['text', 'hex', 'base64'],
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.segmentedChoice,
    secret: false,
  ),
];
