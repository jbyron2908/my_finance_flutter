import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';

class {{pascalCase name}}Screen extends StatelessWidget {
  static String get _routeName => '/newScreen';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => {{pascalCase name}}Screen(),
          binding: {{pascalCase name}}Binding(),
        ),
      );

  static void navigateTo() {
    MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return {{pascalCase name}}View();
  }
}

class {{pascalCase name}}Binding implements Bindings {
  @override
  void dependencies() {
    Get.put({{pascalCase name}}Controller());
  }
}
