import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/widget/helper/ui_helpers.dart';
import 'package:provider/provider.dart';

class ChangeNotifierPage extends StatelessWidget {
  const ChangeNotifierPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CounterWidget(),
          CounterWidget(),
        ],
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterModel(),
        ),
        Provider(
          create: (context) => CounterPresenter(context.read()),
        ),
      ],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(
            builder: (context) {
              var counter = context.watch<CounterModel>();
              return Text('Count: ${counter.count}');
            },
          ),
          UIHelper.horizontalSpaceSmall,
          Builder(builder: (context) {
            var counter = context.read<CounterPresenter>();
            return ElevatedButton(
              onPressed: () => counter.increase(),
              child: const Icon(Icons.add),
            );
          }),
          UIHelper.horizontalSpaceSmall,
          Builder(
            builder: (context) {
              var counter = context.read<CounterPresenter>();
              return ElevatedButton(
                onPressed: () => counter.decrease(),
                child: const Icon(Icons.remove),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ListModel extends ChangeNotifier {}

class CounterModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;

  int get count => _count;

  void increase() {
    _count++;
    notifyListeners();
  }

  void decrease() {
    _count--;
    notifyListeners();
  }
}

class CounterPresenter {
  CounterPresenter(this.counter);

  final CounterModel counter;

  void increase() {
    counter.increase();
  }

  void decrease() {
    counter.decrease();
  }
}
