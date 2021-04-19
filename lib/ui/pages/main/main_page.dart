import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/lifecycle_widget.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_button.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_panel.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_panel_bloc.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [ManagerRouter(), PlaygroundRouter(), DebugRouter()],
      builder: (context, child, animation) {
        return ToolbarPanel(
          child: LifecycleWidget(
            onRead: (context) {
              var toolbar = context.read<ToolbarPanelBloc>();
              toolbar.updateBottomCenterChildren([
                ToolbarButton(
                  onPressed: () {
                    showTabsModal(context);
                  },
                  child: Icon(Icons.menu),
                ),
              ]);
            },
            child: WillPopScope(
              onWillPop: () async {
                var current = context.tabsRouter.topMost;

                if (current.stack.length > 1) {
                  await current.pop();
                } else {
                  var tabsRouter = context.tabsRouter;
                  if (tabsRouter.activeIndex != 0) {
                    tabsRouter.setActiveIndex(0);
                  }
                }

                return false;
              },
              child: child,
            ),
          ),
        );
      },
    );
  }

  void showTabsModal(BuildContext parent) {
    showMaterialModalBottomSheet(
      context: parent,
      builder: (context) {
        return ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text('Playground'),
              onTap: () {
                parent.tabsRouter.setActiveIndex(0);
                context.router.pop();
              },
            ),
            ListTile(
              title: Text('Debug'),
              onTap: () {
                parent.tabsRouter.setActiveIndex(1);
                context.router.pop();
              },
            ),
            ListTile(
              title: Text('Management'),
              onTap: () {
                parent.tabsRouter.setActiveIndex(2);
                context.router.pop();
              },
            ),
          ],
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
