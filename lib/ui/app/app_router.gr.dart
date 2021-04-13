// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import '../pages/main/main_page.dart' as _i3;
import '../pages/splash/splash_page.dart' as _i2;
import '../pages/tab_debug/debug/debug_tools_page.dart' as _i5;
import '../pages/tab_manager/management/management_page.dart' as _i6;
import '../pages/tab_manager/payee/form/payee_form_page.dart' as _i7;
import '../pages/tab_playground/change_notifier/change_notifier_page.dart'
    as _i10;
import '../pages/tab_playground/counter/counter_page.dart' as _i4;
import '../pages/tab_playground/playground/playground_page.dart' as _i8;
import '../pages/tab_playground/selectable_list/selectable_list_page.dart'
    as _i9;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.SplashPage());
    },
    MainRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i3.MainPage());
    },
    RootCounterRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i4.CounterPage());
    },
    DebugRouter.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i1.EmptyRouterPage());
    },
    ManagerRouter.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i1.EmptyRouterPage());
    },
    PlaygroundRouter.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i1.EmptyRouterPage());
    },
    DebugToolsRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i5.DebugToolsPage());
    },
    ManagementRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i6.ManagementPage());
    },
    PayeeFormRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i7.PayeeFormPage());
    },
    PlaygroundRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i8.PlaygroundPage());
    },
    CounterRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i4.CounterPage());
    },
    SelectableListRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i9.SelectableListPage());
    },
    ChangeNotifierRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i10.ChangeNotifierPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(MainRoute.name,
            path: '/main',
            usesTabsRouter: true,
            children: [
              _i1.RouteConfig(DebugRouter.name,
                  path: 'debug',
                  children: [_i1.RouteConfig(DebugToolsRoute.name, path: '')]),
              _i1.RouteConfig(ManagerRouter.name, path: 'manager', children: [
                _i1.RouteConfig(ManagementRoute.name, path: ''),
                _i1.RouteConfig(PayeeFormRoute.name, path: 'payee_form')
              ]),
              _i1.RouteConfig(PlaygroundRouter.name,
                  path: 'playground',
                  children: [
                    _i1.RouteConfig(PlaygroundRoute.name, path: ''),
                    _i1.RouteConfig(CounterRoute.name, path: 'counter'),
                    _i1.RouteConfig(SelectableListRoute.name,
                        path: 'selectable_list'),
                    _i1.RouteConfig(ChangeNotifierRoute.name,
                        path: 'change_notifier')
                  ])
            ]),
        _i1.RouteConfig(RootCounterRoute.name, path: '/root_counter')
      ];
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

class MainRoute extends _i1.PageRouteInfo {
  const MainRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/main', initialChildren: children);

  static const String name = 'MainRoute';
}

class RootCounterRoute extends _i1.PageRouteInfo {
  const RootCounterRoute() : super(name, path: '/root_counter');

  static const String name = 'RootCounterRoute';
}

class DebugRouter extends _i1.PageRouteInfo {
  const DebugRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'debug', initialChildren: children);

  static const String name = 'DebugRouter';
}

class ManagerRouter extends _i1.PageRouteInfo {
  const ManagerRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'manager', initialChildren: children);

  static const String name = 'ManagerRouter';
}

class PlaygroundRouter extends _i1.PageRouteInfo {
  const PlaygroundRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'playground', initialChildren: children);

  static const String name = 'PlaygroundRouter';
}

class DebugToolsRoute extends _i1.PageRouteInfo {
  const DebugToolsRoute() : super(name, path: '');

  static const String name = 'DebugToolsRoute';
}

class ManagementRoute extends _i1.PageRouteInfo {
  const ManagementRoute() : super(name, path: '');

  static const String name = 'ManagementRoute';
}

class PayeeFormRoute extends _i1.PageRouteInfo {
  const PayeeFormRoute() : super(name, path: 'payee_form');

  static const String name = 'PayeeFormRoute';
}

class PlaygroundRoute extends _i1.PageRouteInfo {
  const PlaygroundRoute() : super(name, path: '');

  static const String name = 'PlaygroundRoute';
}

class CounterRoute extends _i1.PageRouteInfo {
  const CounterRoute() : super(name, path: 'counter');

  static const String name = 'CounterRoute';
}

class SelectableListRoute extends _i1.PageRouteInfo {
  const SelectableListRoute() : super(name, path: 'selectable_list');

  static const String name = 'SelectableListRoute';
}

class ChangeNotifierRoute extends _i1.PageRouteInfo {
  const ChangeNotifierRoute() : super(name, path: 'change_notifier');

  static const String name = 'ChangeNotifierRoute';
}
