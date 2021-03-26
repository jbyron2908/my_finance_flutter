// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import '../pages/playground/counter/counter_page.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    CounterRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i2.CounterPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes =>
      [_i1.RouteConfig(CounterRoute.name, path: '/')];
}

class CounterRoute extends _i1.PageRouteInfo {
  const CounterRoute() : super(name, path: '/');

  static const String name = 'CounterRoute';
}
