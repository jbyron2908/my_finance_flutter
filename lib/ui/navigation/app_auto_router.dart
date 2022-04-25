import 'package:auto_route/auto_route.dart';
import 'package:my_finance_flutter_3/ui/pages/main/main_page.dart';
import 'package:my_finance_flutter_3/ui/pages/splash/splash_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_debug/debug/debug_tools_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/category/form/category_form_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/category/list/category_list_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/management/management_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/payee/form/payee_form_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/payee/list/payee_list_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/profile/form/profile_form_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/profile/list/profile_list_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/change_notifier/change_notifier_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/counter/counter_change_notifier_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/counter_state_notifier/counter_state_notifier_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/playground/playground_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/rx_counter/rx_counter_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/selectable_list/selectable_list_page.dart';

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
        AutoRoute(
          path: 'debug',
          name: 'DebugRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: DebugToolsPage,
              initial: true,
            ),
          ],
        ),
        AutoRoute(
          path: 'manager',
          name: 'ManagerRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: ManagementPage,
              initial: true,
            ),
            AutoRoute(
              path: 'profile/list',
              page: ProfileListPage,
            ),
            AutoRoute(
              path: 'profile/form',
              page: ProfileFormPage,
            ),
            AutoRoute(
              path: 'category/list',
              page: CategoryListPage,
            ),
            AutoRoute(
              path: 'category/form',
              page: CategoryFormPage,
            ),
            AutoRoute(
              path: 'payee/list',
              page: PayeeListPage,
            ),
            AutoRoute(
              path: 'payee/form',
              page: PayeeFormPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'playground',
          name: 'PlaygroundRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: PlaygroundPage,
              initial: true,
            ),
            AutoRoute(
              path: 'counter_change_notifier',
              page: CounterChangeNotifierPage,
            ),
            AutoRoute(
              path: 'counter_state_notifier',
              page: CounterStateNotifierPage,
            ),
            AutoRoute(
              path: 'rx_counter',
              page: RxCounterPage,
            ),
            AutoRoute(
              path: 'selectable_list',
              page: SelectableListPage,
            ),
            AutoRoute(
              path: 'change_notifier',
              page: ChangeNotifierPage,
            ),
          ],
        ),
      ],
    ),
    AutoRoute(
      path: '/root_counter',
      page: CounterChangeNotifierPage,
      name: 'RootCounterRoute',
    ),
  ],
)
class $AppRouter {}
