import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/side_sheet/side_sheet.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_panel_bloc.dart';
import 'package:provider/provider.dart';

class PlaygroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
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
          title: Text('Open Side Modal from right'),
          leading: FaIcon(Icons.add),
          onTap: () async {
            // showSideSheet(
            //   context: context,
            //   builder: (context) {
            //     return Container(
            //       width: 300,
            //       color: Colors.green,
            //       child: Text('Side Modal from left'),
            //     );
            //   },
            // );
            var onReturn = (int index) => print('Index select was $index');
            await showSideSheet(
              context: context,
              builder: (context) {
                return Container(
                  width: 300,
                  color: Colors.amber,
                  child: Scaffold(
                    body: ListView(
                      children: List.generate(
                        25,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              onReturn(index);
                              context.router.pop();
                            },
                            child: Text('Button $index'),
                          ),
                        ),
                      ).toList(),
                    ),
                  ),
                );
              },
            );
          },
        ),
        ListTile(
          title: Text('Open Side Modal from left'),
          leading: FaIcon(Icons.add),
          onTap: () {
            showSideSheet(
              rightSide: false,
              context: context,
              builder: (context) {
                return Container(
                  width: 300,
                  color: Colors.green,
                  child: Text('Side Modal from left'),
                );
              },
            );
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
    );
  }
}
