import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int count = 0;

  void increase() {
    count++;
    notifyListeners();
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      builder: (context, _) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(
              builder: (context) {
                var count = context.watch<Counter>().count;
                return Text('Counter: $count');
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().increase();
              },
              child: const Text('Increase'),
            ),
          ],
        ),
      ),
    );
  }
}
