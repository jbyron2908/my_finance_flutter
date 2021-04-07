import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_finance_flutter_3/ui/widget/floating_bottom_bar/floating_bottom_bar_bloc.dart';

class FloatingPanel extends StatelessWidget {
  static FloatingBottomBarBloc of(BuildContext context) =>
      context.read(floatingPanelBlocProvider);

  FloatingPanel({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Consumer(
          builder: (context, watch, child) {
            var bloc = watch(floatingPanelBlocProvider);
            return AnimatedOpacity(
              opacity: bloc.isHidden ? 0 : 1,
              duration: Duration(milliseconds: 200),
              child: Stack(
                children: [
                  BottomBar(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Consumer(
        builder: (context, watch, child) {
          var bloc = watch(floatingPanelBlocProvider);

          return AnimatedPadding(
            duration: Duration(milliseconds: 50),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      children: bloc.leftChildren,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: bloc.centerChildren,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: bloc.rightChildren,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
