import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> hexEncodeParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'uppercase',
    label: 'Uppercase',
    description: 'Render alphabetic hex digits in uppercase.',
    type: ParamType.boolType,
    required: true,
    defaultValue: false,
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.toggle,
    secret: false,
  ),
];
