import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> railFenceParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'rails',
    label: 'Rails',
    description: 'Number of zig-zag rails used to write and read the message.',
    type: ParamType.intType,
    required: true,
    defaultValue: 3,
    validation: ValidationRuleSet(<ValidationRule>[
      ValidationRule(kind: ValidationRuleKind.minValue, value: 2),
      ValidationRule(kind: ValidationRuleKind.maxValue, value: 12),
    ]),
    uiHint: UiHint.numericStepper,
    secret: false,
  ),
  ParamFieldSpec(
    id: 'mode',
    label: 'Mode',
    description: 'Encode writes the zig-zag pattern; decode reconstructs it.',
    type: ParamType.enumType,
    required: true,
    defaultValue: 'encode',
    allowedValues: <Object?>['encode', 'decode'],
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.segmentedChoice,
    secret: false,
  ),
];
