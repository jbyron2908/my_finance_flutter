import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider = Provider(
  (ref) {
    return NavigationProvider();
  },
);

class NavigationProvider {
  final String divisor = '------------------------';
  final routerListenerMap = <StackRouter, Function()>{};
  final tabsListenerMap = <TabsRouter, Function()>{};

  void registerRouter(StackRouter router) {
    removeRouterListener(router);

    var listener = () {
      onChangeRouter(router);
    };
    routerListenerMap[router] = listener;
    router.addListener(listener);
  }

  void unregisterRouter(StackRouter router) {
    removeRouterListener(router);
    routerListenerMap.remove(router);
  }

  void removeRouterListener(StackRouter router) {
    var currentListener = routerListenerMap[router];
    if (currentListener != null) {
      router.removeListener(currentListener);
    }
  }

  void onChangeRouter(StackRouter router) {
    print(divisor);
    var currentRoute = router.current?.name;
    var routeData = router.routeData?.name;
    print('onChangeRouter - ${router.key.value}');
    print('Router current - $currentRoute');
    print('RouteData - $routeData');
    print(divisor);
  }

  void registerTabsRouter(TabsRouter router) {
    removeTabsRouterListener(router);

    var listener = () {
      onChangeTabsRouter(router);
    };
    tabsListenerMap[router] = listener;
    router.addListener(listener);
  }

  void removeTabsRouterListener(TabsRouter router) {
    var currentListener = tabsListenerMap[router];
    if (currentListener != null) {
      router.removeListener(currentListener);
    }
  }

  void unregisterTabsRouter(TabsRouter router) {
    removeTabsRouterListener(router);
    tabsListenerMap.remove(router);
  }

  void onChangeTabsRouter(TabsRouter router) {
    print(divisor);
    var currentRoute = router.current?.name;
    var routeData = router.routeData?.name;
    print('onChangeRouter - ${router.key.value}');
    print('Router current - $currentRoute');
    print('RouteData - $routeData');
    print(divisor);
  }
}
