import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/theme/app_theme.dart';

class ToolbarTheme {
  static ToolbarTheme of(BuildContext context) {
    return AppTheme.of(context).toolbarTheme;
  }

  ToolbarTheme.light()
      : backgroundColor = Colors.blue,
        topBarHeight = 48,
        bottomBarHeight = 48,
        animationDuration = const Duration(milliseconds: 200);

  final Color backgroundColor;
  final double topBarHeight;
  final double bottomBarHeight;
  final Duration animationDuration;
}
