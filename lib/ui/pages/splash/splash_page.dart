import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/lifecycle_widget.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LifecycleWidget(
      onRead: (context) async {
        var database = context.read<DatabaseClient>();
        await database.setup();
        await context.router.replace(MainRouter());
      },
      child: Scaffold(
        body: Center(
          child: Text('Loading'),
        ),
      ),
    );
  }
}
