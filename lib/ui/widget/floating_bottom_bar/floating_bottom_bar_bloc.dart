import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final floatingPanelBlocProvider = ChangeNotifierProvider(
  (ref) {
    return FloatingBottomBarBloc(false);
  },
);

class FloatingBottomBarBloc extends ChangeNotifier {
  FloatingBottomBarBloc([bool? isHidden]) {
    _isHidden = isHidden ?? false;
  }

  bool _isHidden = false;
  bool get isHidden => _isHidden;
  List<Widget> children = [];

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

  void addChild(Widget child) {
    children.add(child);
    notifyListeners();
  }

  void removeChild(Widget child) {
    children.remove(child);
    notifyListeners();
  }

  void clearChildren() {
    children.clear();
    notifyListeners();
  }
}
