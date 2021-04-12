import 'package:auto_route/auto_route.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/change_notifier/change_notifier_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/counter/counter_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/floating_panel/floating_panel_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/playground/playground_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/selectable_list/selectable_list_page.dart';

const playgroundRouter = AutoRoute(
  path: 'playground',
  name: 'PlaygroundRouter',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      path: '',
      page: PlaygroundPage,
    ),
    AutoRoute(
      path: 'counter',
      page: CounterPage,
    ),
    AutoRoute(
      path: 'selectable_list',
      page: SelectableListPage,
    ),
    AutoRoute(
      path: 'floating_panel',
      page: FloatingPanelPage,
    ),
    AutoRoute(
      path: 'change_notifier',
      page: ChangeNotifierPage,
    ),
  ],
);
