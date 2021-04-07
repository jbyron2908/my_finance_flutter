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
  List<Widget> rightChildren = [];
  List<Widget> centerChildren = [];
  List<Widget> leftChildren = [];

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

  void updateRightChildren(List<Widget> children) {
    rightChildren.clear();
    rightChildren.addAll(children);
    notifyListeners();
  }

  void updateLeftChildren(List<Widget> children) {
    leftChildren.clear();
    leftChildren.addAll(children);
    notifyListeners();
  }

  void updateCenterChildren(List<Widget> children) {
    centerChildren.clear();
    centerChildren.addAll(children);
    notifyListeners();
  }

  void clearChildren() {
    rightChildren.clear();
    notifyListeners();
  }
}
