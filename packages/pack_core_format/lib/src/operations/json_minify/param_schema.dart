import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> jsonMinifyParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'sortKeys',
    label: 'Sort keys',
    description: 'Sort object keys recursively before minifying.',
    type: ParamType.boolType,
    required: true,
    defaultValue: false,
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.toggle,
    secret: false,
  ),
];
