import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> caesarBoxParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'columns',
    label: 'Columns',
    description: 'How many columns the message box should have.',
    type: ParamType.intType,
    required: true,
    defaultValue: 5,
    validation: ValidationRuleSet(<ValidationRule>[
      ValidationRule(kind: ValidationRuleKind.minValue, value: 2),
      ValidationRule(kind: ValidationRuleKind.maxValue, value: 20),
    ]),
    uiHint: UiHint.numericStepper,
    secret: false,
  ),
  ParamFieldSpec(
    id: 'mode',
    label: 'Mode',
    description: 'Encode writes row-by-row and reads column-by-column. Decode reconstructs the box and reads rows back out.',
    type: ParamType.enumType,
    required: true,
    defaultValue: 'encode',
    allowedValues: <Object?>['encode', 'decode'],
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.segmentedChoice,
    secret: false,
  ),
];
