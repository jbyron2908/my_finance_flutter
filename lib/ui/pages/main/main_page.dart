import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/navigation/app_auto_router.gr.dart';
import 'package:my_finance_flutter_3/ui/widget/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:my_finance_flutter_3/ui/widget/wrapper/lifecycle_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  final initialIndex = 1;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        DebugRouter(),
        ManagerRouter(),
        PlaygroundRouter(),
      ],
      builder: (context, child, animation) {
        return LifecycleWidget(
          onRead: (context) {
            context.tabsRouter.setActiveIndex(initialIndex);
          },
          child: WillPopScope(
            onWillPop: () async {
              var tabsRouter = context.tabsRouter;
              var current = tabsRouter.topMost;

              if (current.stack.length > 1) {
                await current.pop();
              } else {
                if (tabsRouter.activeIndex != initialIndex) {
                  tabsRouter.setActiveIndex(initialIndex);
                } else {
                  return true;
                }
              }

              return false;
            },
            child: child,
          ),
        );
      },
      bottomNavigationBuilder: (_, tabsRouter) {
        return buildBottomNavBar(tabsRouter);
      },
    );
  }

  // My custom bottom nav bar
  Widget buildBottomNavBar(TabsRouter tabsRouter) {
    return BottomNavBar(
      backgroundColor: Colors.white,
      items: [
        BottomNavBarItem(
          activeColor: Colors.blue,
          title: const Text('Debug'),
          icon: const Icon(Icons.access_alarm),
        ),
        BottomNavBarItem(
          activeColor: Colors.blue,
          title: const Text('Management'),
          icon: const Icon(Icons.ac_unit),
        ),
        BottomNavBarItem(
          activeColor: Colors.blue,
          title: const Text('Playground'),
          icon: const Icon(Icons.account_balance_outlined),
        ),
      ],
      selectedIndex: tabsRouter.activeIndex,
      onIndexChange: (index) {
        tabsRouter.setActiveIndex(index);
      },
    );
  }
}
