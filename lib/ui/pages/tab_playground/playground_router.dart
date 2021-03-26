import 'package:auto_route/auto_route.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/counter/counter_page.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/playground/playground_page.dart';

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
  ],
);
