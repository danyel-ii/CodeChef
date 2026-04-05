import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> jsonPrettyParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'indent',
    label: 'Indent',
    description: 'Number of spaces to use for each nesting level.',
    type: ParamType.intType,
    required: true,
    defaultValue: 2,
    validation: ValidationRuleSet(<ValidationRule>[
      ValidationRule(kind: ValidationRuleKind.minValue, value: 0),
      ValidationRule(kind: ValidationRuleKind.maxValue, value: 8),
    ]),
    uiHint: UiHint.numericStepper,
    secret: false,
  ),
  ParamFieldSpec(
    id: 'sortKeys',
    label: 'Sort keys',
    description: 'Sort object keys recursively before rendering.',
    type: ParamType.boolType,
    required: true,
    defaultValue: false,
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.toggle,
    secret: false,
  ),
];
