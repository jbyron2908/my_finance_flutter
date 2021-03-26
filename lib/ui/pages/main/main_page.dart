import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/circle_icon_button.dart';
import 'package:my_finance_flutter_3/ui/widget/floating_panel/floating_panel.dart';
import 'package:my_finance_flutter_3/ui/widget/floating_panel/floating_panel_bloc.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [PlaygroundRouter(), DebugRouter(), ManagerRouter()],
      builder: (context, child, animation) {
        return FloatingPanel(
          centerAction: (_) => CircleButton(
            onPressed: () {
              var tabsRouter = context.tabsRouter;
              var activeIndex = tabsRouter.activeIndex;
              activeIndex = (activeIndex + 1) % 3;
              tabsRouter.setActiveIndex(activeIndex);
            },
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          child: Scaffold(
            body: child,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                var bloc = context.read(floatingPanelBlocProvider);
                bloc.show();
              },
            ),
            // bottomNavigationBar: buildBottomNavigationBar(tabsRouter),
          ),
        );
      },
    );
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
