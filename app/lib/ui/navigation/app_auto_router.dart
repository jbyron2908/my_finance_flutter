import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:my_finance_flutter/ui/pages/main/main_page.dart';
import 'package:my_finance_flutter/ui/pages/splash/splash_page.dart';
import 'package:my_finance_flutter/ui/pages/tab_debug/debug/debug_tools_page.dart';
import 'package:my_finance_flutter/ui/pages/tab_manager/category/form/category_form_page.dart';
import 'package:my_finance_flutter/ui/pages/tab_manager/category/list/category_list_page.dart';
import 'package:my_finance_flutter/ui/pages/tab_manager/management/management_page.dart';
import 'package:my_finance_flutter/ui/pages/tab_manager/payee/form/payee_form_page.dart';
import 'package:my_finance_flutter/ui/pages/tab_manager/payee/list/payee_list_page.dart';
import 'package:my_finance_flutter/ui/pages/tab_manager/profile/form/profile_form_page.dart';
import 'package:my_finance_flutter/ui/pages/tab_manager/profile/list/profile_list_page.dart';
import 'package:my_finance_flutter/ui/pages/tab_playground/change_notifier/change_notifier_page.dart';
import 'package:my_finance_flutter/ui/pages/tab_playground/counter/counter_change_notifier_page.dart';
import 'package:my_finance_flutter/ui/pages/tab_playground/counter_state_notifier/counter_state_notifier_page.dart';
import 'package:my_finance_flutter/ui/pages/tab_playground/playground/playground_page.dart';
import 'package:my_finance_flutter/ui/pages/tab_playground/rx_counter/rx_counter_page.dart';
import 'package:my_finance_flutter/ui/pages/tab_playground/selectable_list/selectable_list_page.dart';
import 'package:navigation/navigation.dart';

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
      path: '/${Routes.main}',
      page: MainPage,
      children: [
        AutoRoute(
          path: Routes.debug,
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
          path: Routes.manager,
          name: 'ManagerRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: ManagementPage,
              initial: true,
            ),
            AutoRoute(
              path: Routes.profileList,
              page: ProfileListPage,
            ),
            AutoRoute(
              path: Routes.profileForm,
              page: ProfileFormPage,
            ),
            AutoRoute(
              path: Routes.categoryList,
              page: CategoryListPage,
            ),
            AutoRoute(
              path: Routes.categoryForm,
              page: CategoryFormPage,
            ),
            AutoRoute(
              path: Routes.payeeList,
              page: PayeeListPage,
            ),
            AutoRoute(
              path: Routes.payeeForm,
              page: PayeeFormPage,
            ),
          ],
        ),
        AutoRoute(
          path: Routes.playground,
          name: 'PlaygroundRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: PlaygroundPage,
              initial: true,
            ),
            AutoRoute(
              path: Routes.counterChangeNotifier,
              page: CounterChangeNotifierPage,
            ),
            AutoRoute(
              path: Routes.counterStateNotifier,
              page: CounterStateNotifierPage,
            ),
            AutoRoute(
              path: Routes.counterRx,
              page: RxCounterPage,
            ),
            AutoRoute(
              path: Routes.selectableList,
              page: SelectableListPage,
            ),
            AutoRoute(
              path: Routes.changeNotifier,
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
class $AppAutoRouter {}
