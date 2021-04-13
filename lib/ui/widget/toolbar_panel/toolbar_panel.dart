import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/widget/helper/ui_helpers.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_panel_bloc.dart';
import 'package:provider/provider.dart';

class ToolbarPanel extends StatelessWidget {
  ToolbarPanel({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ToolbarPanelBloc();
      },
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: MediaQuery.of(context).padding.top,
              color: Colors.transparent,
            ),
            TopBar(),
            Expanded(
              child: child,
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<ToolbarPanelBloc>();
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: bloc.isHidden ? 0 : 48,
      color: Colors.grey,
      transformAlignment: AlignmentDirectional.bottomCenter,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              children: bloc.topLeftChildren,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bloc.topCenterChildren,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: bloc.topRightChildren,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<ToolbarPanelBloc>();
    var context2 = Scaffold.of(context).context;
    var bottom = MediaQuery.of(context2).viewInsets.bottom;
    print('bottom - $bottom');
    var isHidden = bloc.isHidden && bottom == 0;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: isHidden ? 0 : 48,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: Colors.grey,
      child: Row(
        children: [
          UIHelper.horizontalSpaceTiny,
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: bloc.bottomLeftChildren,
            ),
          ),
          UIHelper.horizontalSpaceTiny,
          UIHelper.verticalDivider,
          UIHelper.horizontalSpaceTiny,
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bloc.bottomCenterChildren,
            ),
          ),
          UIHelper.horizontalSpaceTiny,
          UIHelper.verticalDivider,
          UIHelper.horizontalSpaceTiny,
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: bloc.bottomRightChildren,
            ),
          ),
          UIHelper.horizontalSpaceTiny,
        ],
      ),
    );
  }
}

class ToolbarPanelScrollObserver extends StatelessWidget {
  const ToolbarPanelScrollObserver({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          onScrollVertical(context, scrollNotification);
        }
        return false;
      },
      child: child,
    );
  }

  void onScrollVertical(
    BuildContext context,
    ScrollUpdateNotification scrollNotification,
  ) {
    var bloc = context.read<ToolbarPanelBloc>();
    var dy = scrollNotification.dragDetails?.delta.dy ?? 0;
    if (dy > 0 && bloc.isHidden) {
      bloc.show();
    } else if (dy < 0 && !bloc.isHidden) {
      bloc.hide();
    }
  }
}
