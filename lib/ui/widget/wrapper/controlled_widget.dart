import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_finance_flutter_3/ui/navigation/app_router_observer.dart';
import 'package:provider/provider.dart';

class ControlledWidget<T extends WidgetController> extends StatefulWidget {
  const ControlledWidget({
    Key? key,
    required this.widgetController,
    required this.builder,
  }) : super(key: key);

  final T widgetController;

  final Widget Function(BuildContext, T) builder;

  @override
  _ControlledWidgetState<T> createState() => _ControlledWidgetState<T>();
}

class _ControlledWidgetState<T extends WidgetController>
    extends State<ControlledWidget<T>> with StackAware {
  var initialized = false;
  AppRouterObserverRegister? routerObserverRegister;

  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      initialized = true;
      widget.widgetController.onInit();
      SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
        widget.widgetController.onReady();
      });
    }

    return widget.builder(
      context,
      widget.widgetController,
    );
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
      widget.widgetController.onDispose();
    });
    routerObserverRegister?.unsubscribe(this);
    super.dispose();
  }

  @override
  void onTopStack() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.widgetController.onTopStack();
    });
  }

  @override
  void onBackStack() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.widgetController.onBackStack();
    });
  }
}

abstract class WidgetController {
  void onInit() {}
  void onReady() {}
  void onDispose() {}

  void onTopStack() {}
  void onBackStack() {}
}
