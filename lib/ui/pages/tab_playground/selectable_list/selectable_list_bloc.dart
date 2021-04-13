import 'package:flutter/material.dart';

class SelectableList extends ChangeNotifier {
  var list = List<ListItem>.unmodifiable([]);
  var _count = 0;

  void add() {
    var listItem = ListItem(_count);
    list = [
      ...list,
      listItem,
    ];
    _count++;
    notifyListeners();
  }
}

class ListItem extends ChangeNotifier {
  ListItem(this.index);

  final int index;

  var selected = false;

  void toogle() {
    selected = !selected;
    notifyListeners();
  }
}
