import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/screen/balance_screen.dart';
import 'package:provider/provider.dart';

class BalanceRoute extends BaseRoute<BalanceRouteArgs, void> with MainTabRoute {
  BalanceRoute.forRouter();

  BalanceRoute({BalanceRouteArgs argument}) : super(argument: argument);

  @override
  String get routePath => '/home/main';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => BalanceScreen(),
      settings: routeSettings,
    );
  }
}

class BalanceRouteArgs {
  static BalanceRouteArgs of(BuildContext context) =>
      Provider.of<BalanceRouteArgs>(context, listen: false);

  int field1;

  BalanceRouteArgs({
    this.field1,
  });
}
