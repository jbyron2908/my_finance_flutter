import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/app_controller.dart';
import 'package:my_finance_flutter/ui/navigation/app_auto_router.gr.dart';
import 'package:navigation/navigation.dart';
import 'package:provider/provider.dart';

class MyFinanceApp extends StatelessWidget {
  const MyFinanceApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppController(
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  final appRouter = AppAutoRouter();

  @override
  Widget build(BuildContext context) {
    var routerObserverRegister = context.read<AppRouterObserverRegister>();

    return MaterialApp.router(
      title: 'Flutter Demo',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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
  }
}
