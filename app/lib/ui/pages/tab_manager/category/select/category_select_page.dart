import 'package:database_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme/widget.dart';

Future<CategoryModel?> showCategorySelector(BuildContext context) {
  return showPickerBottomSheet(
    context: context,
    buildList: (context) {
      var categoryList = context
          .read<List<CategoryModel>>()
          .where((element) => element.parent == null)
          .toList();
      return categoryList;
    },
    buildItem: (context, item) {
      return ListTile(
        title: Text(item.name),
      );
    },
  );
}

Future<List<int>?> showCategoryMultiSelector(BuildContext context) {
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
