import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/callback_widget.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_panel.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [PlaygroundRouter(), DebugRouter(), ManagerRouter()],
      builder: (context, child, animation) {
        return ToolbarPanel(
          child: StatefulWrapper(
            onRead: (context) {},
            child: child,
          ),
        );
      },
    );
  }

  void incrementIndex(BuildContext context) {
    var tabsRouter = context.tabsRouter;
    var routeNumber = tabsRouter.routeCollection.routes.length;
    var activeIndex = tabsRouter.activeIndex;
    activeIndex = (activeIndex + 1) % routeNumber;
    tabsRouter.setActiveIndex(activeIndex);
  }

  void decreaseIndex(BuildContext context) {
    var tabsRouter = context.tabsRouter;
    var routeNumber = tabsRouter.routeCollection.routes.length;
    var activeIndex = tabsRouter.activeIndex - 1;
    activeIndex = activeIndex == -1 ? routeNumber - 1 : activeIndex;
    tabsRouter.setActiveIndex(activeIndex);
  }

  BottomNavigationBar buildBottomNavigationBar(TabsRouter tabsRouter) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: 'Child1',
          icon: Icon(Icons.access_alarm),
        ),
        BottomNavigationBarItem(
          label: 'Child2',
          icon: Icon(Icons.ac_unit),
        ),
        BottomNavigationBarItem(
          label: 'Child3',
          icon: Icon(Icons.account_balance_outlined),
        ),
      ],
      currentIndex: tabsRouter.activeIndex,
      onTap: (index) {
        tabsRouter.setActiveIndex(index);
      },
    );
  }
}

class MenuIcon extends StatelessWidget {
  const MenuIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            incrementIndex(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.visibility,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void incrementIndex(BuildContext context) {
    var tabsRouter = context.tabsRouter;
    var routeNumber = tabsRouter.routeCollection.routes.length;
    var activeIndex = tabsRouter.activeIndex;
    activeIndex = (activeIndex + 1) % routeNumber;
    tabsRouter.setActiveIndex(activeIndex);
  }
}
