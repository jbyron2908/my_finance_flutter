import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/widget/wrapper/lifecycle_widget.dart';
import 'package:navigation/navigation.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LifecycleWidget(
      onReady: (context) async {
        await AppRouter.replaceToMain(context);
      },
      child: const Scaffold(
        body: Center(
          child: Text('Loading'),
        ),
      ),
    );
  }
}
