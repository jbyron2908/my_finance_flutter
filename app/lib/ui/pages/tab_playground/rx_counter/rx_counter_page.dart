import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_notifier/rx_notifier.dart';

class RxCounter {
  static RxCounter get(BuildContext context) => context.read<RxCounter>();

  final count1 = RxNotifier(0);
  final count2 = RxNotifier(0);

  void increase1() {
    count1.value = count1.value + 1;
  }

  void increase2() {
    count2.value = count2.value + 1;
  }
}

class RxCounterPage extends StatelessWidget {
  const RxCounterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => RxCounter(),
      builder: (context, _) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RxBuilder(
              builder: (context) {
                var count1 = context.read<RxCounter>().count1.value;
                return Text('Counter 1: $count1');
              },
            ),
            ElevatedButton(
              onPressed: () {
                var counter = context.read<RxCounter>();
                counter.increase1();
              },
              child: const Text('Increase 1'),
            ),
            RxBuilder(
              builder: (context) {
                var count2 = context.read<RxCounter>().count2.value;
                return Text('Counter 2: $count2');
              },
            ),
            ElevatedButton(
              onPressed: () {
                var counter = context.read<RxCounter>();
                counter.increase2();
              },
              child: const Text('Increase 2'),
            ),
          ],
        ),
      ),
    );
  }
}
