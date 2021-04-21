import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';
import 'package:my_finance_flutter_3/ui/widget/bottom_nav_bar/bottom_nav_bar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        PlaygroundRouter(),
        ManagerRouter(),
        ManagerRouter(),
        ManagerRouter(),
        DebugRouter(),
      ],
      builder: (context, child, animation) {
        return WillPopScope(
          onWillPop: () async {
            var current = context.tabsRouter.topMost;

            if (current.stack.length > 1) {
              await current.pop();
            } else {
              var tabsRouter = context.tabsRouter;
              if (tabsRouter.activeIndex != 2) {
                tabsRouter.setActiveIndex(2);
              }
            }

            return false;
          },
          child: Scaffold(
            body: child,
            bottomNavigationBar: buildBottomNavBar(context.tabsRouter),
          ),
        );
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
          title: Text('Debug'),
          icon: Icon(Icons.access_alarm),
        ),
        BottomNavBarItem(
          activeColor: Colors.blue,
          title: Text('Management'),
          icon: Icon(Icons.ac_unit),
        ),
        BottomNavBarItem(
          title: Text('Management'),
          activeColor: Colors.blue,
          icon: Icon(Icons.ac_unit),
        ),
        BottomNavBarItem(
          title: Text('Management'),
          activeColor: Colors.blue,
          icon: Icon(Icons.ac_unit),
        ),
        BottomNavBarItem(
          activeColor: Colors.blue,
          title: Text('Playground'),
          icon: Icon(Icons.account_balance_outlined),
        ),
      ],
      selectedIndex: tabsRouter.activeIndex,
      onIndexChange: (index) {
        tabsRouter.setActiveIndex(index);
      },
    );
  }
}
