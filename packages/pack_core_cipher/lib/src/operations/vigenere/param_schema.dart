import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> vigenereParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'key',
    label: 'Key',
    description: 'Alphabetic keyword used to derive the repeating shifts.',
    type: ParamType.string,
    required: true,
    validation: ValidationRuleSet(<ValidationRule>[
      ValidationRule(kind: ValidationRuleKind.minLength, value: 1),
      ValidationRule(
        kind: ValidationRuleKind.pattern,
        value: r'^[A-Za-z]+$',
        message: 'Vigenere keys must contain letters only.',
      ),
    ]),
    uiHint: UiHint.singleLineText,
    secret: false,
    example: 'LEMON',
  ),
  ParamFieldSpec(
    id: 'mode',
    label: 'Mode',
    description: 'Whether to encode or decode with the supplied key.',
    type: ParamType.enumType,
    required: true,
    defaultValue: 'encode',
    allowedValues: <Object?>['encode', 'decode'],
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.segmentedChoice,
    secret: false,
  ),
];
