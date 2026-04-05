import 'package:execution_protocol/execution_protocol.dart';

const List<ParamFieldSpec> linesJoinParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'separator',
    label: 'Separator',
    description: 'String inserted between each input line.',
    type: ParamType.string,
    required: true,
    defaultValue: ', ',
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.singleLineText,
    secret: false,
  ),
];
