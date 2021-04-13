import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_finance_flutter_3/ui/app/app.dart';

class LifecycleWidget extends StatefulWidget {
  const LifecycleWidget({
    this.onInit,
    this.onRead,
    this.onDispose,
    this.onTopStack,
    this.onBackStack,
    required this.child,
  });

  final void Function(BuildContext context)? onInit;
  final void Function(BuildContext context)? onRead;
  final void Function(BuildContext context)? onDispose;

  final void Function(BuildContext context)? onTopStack;
  final void Function(BuildContext context)? onBackStack;

  final Widget child;

  @override
  _LifecycleWidgetState createState() => _LifecycleWidgetState();
}

class _LifecycleWidgetState extends State<LifecycleWidget> with RouteAware {
  @override
  Widget build(BuildContext context) {
    widget.onInit?.call(context);
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onRead?.call(context);
    });

    return widget.child;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onDispose?.call(context);
    });
    super.dispose();
    routeObserver.unsubscribe(this);
  }

  @override
  void didPop() {
    super.didPop();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onBackStack?.call(context);
    });
  }

  @override
  void didPushNext() {
    super.didPushNext();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onBackStack?.call(context);
    });
  }

  @override
  void didPush() {
    super.didPush();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onTopStack?.call(context);
    });
  }

  @override
  void didPopNext() {
    super.didPopNext();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onTopStack?.call(context);
    });
  }
}
