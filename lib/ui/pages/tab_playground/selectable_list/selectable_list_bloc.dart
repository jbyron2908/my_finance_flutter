import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final listProvider = ChangeNotifierProvider.autoDispose(
  (ref) {
    return SelectableList();
  },
);

final itemProvider = ChangeNotifierProvider.autoDispose.family<ListItem, int>(
  (ref, index) {
    var list = ref.read(listProvider).list;
    return list[index];
  },
);

class SelectableList extends ChangeNotifier {
  final list = <ListItem>[];
  var _count = 0;

  void add() {
    var listItem = ListItem(_count);
    list.add(listItem);
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
