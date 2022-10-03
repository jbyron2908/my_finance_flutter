import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:my_finance_flutter/ui/pages/tab_debug/debug/debug_tools_page.dart';

const debugRouter = AutoRoute(
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
);
