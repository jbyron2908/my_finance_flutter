import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier/state_notifier.dart';

class CounterStateNotifier extends StateNotifier<int> {
  CounterStateNotifier([int state = 0]) : super(state);

  void increase() {
    state++;
  }
}

class CounterStateNotifierPage extends StatelessWidget {
  const CounterStateNotifierPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<CounterStateNotifier, int>(
      create: (context) => CounterStateNotifier(),
      builder: (context, _) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(
              builder: (context) {
                var count = context.watch<int>();
                return Text('Counter: $count');
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterStateNotifier>().increase();
              },
              child: const Text('Increase'),
            ),
          ],
        ),
      ),
    );
  }
}
