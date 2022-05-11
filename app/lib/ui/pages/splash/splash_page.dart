import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:theme/widget.dart';

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
