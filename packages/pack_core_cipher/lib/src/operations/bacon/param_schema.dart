import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> baconParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'mode',
    label: 'Mode',
    description: 'Encode maps letters to five-symbol A/B groups; decode reverses those groups.',
    type: ParamType.enumType,
    required: true,
    defaultValue: 'encode',
    allowedValues: <Object?>['encode', 'decode'],
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.segmentedChoice,
    secret: false,
  ),
  ParamFieldSpec(
    id: 'alphabetVariant',
    label: 'Alphabet Variant',
    description: 'Modern26 keeps A-Z distinct. Classical24 merges I/J and U/V like early Baconian ciphers.',
    type: ParamType.enumType,
    required: true,
    defaultValue: 'modern26',
    allowedValues: <Object?>['modern26', 'classical24'],
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.dropdown,
    secret: false,
  ),
  ParamFieldSpec(
    id: 'groupOutput',
    label: 'Group Output',
    description: 'When enabled, encoded groups are separated by spaces for easier reading.',
    type: ParamType.boolType,
    required: true,
    defaultValue: true,
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.toggle,
    secret: false,
  ),
];
