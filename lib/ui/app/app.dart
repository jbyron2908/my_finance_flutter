import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/app/app_controller.dart';
import 'package:my_finance_flutter_3/ui/navigation/app_auto_router.gr.dart';
import 'package:my_finance_flutter_3/ui/navigation/app_router_observer.dart';
import 'package:provider/provider.dart';

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
          var routerObserverRegister =
              context.read<AppRouterObserverRegister>();

          return MaterialApp.router(
            title: 'Flutter Demo',
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: appRouter.delegate(
              navigatorObservers: () => [
                AppRouterObserver(
                  appRouter,
                  routerObserverRegister.listener,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
