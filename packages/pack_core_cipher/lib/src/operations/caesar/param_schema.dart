import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> caesarParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'shift',
    label: 'Shift',
    description: 'How many alphabet positions to rotate by.',
    type: ParamType.intType,
    required: true,
    defaultValue: 3,
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.numericStepper,
    secret: false,
  ),
  ParamFieldSpec(
    id: 'mode',
    label: 'Mode',
    description: 'Whether to encode forward or decode backward.',
    type: ParamType.enumType,
    required: true,
    defaultValue: 'encode',
    allowedValues: <Object?>['encode', 'decode'],
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.segmentedChoice,
    secret: false,
  ),
];
