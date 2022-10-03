import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:my_finance_flutter/ui/pages/tab_manager/management/management_page.dart';

import 'category/pages.dart';
import 'payee/pages.dart';
import 'profile/pages.dart';

const managerRouter = AutoRoute(
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
);
