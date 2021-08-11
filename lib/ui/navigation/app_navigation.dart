import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_finance_flutter_3/ui/widget/picker_modal/multi_picker_modal.dart';
import 'package:my_finance_flutter_3/ui/widget/picker_modal/picker_modal.dart';

class AppNavigation {
  static Future<void> pushTo(
    BuildContext context, {
    required PageRouteInfo<dynamic> route,
  }) {
    return context.router.push(route);
  }

  static Future<void> replaceTo(
    BuildContext context, {
    required PageRouteInfo<dynamic> route,
  }) {
    return context.router.replace(route);
  }

  static Future<bool> pop(
    BuildContext context, {
    Object? result,
  }) {
    return context.router.pop(result);
  }

  static Future<T?> showPickerBottomSheet<T>({
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
}

class RoutePaths {
  static const root = "/";

  static const main = "/main";

  static const debug = "/debug";

  static const management = "/management";
  static const profile = "/profile";
  static const profileForm = "/profileform";
  static const category = "/category";
  static const categoryForm = "/categoryform";
  static const payee = "/payee";
  static const payeeForm = "/payeeform";

  static const playground = "/playground";
  static const counter = "/counter";
  static const selectableList = "/selectable_list";
  static const changeNotifier = "/change_notifier";
}
