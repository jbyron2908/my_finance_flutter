import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';
import 'package:my_finance_flutter_3/ui/app/navigation_provider.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/callback_widget.dart';
import 'package:my_finance_flutter_3/ui/widget/floating_bottom_bar/floating_bottom_bar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [PlaygroundRouter(), DebugRouter(), ManagerRouter()],
      builder: (context, child, animation) {
        var provider = context.read(navigationProvider);
        provider.registerTabsRouter(context.tabsRouter);
        provider.registerRouter(context.tabsRouter.stackRouterOfIndex(0)!);
        provider.registerRouter(context.tabsRouter.stackRouterOfIndex(1)!);
        provider.registerRouter(context.tabsRouter.stackRouterOfIndex(2)!);
        // context.tabsRouter.addListener(() {
        //   var router = context.tabsRouter;
        //   var currentRoute = router.current?.name;
        //   var routeData = router.routeData?.name;
        //   print('Router current - $currentRoute');
        //   print('RouteData - $routeData');
        // });
        // return FloatingPanel(
        //   centerAction: (_) {
        //     return GestureDetector(
        //       onVerticalDragEnd: (details) {
        //         print('onVerticalDragEnd - ${details.primaryVelocity}');
        //         var velocity = (details.primaryVelocity ?? 1);
        //         if (velocity > 0) {
        //           incrementIndex(context);
        //         } else {
        //           decreaseIndex(context);
        //         }
        //       },
        //       child: CircleButton(
        //         onPressed: () {
        //           // incrementIndex(context);
        //         },
        //         child: Icon(
        //           Icons.menu,
        //           color: Colors.white,
        //         ),
        //       ),
        //     );
        //   },
        return FloatingPanel(
          child: StatefulWrapper(
            onRead: () {
              FloatingPanel.of(context).updateLeftChildren([
                MenuIcon(),
              ]);
            },
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
