import 'package:flutter/material.dart';

class ToolbarPanelBloc extends ChangeNotifier {
  ToolbarPanelBloc([bool? isHidden]) {
    _isHidden = isHidden ?? false;
  }

  bool _isHidden = false;
  bool get isHidden => _isHidden;

  List<Widget> topRightChildren = [];
  List<Widget> topCenterChildren = [];
  List<Widget> topLeftChildren = [];

  List<Widget> bottomRightChildren = [];
  List<Widget> bottomCenterChildren = [];
  List<Widget> bottomLeftChildren = [];

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

  void updateTopRightChildren(List<Widget> children) {
    topRightChildren.clear();
    topRightChildren.addAll(children);
    notifyListeners();
  }

  void updateTopLeftChildren(List<Widget> children) {
    topLeftChildren.clear();
    topLeftChildren.addAll(children);
    notifyListeners();
  }

  void updateTopCenterChildren(List<Widget> children) {
    topCenterChildren.clear();
    topCenterChildren.addAll(children);
    notifyListeners();
  }

  void updateBottomRightChildren(List<Widget> children) {
    bottomRightChildren.clear();
    bottomRightChildren.addAll(children);
    notifyListeners();
  }

  void updateBottomLeftChildren(List<Widget> children) {
    bottomLeftChildren.clear();
    bottomLeftChildren.addAll(children);
    notifyListeners();
  }

  void updateBottomCenterChildren(List<Widget> children) {
    bottomCenterChildren.clear();
    bottomCenterChildren.addAll(children);
    notifyListeners();
  }

  void clearChildren() {
    topRightChildren.clear();
    notifyListeners();
  }
}
