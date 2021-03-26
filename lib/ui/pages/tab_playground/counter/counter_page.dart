import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final counterProvider = StateProvider.autoDispose((ref) => 0);

class CounterPage extends StatelessWidget {
  const CounterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, watch, child) {
                var count = watch(counterProvider).state;
                return Text('Counter: $count');
              },
            ),
            ElevatedButton(
                onPressed: () {
                  context.read(counterProvider).state++;
                },
                child: Text('Increase')),
          ],
        ),
      ),
    );
  }
}
