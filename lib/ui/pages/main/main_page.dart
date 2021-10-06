import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/navigation/app_auto_router.gr.dart';
import 'package:my_finance_flutter_3/ui/widget/bottom_nav_bar/bottom_nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  final initialIndex = 1;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        ManagerRouter(),
        PlaygroundRouter(),
        DebugRouter(),
      ],
      builder: (context, child, animation) {
        return WillPopScope(
          onWillPop: () async {
            var tabsRouter = context.tabsRouter;
            var current = tabsRouter.topMost;

            if (current.stack.length > 1) {
              await current.pop();
            } else {
              if (tabsRouter.activeIndex != 0) {
                tabsRouter.setActiveIndex(0);
              } else {
                return true;
              }
            }

            return false;
          },
          child: child,
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
      selectedIndex: getIndex(tabsRouter.activeIndex),
      onIndexChange: (index) async {
        var newIndex = index - initialIndex;
        if (newIndex == -1) {
          newIndex = 2;
        }
        var currentIndex = getIndex(tabsRouter.activeIndex);
        if (index == currentIndex) {
          var currentRouter = tabsRouter.topMost;
          while (currentRouter.stack.length > 1) {
            await currentRouter.pop();
          }
        }
        tabsRouter.setActiveIndex(newIndex);
      },
    );
  }

  int getIndex(int tabsRouterIndex) {
    var index = (tabsRouterIndex + initialIndex) % 3;
    return index.toInt();
  }
}
