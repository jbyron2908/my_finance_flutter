import 'package:flutter/material.dart';
import 'package:theme/widget.dart';

Future<int?> showProfileSelector(BuildContext context) {
  return showPickerBottomSheet(
    context: context,
    buildList: (context) {
      return List.generate(25, (index) => index);
    },
    buildItem: (context, item) {
      return ListTile(
        title: Text('Item $item'),
      );
    },
  );
}

Future<List<int>?> showProfileMultiSelector(BuildContext context) {
  return showMultiPickerBottomSheet(
    context: context,
    buildList: (context) {
      var list = List.generate(
        5,
        (index) {
          return PickerItem(
            item: index,
            children: List.generate(
              5,
              (index) => PickerItem(
                item: index,
              ),
            ),
          );
        },
      );

      return list;
    },
    buildItem: (context, item) {
      return Text('Item $item');
    },
  );
}
