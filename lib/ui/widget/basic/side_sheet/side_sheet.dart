import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

void showSideSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool rightSide = true,
}) {
  showGeneralDialog(
    context: context,
    barrierLabel: 'SidePanel',
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: (rightSide ? Alignment.centerRight : Alignment.centerLeft),
        child: Dismissible(
          key: GlobalKey(),
          onDismissed: (_) {
            context.router.pop();
          },
          direction: rightSide
              ? DismissDirection.startToEnd
              : DismissDirection.endToStart,
          child: Material(
            child: Container(
              height: double.infinity,
              child: builder(context),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation1, animation2, child) {
      return SlideTransition(
        position: Tween(
          begin: Offset((rightSide ? 1 : -1), 0),
          end: Offset(0, 0),
        ).animate(animation1),
        child: child,
      );
    },
  );
}
