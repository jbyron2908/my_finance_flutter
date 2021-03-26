import 'package:auto_route/auto_route.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/main/management_page.dart';

const managerRouter = AutoRoute(
  path: 'manager',
  name: 'ManagerRouter',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      path: '',
      page: ManagementPage,
    ),
  ],
);
