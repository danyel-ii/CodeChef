import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> urlDecodeParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'plusAsSpace',
    label: 'Treat plus as space',
    description: 'Interpret + as a space before URL decoding.',
    type: ParamType.boolType,
    required: true,
    defaultValue: true,
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.toggle,
    secret: false,
  ),
];
