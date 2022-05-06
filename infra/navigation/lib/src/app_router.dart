import 'package:flutter/material.dart';
import 'package:navigation/src/app_navigation.dart';

class AppRouter {
  AppRouter._();

  static Future<bool> navigateBack(BuildContext context, {Object? result}) {
    return AppNavigation.pop(context, result: result);
  }

  static Future<void> replaceToMain(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.main,
    );
  }

  static Future<void> navigateToDebug(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.debug,
    );
  }

  static Future<void> navigateToManagement(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.manager,
    );
  }

  static Future<void> navigateToProfile(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.profileList,
    );
  }

  static Future<void> navigateToProfileForm(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.profileForm,
    );
  }

  static Future<void> navigateToCategory(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.categoryList,
    );
  }

  static Future<void> navigateToCategoryForm(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.categoryForm,
    );
  }

  static Future<void> navigateToPayee(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.payeeList,
    );
  }

  static Future<void> navigateToPayeeForm(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.payeeForm,
    );
  }

  static Future<void> navigateToPlayground(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.playground,
    );
  }

  static Future<void> navigateToCounterChangeNotifier(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.counterChangeNotifier,
    );
  }

  static Future<void> navigateToCounterStateNotifier(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.counterStateNotifier,
    );
  }

  static Future<void> navigateToCounterRx(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.counterRx,
    );
  }

  static Future<void> navigateToSelectableList(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.selectableList,
    );
  }

  static Future<void> navigateToChangeNotifier(BuildContext context) {
    return AppNavigation.pushToNamed(
      context,
      path: _RoutePaths.changeNotifier,
    );
  }
}

class Routes {
  static const root = "/";

  static const main = "main";

  static const debug = "debug";

  static const manager = "manager";
  static const profileList = "profile/list";
  static const profileForm = "profile/form";
  static const categoryList = "category/list";
  static const categoryForm = "category/form";
  static const payeeList = "payee/list";
  static const payeeForm = "payee/form";

  static const playground = "playground";
  static const counterChangeNotifier = "counter_change_notifier";
  static const counterStateNotifier = "counter_state_notifier";
  static const counterRx = "rx_counter";
  static const selectableList = "selectable_list";
  static const changeNotifier = "change_notifier";
}

class _RoutePaths {
  static const root = "/";

  static const main = "/${Routes.main}";

  static const debug = "$main/${Routes.debug}";

  static const manager = "$main/${Routes.manager}";
  static const profileList = "$manager/${Routes.profileList}";
  static const profileForm = "$manager/${Routes.profileForm}";
  static const categoryList = "$manager/${Routes.categoryList}";
  static const categoryForm = "$manager/${Routes.categoryForm}";
  static const payeeList = "$manager/${Routes.payeeList}";
  static const payeeForm = "$manager/${Routes.payeeForm}";

  static const playground = "$main/${Routes.playground}";
  static const counterChangeNotifier =
      "$playground/${Routes.counterChangeNotifier}";
  static const counterStateNotifier =
      "$playground/${Routes.counterStateNotifier}";
  static const counterRx = "$playground/${Routes.counterRx}";
  static const selectableList = "$playground/${Routes.selectableList}";
  static const changeNotifier = "$playground/${Routes.changeNotifier}";
}
