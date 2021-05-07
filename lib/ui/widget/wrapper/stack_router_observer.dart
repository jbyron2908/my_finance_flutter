import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class StackRouterObserver extends AutoRouterObserver {
  final Map<String, Set<StackAware>> _listeners = {};

  void subscribe(BuildContext context, StackAware stackAware) {
    var routeData = context.routeData;

    final subscribers =
        _listeners.putIfAbsent(routeData.name, () => <StackAware>{});
    if (subscribers.add(stackAware)) {
      stackAware.onTopStack();
    }
  }

  void unsubscribe(StackAware stackAware) {
    for (final route in _listeners.keys) {
      final subscribers = _listeners[route];
      subscribers?.remove(stackAware);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final previousSubscribers =
        _listeners[previousRoute?.settings.name]?.toList();

    if (previousSubscribers != null) {
      for (final stackAware in previousSubscribers) {
        stackAware.onTopStack();
      }
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final currentSubscribers = _listeners[route.settings.name];

    if (currentSubscribers != null) {
      for (final stackAware in currentSubscribers) {
        stackAware.onTopStack();
      }
    }

    final previousSubscribers = _listeners[previousRoute?.settings.name];

    if (previousSubscribers != null) {
      for (final stackAware in previousSubscribers) {
        stackAware.onBackStack();
      }
    }
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    super.didInitTabRoute(route, previousRoute);

    final currentSubscribers = _listeners[route.name];

    if (currentSubscribers != null) {
      for (final stackAware in currentSubscribers) {
        stackAware.onTopStack();
      }
    }

    final previousSubscribers = _listeners[previousRoute?.name];

    if (previousSubscribers != null) {
      for (final stackAware in previousSubscribers) {
        stackAware.onBackStack();
      }
    }
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    super.didChangeTabRoute(route, previousRoute);

    final currentSubscribers = _listeners[route.name];

    if (currentSubscribers != null) {
      for (final stackAware in currentSubscribers) {
        stackAware.onTopStack();
      }
    }

    final previousSubscribers = _listeners[previousRoute.name];

    if (previousSubscribers != null) {
      for (final stackAware in previousSubscribers) {
        stackAware.onBackStack();
      }
    }
  }
}

abstract class StackAware {
  void onTopStack() {}
  void onBackStack() {}
}
