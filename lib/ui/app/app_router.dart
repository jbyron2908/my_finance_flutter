import 'package:auto_route/auto_route.dart';
import 'package:my_finance_flutter_3/ui/pages/main/main_page.dart';
import 'package:my_finance_flutter_3/ui/pages/splash/splash_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_debug/debug_router.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/manager_router.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/counter/counter_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/playground_router.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      name: 'MainRouter',
      path: '/main',
      page: MainPage,
      children: [
        debugRouter,
        managerRouter,
        playgroundRouter,
      ],
    ),
    AutoRoute(
      path: '/root_counter',
      page: CounterPage,
      name: 'RootCounterRoute',
    ),
  ],
)
class $AppRouter {}
