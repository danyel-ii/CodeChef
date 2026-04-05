import 'package:execution_protocol/execution_protocol.dart';
import 'package:flutter/material.dart';

class GeneratedParamEditorField extends StatelessWidget {
  const GeneratedParamEditorField({
    required this.field,
    required this.value,
    required this.onChanged,
    this.decorationBuilder,
    super.key,
  });

  final ParamFieldSpec field;
  final Object? value;
  final ValueChanged<Object?> onChanged;
  final InputDecoration Function(InputDecoration decoration)? decorationBuilder;

  @override
  Widget build(BuildContext context) {
    final String helperText = field.example == null
        ? field.description
        : '${field.description} Example: ${field.example}';
    switch (field.type) {
      case ParamType.boolType:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(helperText),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(field.label),
              value: (value as bool?) ?? (field.defaultValue as bool? ?? false),
              onChanged: onChanged,
            ),
          ],
        );
      case ParamType.enumType:
        final List<Object?> values = field.allowedValues ?? const <Object?>[];
        if (field.uiHint == UiHint.segmentedChoice && values.length <= 3) {
          final Object? selected = value ?? field.defaultValue;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(helperText),
              const SizedBox(height: 10),
              SegmentedButton<Object>(
                segments: values
                    .map<ButtonSegment<Object>>(
                      (Object? item) => ButtonSegment<Object>(
                        value: item!,
                        label: Text(item.toString()),
                      ),
                    )
                    .toList(growable: false),
                selected: selected == null ? <Object>{} : <Object>{selected},
                onSelectionChanged: (Set<Object> selection) {
                  onChanged(selection.first);
                },
              ),
            ],
          );
        }
        return DropdownButtonFormField<Object>(
          initialValue: value ?? field.defaultValue,
          decoration: _decoration(
            const InputDecoration(),
            labelText: field.label,
            helperText: helperText,
          ),
          items: values
              .map<DropdownMenuItem<Object>>(
                (Object? item) => DropdownMenuItem<Object>(
                  value: item!,
                  child: Text(item.toString()),
                ),
              )
              .toList(growable: false),
          onChanged: onChanged,
        );
      case ParamType.intType:
      case ParamType.durationMs:
        return TextFormField(
          initialValue: (value ?? field.defaultValue)?.toString() ?? '',
          keyboardType: TextInputType.number,
          decoration: _decoration(
            const InputDecoration(),
            labelText: field.label,
            helperText: helperText,
          ),
          onChanged: (String next) => onChanged(int.tryParse(next)),
        );
      case ParamType.doubleType:
        return TextFormField(
          initialValue: (value ?? field.defaultValue)?.toString() ?? '',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: _decoration(
            const InputDecoration(),
            labelText: field.label,
            helperText: helperText,
          ),
          onChanged: (String next) => onChanged(double.tryParse(next)),
        );
      case ParamType.string:
        return TextFormField(
          initialValue: (value ?? field.defaultValue)?.toString() ?? '',
          obscureText: field.secret,
          decoration: _decoration(
            const InputDecoration(),
            labelText: field.label,
            helperText: helperText,
          ),
          minLines: field.uiHint == UiHint.multiLineText ? 3 : 1,
          maxLines: field.uiHint == UiHint.multiLineText ? 6 : 1,
          onChanged: onChanged,
        );
      case ParamType.stringList:
      case ParamType.bytes:
      case ParamType.json:
        return TextFormField(
          initialValue: (value ?? field.defaultValue)?.toString() ?? '',
          decoration: _decoration(
            const InputDecoration(),
            labelText: field.label,
            helperText: helperText,
          ),
          minLines: 2,
          maxLines: 6,
          onChanged: onChanged,
        );
    }
  }

  InputDecoration _decoration(
    InputDecoration base, {
    required String labelText,
    required String helperText,
  }) {
    final decoration = base.copyWith(
      labelText: labelText,
      helperText: helperText,
    );
    return decorationBuilder == null ? decoration : decorationBuilder!(decoration);
  }
}
