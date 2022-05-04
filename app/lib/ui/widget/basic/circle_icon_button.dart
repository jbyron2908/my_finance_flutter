import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    this.circleColor = Colors.blue,
    this.elevation = 6,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.all(16),
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final void Function() onPressed;
  final Color circleColor;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 0,
        color: circleColor,
        elevation: elevation,
        padding: padding,
        shape: const CircleBorder(),
        child: child,
      ),
    );
  }
}
