import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_panel.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_panel_bloc.dart';
import 'package:provider/provider.dart';

class PlaygroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context.router.addListener(() {
    //   var router = context.router;
    //   var currentRoute = router.current?.name;
    //   var routeData = router.routeData?.name;
    //   print('Router current - $currentRoute');
    //   print('RouteData - $routeData');
    // });

    return ToolbarPanelScrollObserver(
      child: ListView(
        children: [
          ListTile(
            title: Text('Counter'),
            leading: FaIcon(Icons.add),
            onTap: () => context.router.push(CounterRoute()),
          ),
          ListTile(
            title: Text('Selectable List'),
            leading: FaIcon(Icons.add),
            onTap: () => context.router.push(SelectableListRoute()),
          ),
          ListTile(
            title: Text('Go to index 0'),
            leading: FaIcon(Icons.add),
            onTap: () => context.tabsRouter.setActiveIndex(0),
          ),
          ListTile(
            title: Text('Go to index 1'),
            leading: FaIcon(Icons.add),
            onTap: () => context.tabsRouter.setActiveIndex(1),
          ),
          ListTile(
            title: Text('Go to index 2'),
            leading: FaIcon(Icons.add),
            onTap: () => context.tabsRouter.setActiveIndex(2),
          ),
          ListTile(
            title: Text('Root counter page'),
            leading: FaIcon(Icons.add),
            onTap: () => context.router.root.push(RootCounterRoute()),
          ),
          ListTile(
            title: Text('Change notifier'),
            leading: FaIcon(Icons.add),
            onTap: () => context.router.push(ChangeNotifierRoute()),
          ),
          ListTile(
            title: Text('Hide panel'),
            leading: FaIcon(Icons.add),
            onTap: () {
              var bloc = context.read<ToolbarPanelBloc>();
              bloc.toggle();
            },
          ),
          ListTile(
            title: Text('Floating Panel'),
            leading: FaIcon(Icons.add),
          ),
          ListTile(
            title: Text('Floating Panel'),
            leading: FaIcon(Icons.add),
          ),
          ListTile(
            title: Text('Floating Panel'),
            leading: FaIcon(Icons.add),
          ),
          ListTile(
            title: Text('Floating Panel'),
            leading: FaIcon(Icons.add),
          ),
          ListTile(
            title: Text('Floating Panel'),
            leading: FaIcon(Icons.add),
          ),
          ListTile(
            title: Text('Floating Panel'),
            leading: FaIcon(Icons.add),
          ),
          ListTile(
            title: Text('Floating Panel'),
            leading: FaIcon(Icons.add),
            onTap: () {
              var bloc = context.read<ToolbarPanelBloc>();
              bloc.toggle();
            },
          ),
          ListTile(
            title: Text('Floating Panel'),
            leading: FaIcon(Icons.add),
          ),
        ],
      ),
    );
  }
}
