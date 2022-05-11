import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme/src/widget/toolbar_panel/toolbar_panel_bloc.dart';

class ToolbarScrollObserver extends StatelessWidget {
  const ToolbarScrollObserver({
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
