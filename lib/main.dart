import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_finance_flutter_3/ui/app/app.dart';

void main() {
  runApp(ProviderScope(
    observers: [
      // LoggerProviderObserver(),
    ],
    child: MyFinanceApp(),
  ));
}
