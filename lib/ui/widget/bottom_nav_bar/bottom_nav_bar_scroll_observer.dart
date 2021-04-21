import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/widget/bottom_nav_bar/bottom_nav_bar.dart';

class BottomNavBarScrollObserver extends StatelessWidget {
  const BottomNavBarScrollObserver({
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
    var bloc = BottomNavBar.of(context);
    var dy = scrollNotification.dragDetails?.delta.dy ?? 0;
    if (dy > 0 && !bloc.isVisible) {
      bloc.show();
    } else if (dy < 0 && bloc.isVisible) {
      bloc.hide();
    }
  }
}
