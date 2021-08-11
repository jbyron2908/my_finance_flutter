import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppRouterObserver extends AutoRouterObserver {
  AppRouterObserver(
    this._router,
    this._listeners,
  );

  final StackRouter _router;
  final Map<LocalKey, Set<StackAware>> _listeners;

  // Route handle

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) {
      _checkOnTopStackRoute(previousRoute);
    }

    _checkOnBackStackRoute(route);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _checkOnTopStackRoute(route);

    if (previousRoute != null) {
      _checkOnBackStackRoute(previousRoute);
    }
  }

  void _checkOnTopStackRoute(Route<dynamic> route) {
    final subscribers = _getSubscribersFromRoute(route);

    for (final stackAware in subscribers) {
      stackAware.onTopStack();
    }
  }

  void _checkOnBackStackRoute(Route<dynamic> route) {
    final subscribers = _getSubscribersFromRoute(route);

    for (final stackAware in subscribers) {
      stackAware.onBackStack();
    }
  }

  List<StackAware> _getSubscribersFromRoute(Route<dynamic> route) {
    if (route.settings is AutoRoutePage) {
      var key = (route.settings as AutoRoutePage).routeKey;
      return _listeners[key]?.toList() ?? [];
    } else {
      return [];
    }
  }

  // Tab handle

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    super.didInitTabRoute(route, previousRoute);

    _checkOnTopStackTabRoute(route);

    if (previousRoute != null) {
      _checkOnBackStackTabRoute(previousRoute);
    }
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    super.didChangeTabRoute(route, previousRoute);

    _checkOnTopStackTabRoute(route);
    _checkOnBackStackTabRoute(previousRoute);
  }

  void _checkOnTopStackTabRoute(TabPageRoute route) {
    var routeData = _getRouteData(route);
    if (routeData != null) {
      final subscribers = _getSubscribersFromTab(routeData);

      for (final stackAware in subscribers) {
        stackAware.onTopStack();
      }
    }
  }

  void _checkOnBackStackTabRoute(TabPageRoute route) {
    var routeData = _getRouteData(route);
    if (routeData != null) {
      final subscribers = _getSubscribersFromTab(routeData);

      for (final stackAware in subscribers) {
        stackAware.onBackStack();
      }
    }
  }

  RouteData? _getRouteData(TabPageRoute route) {
    var router = (_router.topMost is TabsRouter)
        ? _router.topMost
        : _router.topMost.parent();

    if (router != null && router is TabsRouter) {
      var routeStackRoute = router.stackRouterOfIndex(route.index);
      return routeStackRoute?.current;
    }
  }

  List<StackAware> _getSubscribersFromTab(RouteData route) {
    var key = route.key;
    return _listeners[key]?.toList() ?? [];
  }
}

class AppRouterObserverRegister {
  final Map<LocalKey, Set<StackAware>> _listeners =
      <LocalKey, Set<StackAware>>{};

  Map<LocalKey, Set<StackAware>> get listener => _listeners;

  void subscribe(StackAware routeAware, RouteData route) {
    final Set<StackAware> subscribers =
        _listeners.putIfAbsent(route.key, () => <StackAware>{});
    if (subscribers.add(routeAware)) {
      routeAware.onTopStack();
    }
  }

  void unsubscribe(StackAware routeAware) {
    for (final route in _listeners.keys) {
      final Set<StackAware>? subscribers = _listeners[route];
      subscribers?.remove(routeAware);
    }
  }
}

abstract class StackAware {
  void onTopStack() {}
  void onBackStack() {}
}
