import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_finance_flutter_3/ui/widget/wrapper/stack_router_observer.dart';

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

class _LifecycleWidgetState extends State<LifecycleWidget> with StackAware {
  var initialized = false;
  StackRouterObserver? routeObserver;

  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      initialized = true;
      widget.onInit?.call(context);
      SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
        widget.onRead?.call(context);
      });
    }

    return widget.child;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver =
        RouterScope.of(context)?.firstObserverOfType<StackRouterObserver>();
    routeObserver?.subscribe(context, this);
  }

  @override
  void dispose() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onDispose?.call(context);
    });
    routeObserver?.unsubscribe(this);
    super.dispose();
  }

  @override
  void onTopStack() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onTopStack?.call(context);
    });
  }

  @override
  void onBackStack() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onBackStack?.call(context);
    });
  }
}
