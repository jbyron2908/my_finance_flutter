import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_finance_flutter_3/ui/app/app_controller.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';
import 'package:my_finance_flutter_3/ui/app/navigation_provider.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/callback_widget.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onRead: () async {
        var database = context.read(databaseProvider);
        await database.setup();
        await context.router.replace(MainRoute());
        var provider = context.read(navigationProvider);
        provider.registerRouter(context.router);
      },
      child: Scaffold(
        body: Center(
          child: Text('Loading'),
        ),
      ),
    );
  }
}
