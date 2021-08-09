import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/theme/toolbar/toolbar_theme.dart';
import 'package:my_finance_flutter_3/ui/widget/helper/ui_helpers.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_panel_bloc.dart';
import 'package:provider/provider.dart';

class ToolbarPanel extends StatelessWidget {
  const ToolbarPanel({
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
            const TopBar(),
            Expanded(
              child: child,
            ),
            const BottomBar(),
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
    var theme = ToolbarTheme.of(context);
    return AnimatedContainer(
      duration: theme.animationDuration,
      height: bloc.isHidden ? 0 : theme.topBarHeight,
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
    var scaffoldContext = Scaffold.of(context).context;
    var bottom = MediaQuery.of(scaffoldContext).viewInsets.bottom;
    var isHidden = bloc.isHidden && bottom == 0;
    var theme = ToolbarTheme.of(context);

    return AnimatedContainer(
      duration: theme.animationDuration,
      height: isHidden ? 0 : theme.bottomBarHeight,
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
