import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';
import 'package:my_finance_flutter_3/ui/widget/floating_bottom_bar/floating_bottom_bar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [PlaygroundRouter(), DebugRouter(), ManagerRouter()],
      builder: (context, child, animation) {
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
        return Scaffold(
          body: FloatingBottomBar(
            child: child,
          ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerFloat,
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          // var bloc = context.read(floatingPanelBlocProvider);
          // bloc.addChild(
          //   Container(
          //     child: Material(
          //       color: Colors.transparent,
          //       child: InkWell(
          //         onTap: () {
          //           print('hello');
          //         },
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Icon(
          //             Icons.menu,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // );
          //   },
          //   child: Icon(Icons.add),
          // ),
          // bottomNavigationBar: buildBottomNavigationBar(tabsRouter),
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
