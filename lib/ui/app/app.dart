import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/app/app_controller.dart';

import 'app_router.gr.dart';

class MyFinanceApp extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AppController(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(
          navigatorObservers: [
            // LoggerRouteObserver(),
          ],
        ),
      ),
    );
  }
}

class LoggerRouteObserver extends RouteObserver {
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
}
