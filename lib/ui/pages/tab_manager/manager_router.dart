import 'package:auto_route/auto_route.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/management/management_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/payee/form/payee_form_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/payee/list/payee_list_page.dart';

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
      path: 'payee_list',
      page: PayeeListPage,
    ),
    AutoRoute(
      path: 'payee_form',
      page: PayeeFormPage,
    ),
  ],
);
