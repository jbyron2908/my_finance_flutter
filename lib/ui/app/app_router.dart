import 'package:auto_route/auto_route.dart';
import 'package:my_finance_flutter_3/ui/pages/playground/counter/counter_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: CounterPage,
      initial: true,
    ),
    // AutoRoute(
    //   path: '/main',
    //   page: MainPage,
    //   usesTabsRouter: true,
    //   children: [
    //     // debugRouter,
    //     // manageRouter,
    //     AutoRoute(
    //       path: 'child',
    //       name: 'ChildRouter',
    //       page: EmptyRouterPage,
    //       children: [
    //         AutoRoute(
    //           path: '',
    //           page: Child1Page,
    //           name: 'RootChildRoute',
    //         ),
    //         AutoRoute(
    //           path: 'child_1',
    //           page: Child1Page,
    //         ),
    //         AutoRoute(
    //           path: 'child_2',
    //           page: Child2Page,
    //         ),
    //         AutoRoute(
    //           path: 'child_3',
    //           page: Child3Page,
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  ],
)
class $AppRouter {}
