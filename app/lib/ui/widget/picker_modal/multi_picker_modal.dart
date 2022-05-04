import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/form/text_field.dart';
import 'package:my_finance_flutter_3/ui/widget/keyboard_avoider/keyboard_avoider.dart';
import 'package:provider/provider.dart';

Future<List<T>?> showMultiPickerBottomSheet<T>({
  required BuildContext context,
  required List<PickerItem<T>> Function(BuildContext) buildList,
  required Widget Function(BuildContext, T) buildItem,
}) {
  return showMaterialModalBottomSheet<List<T>>(
    context: context,
    useRootNavigator: true,
    builder: (context) {
      return MultiPickerWidget(
        buildList: buildList,
        buildItem: buildItem,
      );
    },
  );
}

class PickerItem<T> with ChangeNotifier {
  final T item;
  final int groupLevel;
  final List<PickerItem<T>>? children;

  PickerItem<T>? parent;
  bool? selected;

  void change(bool value) {
    changeChildren(value);
    if (selected == null) {
      selected = true;
    } else {
      selected = value;
    }

    notifyListeners();
    parent?.checkChildren();
  }

  void changeSilently(bool value) {
    selected = value;
  }

  void changeChildren(bool value) {
    for (var element in children ?? []) {
      if (selected == null) {
        element.changeSilently(true);
        for (var element in element.children ?? []) {
          element.changeSilently(true);
        }
      } else {
        element.changeSilently(value);
        for (var element in element.children ?? []) {
          element.changeSilently(value);
        }
      }
    }
  }

  void checkChildren() {
    var allChildrenSelected = children?.every(
      (element) => element.selected ?? false,
    );

    if (allChildrenSelected == true) {
      selected = true;
      notifyListeners();
      return;
    }

    var anyChildrenSelected = children?.any(
      (element) => element.selected ?? false,
    );

    if (anyChildrenSelected == true) {
      selected = null;
      notifyListeners();
    } else {
      selected = false;
      notifyListeners();
    }
  }

  PickerItem({
    required this.item,
    this.groupLevel = 0,
    this.parent,
    this.children,
    this.selected = false,
  }) {
    for (var element in children ?? []) {
      element.parent = this;
    }
  }
}

class MultiPickerWidget<T> extends StatelessWidget {
  const MultiPickerWidget({
    Key? key,
    required this.buildList,
    required this.buildItem,
  }) : super(key: key);

  final List<PickerItem<T>> Function(BuildContext) buildList;
  final Widget Function(BuildContext, T) buildItem;

  @override
  Widget build(BuildContext context) {
    var list = buildList(context);

    return KeyboardAvoider(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return MultiPickerItemWidget(
                  pickerItem: list[index],
                  buildItem: buildItem,
                );
              },
            ),
          ),
          AppTextField(
            label: 'Search',
          ),
        ],
      ),
    );
  }
}

class MultiPickerItemWidget<T> extends StatelessWidget {
  const MultiPickerItemWidget({
    Key? key,
    required this.pickerItem,
    required this.buildItem,
    this.groupLevel = 0,
  }) : super(key: key);

  final int groupLevel;
  final PickerItem<T> pickerItem;
  final Widget Function(BuildContext, T) buildItem;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: pickerItem,
      builder: (context, _) {
        var pickerItem = context.watch<PickerItem<T>>();
        var children = pickerItem.children ?? [];

        return Padding(
          padding: EdgeInsets.only(left: (16.0 * groupLevel)),
          child: Column(
            children: [
              CheckboxListTile(
                selected: pickerItem.selected ?? false,
                value: pickerItem.selected,
                tristate: true,
                onChanged: (value) {
                  pickerItem.change(value ?? false);
                },
                title: buildItem(context, pickerItem.item),
              ),
              if (children.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pickerItem.children!.length,
                  itemBuilder: (context, index) {
                    return MultiPickerItemWidget<T>(
                      pickerItem: children[index],
                      buildItem: buildItem,
                      groupLevel: groupLevel + 1,
                    );
                  },
                )
            ],
          ),
        );
      },
    );
  }
}
