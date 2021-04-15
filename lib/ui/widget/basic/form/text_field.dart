import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.validator,
    this.onSaved,
    this.label,
    this.initialValue,
  }) : super(key: key);

  final String? label;
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      initialValue: initialValue,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
