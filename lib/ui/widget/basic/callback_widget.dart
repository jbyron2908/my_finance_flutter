import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StatefulWrapper extends StatefulWidget {
  const StatefulWrapper({
    this.onInit,
    this.onRead,
    this.onDispose,
    required this.child,
  });

  final void Function()? onInit;
  final void Function()? onRead;
  final void Function()? onDispose;
  final Widget child;

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  Widget build(BuildContext context) {
    widget.onInit?.call();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onRead?.call();
    });

    return widget.child;
  }

  @override
  void dispose() {
    super.dispose();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onDispose?.call();
    });
    // routeObserver.unsubscribe(this);
  }
}
