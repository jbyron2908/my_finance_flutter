import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    this.validator,
    this.onSaved,
    this.label,
    this.initialValue,
    TextEditingController? controller,
  })  : _controller = controller ?? TextEditingController(text: initialValue),
        super(key: key);

  final String? label;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController _controller;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      controller: _controller,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
