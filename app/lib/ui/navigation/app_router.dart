import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/core/domain/model/payee/payee_model.dart';
import 'package:my_finance_flutter_3/ui/navigation/app_auto_router.gr.dart';
import 'package:my_finance_flutter_3/ui/navigation/app_navigation.dart';

class AppRouter {
  AppRouter._();

  static Future<bool> navigateBack(BuildContext context, {Object? result}) {
    return AppNavigation.pop(context, result: result);
  }

  static Future<void> replaceToMain(BuildContext context) {
    return AppNavigation.replaceTo(
      context,
      route: const MainRouter(),
    );
  }

  static Future<void> navigateToDebug(BuildContext context) {
    return AppNavigation.pushTo(
      context,
      route: const DebugToolsRoute(),
    );
  }

  static Future<void> navigateToManagement(BuildContext context) {
    return AppNavigation.pushTo(
      context,
      route: const ManagementRoute(),
    );
  }

  static Future<void> navigateToProfile(BuildContext context) {
    return AppNavigation.pushTo(
      context,
      route: const ProfileListRoute(),
    );
  }

  static Future<void> navigateToProfileForm(BuildContext context) {
    return AppNavigation.pushTo(
      context,
      route: ProfileFormRoute(),
    );
  }

  static Future<void> navigateToCategory(
    BuildContext context,
  ) {
    return AppNavigation.pushTo(
      context,
      route: const CategoryListRoute(),
    );
  }

  static Future<void> navigateToCategoryForm(BuildContext context) {
    return AppNavigation.pushTo(
      context,
      route: CategoryFormRoute(),
    );
  }

  static Future<void> navigateToPayee(
      BuildContext context, Function(PayeeModel) onResult) {
    return AppNavigation.pushTo(
      context,
      route: const PayeeListRoute(),
    );
  }

  static Future<void> navigateToPayeeForm(BuildContext context) {
    return AppNavigation.pushTo(
      context,
      route: PayeeFormRoute(),
    );
  }

  static Future<void> navigateToPlayground(BuildContext context) {
    return AppNavigation.pushTo(
      context,
      route: const PlaygroundRoute(),
    );
  }

  static Future<void> navigateToCounterChangeNotifier(BuildContext context) {
    return AppNavigation.pushTo(
      context,
      route: const CounterChangeNotifierRoute(),
    );
  }

  static Future<void> navigateToCounterStateNotifier(BuildContext context) {
    return AppNavigation.pushTo(
      context,
      route: const CounterStateNotifierRoute(),
    );
  }

  static Future<void> navigateToSelectableList(BuildContext context) {
    return AppNavigation.pushTo(
      context,
      route: const SelectableListRoute(),
    );
  }

  static Future<void> navigateToChangeNotifier(BuildContext context) {
    return AppNavigation.pushTo(
      context,
      route: const ChangeNotifierRoute(),
    );
  }
}
