import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_finance_flutter_3/ui/navigation/app_router_observer.dart';
import 'package:provider/provider.dart';

class LifecycleWidget extends StatefulWidget {
  const LifecycleWidget({
    Key? key,
    this.onInit,
    this.onReady,
    this.onDispose,
    this.onTopStack,
    this.onBackStack,
    required this.child,
  }) : super(key: key);

  final void Function(BuildContext context)? onInit;
  final void Function(BuildContext context)? onReady;
  final void Function(BuildContext context)? onDispose;

  final void Function(BuildContext context)? onTopStack;
  final void Function(BuildContext context)? onBackStack;

  final Widget child;

  @override
  _LifecycleWidgetState createState() => _LifecycleWidgetState();
}

class _LifecycleWidgetState extends State<LifecycleWidget> with StackAware {
  var initialized = false;
  AppRouterObserverRegister? routerObserverRegister;

  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      initialized = true;
      widget.onInit?.call(context);
      SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
        widget.onReady?.call(context);
      });
    }

    return widget.child;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _registerRouteObserver();
  }

  void _registerRouteObserver() {
    routerObserverRegister = context.read<AppRouterObserverRegister>();

    var topRoute = context.router.topRoute;
    routerObserverRegister?.subscribe(this, topRoute);
  }

  @override
  void dispose() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onDispose?.call(context);
    });
    routerObserverRegister?.unsubscribe(this);
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
