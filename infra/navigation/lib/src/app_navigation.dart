import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:navigation/src/widget/picker_modal/multi_picker_modal.dart';
import 'package:navigation/src/widget/picker_modal/picker_modal.dart';

class AppNavigation {
  static Future<dynamic> pushTo(
    StackRouter router, {
    required PageRouteInfo<dynamic> route,
  }) {
    return router.push(route);
  }

  static Future<dynamic> pushToNamed(
    StackRouter router, {
    required String path,
  }) {
    return router.pushNamed(path);
  }

  static Future<dynamic> replaceTo(
    StackRouter router, {
    required PageRouteInfo<dynamic> route,
  }) {
    return router.replace(route);
  }

  static Future<bool> pop(
    StackRouter router, {
    Object? result,
  }) {
    return router.pop(result);
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
