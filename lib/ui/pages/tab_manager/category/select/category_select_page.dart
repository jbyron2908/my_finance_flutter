import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/core/domain/model/category/category_model.dart';
import 'package:my_finance_flutter_3/ui/widget/picker_modal/multi_picker_modal.dart';
import 'package:my_finance_flutter_3/ui/widget/picker_modal/picker_modal.dart';
import 'package:provider/provider.dart';

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
