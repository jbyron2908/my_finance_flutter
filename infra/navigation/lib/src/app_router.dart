import 'package:auto_route/auto_route.dart';
import 'package:navigation/src/app_navigation.dart';

class AppRouter {
  AppRouter._();

  static Future<bool> navigateBack(StackRouter router, {Object? result}) {
    return AppNavigation.pop(router, result: result);
  }

  static Future<void> replaceToMain(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
      path: _RoutePaths.main,
    );
  }

  static Future<void> navigateToDebug(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
      path: _RoutePaths.debug,
    );
  }

  static Future<void> navigateToManagement(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
      path: _RoutePaths.manager,
    );
  }

  static Future<void> navigateToProfile(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
      path: _RoutePaths.profileList,
    );
  }

  static Future<void> navigateToProfileForm(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
      path: _RoutePaths.profileForm,
    );
  }

  static Future<void> navigateToCategory(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
      path: _RoutePaths.categoryList,
    );
  }

  static Future<void> navigateToCategoryForm(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
      path: _RoutePaths.categoryForm,
    );
  }

  static Future<void> navigateToPayee(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
      path: _RoutePaths.payeeList,
    );
  }

  static Future<void> navigateToPayeeForm(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
      path: _RoutePaths.payeeForm,
    );
  }

  static Future<void> navigateToPlayground(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
      path: _RoutePaths.playground,
    );
  }

  static Future<void> navigateToCounterChangeNotifier(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
      path: _RoutePaths.counterChangeNotifier,
    );
  }

  static Future<void> navigateToCounterStateNotifier(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
      path: _RoutePaths.counterStateNotifier,
    );
  }

  static Future<void> navigateToCounterRx(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
      path: _RoutePaths.counterRx,
    );
  }

  static Future<void> navigateToSelectableList(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
      path: _RoutePaths.selectableList,
    );
  }

  static Future<void> navigateToChangeNotifier(StackRouter router) {
    return AppNavigation.pushToNamed(
      router,
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
