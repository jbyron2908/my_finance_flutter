import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_router.gr.dart';

class MyFinanceApp extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [
        LoggerProviderObserver(),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(navigatorObservers: [
          LoggerRouteObserver(),
        ]),
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

class LoggerProviderObserver extends ProviderObserver {
  final String divisor = '------------------------';
  @override
  void didAddProvider(ProviderBase provider, Object? value) {
    log(divisor);
    log('${_getProviderName(provider)} - created');
    log('${_getProviderName(provider)} - value = ${value.toString()}');
    log(divisor);
  }

  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    log(divisor);
    log('${_getProviderName(provider)} - updated');
    log('${_getProviderName(provider)} - value = ${newValue.toString()}');
    log(divisor);
  }

  @override
  void didDisposeProvider(ProviderBase provider) {
    log(divisor);
    log('${_getProviderName(provider)} - dispose');
    log(divisor);
  }

  String _getProviderName(ProviderBase provider) {
    var type = provider.runtimeType.toString();
    var name = provider.name;
    return '$type:$name';
  }
}
