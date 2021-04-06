import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_finance_flutter_3/ui/widget/floating_panel/floating_panel_bloc.dart';

class FloatingPanel extends StatelessWidget {
  static FloatingPanelBloc of(BuildContext context) =>
      context.read(floatingPanelBlocProvider);

  FloatingPanel({
    Key? key,
    required this.child,
    this.centerAction,
    this.leftAction,
    this.rightAction,
  }) : super(key: key);

  final Widget child;
  final Widget Function(FloatingPanelBloc)? centerAction;
  final Widget Function(FloatingPanelBloc)? leftAction;
  final Widget Function(FloatingPanelBloc)? rightAction;

  @override
  Widget build(BuildContext context) {
    var bloc = context.read(floatingPanelBlocProvider);
    return Stack(
      children: [
        child,
        if (leftAction != null)
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingPanelAction(
              controller: bloc,
              child: leftAction!(bloc),
            ),
          ),
        if (centerAction != null)
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingPanelAction(
              controller: bloc,
              child: centerAction!(bloc),
            ),
          ),
        if (rightAction != null)
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingPanelAction(
              controller: bloc,
              child: rightAction!(bloc),
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

  final FloatingPanelBloc controller;
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
