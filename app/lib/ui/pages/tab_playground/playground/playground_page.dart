import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_finance_flutter_3/core/config/log/logger.dart';
import 'package:my_finance_flutter_3/ui/navigation/app_router.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/side_sheet/side_sheet.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_panel_bloc.dart';
import 'package:provider/provider.dart';

class PlaygroundPage extends StatelessWidget {
  const PlaygroundPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Playground page"),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: const Text('Counter ChangeNotifier'),
            leading: const FaIcon(Icons.add),
            onTap: () {
              AppRouter.navigateToCounterChangeNotifier(context);
            },
          ),
          ListTile(
            title: const Text('Counter StateNotifier'),
            leading: const FaIcon(Icons.add),
            onTap: () {
              AppRouter.navigateToCounterStateNotifier(context);
            },
          ),
          ListTile(
            title: const Text('Selectable List'),
            leading: const FaIcon(Icons.add),
            onTap: () {
              AppRouter.navigateToSelectableList(context);
            },
          ),
          // ListTile(
          //   title: const Text('Go to index 0'),
          //   leading: const FaIcon(Icons.add),
          //   onTap: () => context.tabsRouter.setActiveIndex(0),
          // ),
          // ListTile(
          //   title: const Text('Go to index 1'),
          //   leading: const FaIcon(Icons.add),
          //   onTap: () => context.tabsRouter.setActiveIndex(1),
          // ),
          // ListTile(
          //   title: const Text('Go to index 2'),
          //   leading: const FaIcon(Icons.add),
          //   onTap: () => context.tabsRouter.setActiveIndex(2),
          // ),
          ListTile(
            title: const Text('Change notifier'),
            leading: const FaIcon(Icons.add),
            onTap: () {
              AppRouter.navigateToChangeNotifier(context);
            },
          ),
          ListTile(
            title: const Text('Hide panel'),
            leading: const FaIcon(Icons.add),
            onTap: () {
              var bloc = context.read<ToolbarPanelBloc>();
              bloc.toggle();
            },
          ),
          ListTile(
            title: const Text('Open Side Modal from right'),
            leading: const FaIcon(Icons.add),
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
                                Log.i('Index select was $index');
                                AppRouter.navigateBack(context);
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
            title: const Text('Open Side Modal from left'),
            leading: const FaIcon(Icons.add),
            onTap: () {
              showSideSheet(
                rightSide: false,
                context: context,
                builder: (context) {
                  return Container(
                    width: 300,
                    color: Colors.green,
                    child: const Text('Side Modal from left'),
                  );
                },
              );
            },
          ),
          const ListTile(
            title: Text("Floating Panel"),
            leading: FaIcon(Icons.add),
          ),
          const ListTile(
            title: Text('Floating Panel'),
            leading: FaIcon(Icons.add),
          ),
          const ListTile(
            title: Text('Floating Panel'),
            leading: FaIcon(Icons.add),
          ),
          ListTile(
            title: const Text('Floating Panel'),
            leading: const FaIcon(Icons.add),
            onTap: () {
              var bloc = context.read<ToolbarPanelBloc>();
              bloc.toggle();
            },
          ),
          const ListTile(
            title: Text('Floating Panel'),
            leading: FaIcon(Icons.add),
          ),
        ],
      ),
    );
  }
}
