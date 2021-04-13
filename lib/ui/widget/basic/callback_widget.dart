import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StatefulWrapper extends StatefulWidget {
  const StatefulWrapper({
    this.onInit,
    this.onRead,
    this.onDispose,
    required this.child,
  });

  final void Function(BuildContext context)? onInit;
  final void Function(BuildContext context)? onRead;
  final void Function(BuildContext context)? onDispose;
  final Widget child;

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  Widget build(BuildContext context) {
    widget.onInit?.call(context);
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onRead?.call(context);
    });

    return widget.child;
  }

  @override
  void dispose() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onDispose?.call(context);
    });
    super.dispose();
  }
}
