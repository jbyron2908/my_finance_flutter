import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_finance_flutter_3/ui/widget/floating_bottom_bar/floating_bottom_bar_bloc.dart';

class FloatingBottomBar extends StatelessWidget {
  static FloatingBottomBarBloc of(BuildContext context) =>
      context.read(floatingPanelBlocProvider);

  FloatingBottomBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // var bloc = context.read(floatingPanelBlocProvider);
    return Stack(
      children: [
        child,
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.black45,
            child: Consumer(
              builder: (context, watch, child) {
                var bloc = watch(floatingPanelBlocProvider);
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Row(
                        children: bloc.children,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: bloc.children,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: bloc.children,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class FloatingPanelAction extends StatelessWidget {
  const FloatingPanelAction({
    Key? key,
    required this.controller,
    required this.child,
  }) : super(key: key);

  final FloatingBottomBarBloc controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        var isHidden = watch(floatingPanelBlocProvider).isHidden;
        return AnimatedPadding(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AnimatedOpacity(
            opacity: isHidden ? 0 : 1,
            duration: Duration(milliseconds: 300),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
