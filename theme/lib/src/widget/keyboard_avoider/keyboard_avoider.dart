import 'package:flutter/material.dart';

class KeyboardAvoider extends StatelessWidget {
  const KeyboardAvoider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var bottom = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
