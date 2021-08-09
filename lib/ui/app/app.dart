import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/core/config/log/logger.dart';
import 'package:my_finance_flutter_3/ui/app/app_controller.dart';
import 'package:my_finance_flutter_3/ui/navigation/app_auto_router.gr.dart';
import 'package:my_finance_flutter_3/ui/widget/wrapper/stack_router_observer.dart';

class MyFinanceApp extends StatelessWidget {
  MyFinanceApp({
    Key? key,
  }) : super(key: key);

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
    Log.i('Pop route: ${route.settings.name}');
    Log.i('Pop to route: ${previousRoute?.settings.name}');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    Log.i('Push route: ${route.settings.name}');
    Log.i('Push from route: ${previousRoute?.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    Log.i('Replace route: ${newRoute?.settings.name}');
    Log.i('Replace from route: ${oldRoute?.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    Log.i('Remove route: ${route.settings.name}');
    Log.i('Remove from route: ${previousRoute?.settings.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    super.didChangeTabRoute(route, previousRoute);
    Log.i('Change tab route: ${route.name}');
    Log.i('Change tab from route: ${previousRoute.name}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    super.didInitTabRoute(route, previousRoute);
    Log.i('Init tab route: ${route.name}');
    Log.i('Init tab from route: ${previousRoute?.name}');
  }
}
