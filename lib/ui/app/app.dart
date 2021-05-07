import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/app/app_controller.dart';
import 'package:my_finance_flutter_3/ui/widget/wrapper/stack_router_observer.dart';

import 'app_router.gr.dart';

class MyFinanceApp extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AppController(
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: appRouter.delegate(
              navigatorObservers: () => [
                StackRouterObserver(),
                // LoggerRouteObserver(appRouter),
              ],
            ),
          );
        },
      ),
    );
  }
}

class LoggerRouteObserver extends AutoRouterObserver {
  LoggerRouteObserver(this.router);

  final StackRouter router;

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    print('Pop route: ${route.settings.name}');
    print('Pop to route: ${previousRoute?.settings.name}');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    print('Push route: ${route.settings.name}');
    print('Push from route: ${previousRoute?.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    print('Replace route: ${newRoute?.settings.name}');
    print('Replace from route: ${oldRoute?.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    print('Remove route: ${route.settings.name}');
    print('Remove from route: ${previousRoute?.settings.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    super.didChangeTabRoute(route, previousRoute);
    print('Change tab route: ${route.name}');
    print('Change tab from route: ${previousRoute.name}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    super.didInitTabRoute(route, previousRoute);
    print('Init tab route: ${route.name}');
    print('Init tab from route: ${previousRoute?.name}');
  }
}
