import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';
import 'package:my_finance_flutter_3/ui/widget/floating_bottom_bar/floating_bottom_bar_bloc.dart';

class FloatingPanelPage extends StatelessWidget with RouteAware {
  const FloatingPanelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.read(floatingPanelBlocProvider);

    var widget = Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print('hello');
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.visibility,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

    return FocusDetector(
      onFocusGained: () {
        print('onFocusGained');
        bloc.addChild(widget);
      },
      onFocusLost: () {
        print('onFocusLost');
        bloc.removeChild(widget);
      },
      onVisibilityGained: () {
        print('onVisibilityGained');
        // bloc.addChild(widget);
      },
      onVisibilityLost: () {
        print('onVisibilityLost');
        // bloc.removeChild(widget);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Floating Panel'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  bloc.addChild(
                    Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            print('hello');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Text('Add item'),
              ),
              ElevatedButton(
                onPressed: () {
                  bloc.clearChildren();
                },
                child: Text('Clear children'),
              ),
              ElevatedButton(
                onPressed: () {
                  // context.router.push(CounterRoute());
                  context.router.root.push(RootCounterRoute());
                },
                child: Text('Go to counter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
