import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> urlEncodeParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'spaceAsPlus',
    label: 'Encode spaces as plus',
    description: 'Use + for spaces instead of %20.',
    type: ParamType.boolType,
    required: true,
    defaultValue: false,
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.toggle,
    secret: false,
  ),
];
