import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> base64EncodeParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'lineBreakInterval',
    label: 'Line break interval',
    description: 'Insert a line break every N characters. Use 0 for none.',
    type: ParamType.intType,
    required: true,
    defaultValue: 0,
    validation: ValidationRuleSet(<ValidationRule>[
      ValidationRule(kind: ValidationRuleKind.minValue, value: 0),
    ]),
    uiHint: UiHint.numericStepper,
    secret: false,
  ),
];
