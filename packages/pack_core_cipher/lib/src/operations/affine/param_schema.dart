import 'package:execution_protocol/execution_protocol.dart';

const List<Object?> affineMultipliers = <Object?>[1, 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25];

const List<ParamFieldSpec> affineParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'a',
    label: 'Multiplier (a)',
    description: 'The multiplicative key. It must be coprime with 26 so the cipher can be reversed.',
    type: ParamType.enumType,
    required: true,
    defaultValue: 5,
    allowedValues: affineMultipliers,
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.dropdown,
    secret: false,
  ),
  ParamFieldSpec(
    id: 'b',
    label: 'Shift (b)',
    description: 'The additive key applied after multiplication.',
    type: ParamType.intType,
    required: true,
    defaultValue: 8,
    validation: ValidationRuleSet(<ValidationRule>[
      ValidationRule(kind: ValidationRuleKind.minValue, value: 0),
      ValidationRule(kind: ValidationRuleKind.maxValue, value: 25),
    ]),
    uiHint: UiHint.numericStepper,
    secret: false,
  ),
  ParamFieldSpec(
    id: 'mode',
    label: 'Mode',
    description: 'Encode applies a*x+b; decode uses the modular inverse of a.',
    type: ParamType.enumType,
    required: true,
    defaultValue: 'encode',
    allowedValues: <Object?>['encode', 'decode'],
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.segmentedChoice,
    secret: false,
  ),
];
