import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterChangeNotifier with ChangeNotifier {
  int count = 0;

  void increase() {
    count++;
    notifyListeners();
  }
}

class CounterChangeNotifierPage extends StatelessWidget {
  const CounterChangeNotifierPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterChangeNotifier(),
      builder: (context, _) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(
              builder: (context) {
                var count = context.watch<CounterChangeNotifier>().count;
                return Text('Counter: $count');
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterChangeNotifier>().increase();
              },
              child: const Text('Increase'),
            ),
          ],
        ),
      ),
    );
  }
}
