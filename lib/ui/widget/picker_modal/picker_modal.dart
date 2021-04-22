import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/form/text_field.dart';
import 'package:my_finance_flutter_3/ui/widget/keyboard_avoider/keyboard_avoider.dart';

Future<T?> showPickerBottomSheet<T>({
  required BuildContext context,
  required List<T> Function(BuildContext) buildList,
  required Widget Function(BuildContext, T) buildItem,
}) {
  return showMaterialModalBottomSheet<T>(
    context: context,
    useRootNavigator: true,
    builder: (context) {
      return PickerWidget(
        buildList: buildList,
        buildItem: buildItem,
      );
    },
  );
}

class PickerWidget<T> extends StatelessWidget {
  const PickerWidget({
    Key? key,
    required this.buildList,
    required this.buildItem,
  }) : super(key: key);

  final List<T> Function(BuildContext) buildList;
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
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pop(list[index]);
                  },
                  child: buildItem(
                    context,
                    list[index],
                  ),
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
