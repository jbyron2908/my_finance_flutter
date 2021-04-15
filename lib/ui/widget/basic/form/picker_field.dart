import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PickerField<T> extends FormField<T> {
  final String label;
  final String Function(T?) buildTitle;
  final Future<T?> Function() onTap;

  @override
  final FormFieldSetter<T>? onSaved;

  @override
  final FormFieldValidator<T>? validator;

  PickerField({
    Key? key,
    T? initialValue,
    this.onSaved,
    this.validator,
    required this.onTap,
    required this.label,
    required this.buildTitle,
  }) : super(
          key: key,
          onSaved: onSaved,
          initialValue: initialValue,
          validator: validator,
          builder: (FormFieldState field) {
            return ChangeNotifierProvider(
              create: (context) => ValueNotifier(false),
              builder: (context, _) {
                var isFocused = context.watch<ValueNotifier<bool>>();
                return GestureDetector(
                  child: InkWell(
                    onHighlightChanged: (highlighted) {
                      isFocused.value = highlighted;
                    },
                    onTap: () async {
                      var value = await onTap();
                      field.didChange(value);
                    },
                    child: InputDecorator(
                      isFocused: isFocused.value,
                      decoration: InputDecoration(
                        labelText: label,
                        border: OutlineInputBorder(),
                        errorText: field.errorText,
                      ),
                      child: Text(
                        buildTitle(field.value),
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
}
