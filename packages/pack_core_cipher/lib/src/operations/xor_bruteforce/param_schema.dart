import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> xorBruteForceParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'inputFormat',
    label: 'Input Format',
    description: 'How the incoming cipher text should be interpreted before brute force begins.',
    type: ParamType.enumType,
    required: true,
    defaultValue: 'hex',
    allowedValues: <Object?>['text', 'hex', 'base64'],
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.segmentedChoice,
    secret: false,
  ),
  ParamFieldSpec(
    id: 'candidateCount',
    label: 'Candidates',
    description: 'How many of the top-scoring single-byte key guesses to show.',
    type: ParamType.intType,
    required: true,
    defaultValue: 5,
    validation: ValidationRuleSet(<ValidationRule>[
      ValidationRule(kind: ValidationRuleKind.minValue, value: 1),
      ValidationRule(kind: ValidationRuleKind.maxValue, value: 20),
    ]),
    uiHint: UiHint.numericStepper,
    secret: false,
  ),
  ParamFieldSpec(
    id: 'keyStart',
    label: 'Key Start',
    description: 'Start of the single-byte key range to test.',
    type: ParamType.intType,
    required: true,
    defaultValue: 0,
    validation: ValidationRuleSet(<ValidationRule>[
      ValidationRule(kind: ValidationRuleKind.minValue, value: 0),
      ValidationRule(kind: ValidationRuleKind.maxValue, value: 255),
    ]),
    uiHint: UiHint.numericStepper,
    secret: false,
  ),
  ParamFieldSpec(
    id: 'keyEnd',
    label: 'Key End',
    description: 'End of the single-byte key range to test.',
    type: ParamType.intType,
    required: true,
    defaultValue: 255,
    validation: ValidationRuleSet(<ValidationRule>[
      ValidationRule(kind: ValidationRuleKind.minValue, value: 0),
      ValidationRule(kind: ValidationRuleKind.maxValue, value: 255),
    ]),
    uiHint: UiHint.numericStepper,
    secret: false,
  ),
];
