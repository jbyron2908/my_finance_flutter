import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final floatingPanelBlocProvider = ChangeNotifierProvider(
  (ref) {
    return FloatingPanelBloc(false);
  },
);

class FloatingPanelBloc extends ChangeNotifier {
  FloatingPanelBloc([bool? isHidden]) {
    _isHidden = isHidden ?? false;
  }

  bool _isHidden = false;
  bool get isHidden => _isHidden;

  void hide() {
    _isHidden = true;
    notifyListeners();
  }

  void show() {
    _isHidden = false;
    notifyListeners();
  }

  void toggle() {
    _isHidden = !_isHidden;
    notifyListeners();
  }
}
