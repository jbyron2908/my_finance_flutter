import 'package:auto_route/auto_route.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/change_notifier/change_notifier_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/counter/counter_change_notifier_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/counter_state_notifier/counter_state_notifier_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/playground/playground_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/rx_counter/rx_counter_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/selectable_list/selectable_list_page.dart';

const playgroundRouter = AutoRoute(
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
);
