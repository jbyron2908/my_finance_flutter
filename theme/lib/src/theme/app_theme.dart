import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme/src/theme/toolbar/toolbar_theme.dart';

class AppThemeProvider with ChangeNotifier {
  AppTheme appTheme = AppTheme.light();

  void update(AppTheme newTheme) {
    appTheme = newTheme;
    notifyListeners();
  }
}

class AppTheme {
  static AppTheme of(BuildContext context) {
    return context.watch<AppThemeProvider>().appTheme;
  }

  AppTheme.light() : toolbarTheme = ToolbarTheme.light();

  final ToolbarTheme toolbarTheme;
}
