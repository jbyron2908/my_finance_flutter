import 'package:auto_route/auto_route.dart';
import 'package:database_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:navigation/navigation.dart';
import 'package:theme/widget.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          title: const Text('Profiles'),
          leading: const Icon(Icons.account_circle),
          onTap: () {
            AppRouter.navigateToProfile(context.router);
          },
        ),
        UIHelper.horizontalDivider,
        const ListTile(
          title: Text('Accounts'),
          leading: Icon(Icons.account_balance),
          // onTap: () => controller.goToAccountList(),
        ),
        UIHelper.horizontalDivider,
        ListTile(
          title: const Text('Categories'),
          leading: const Icon(Icons.category),
          onTap: () {
            AppRouter.navigateToCategory(context.router);
          },
        ),
        UIHelper.horizontalDivider,
        ListTile(
          title: const Text('Payees'),
          leading: const Icon(Icons.people),
          onTap: () {
            AppRouter.navigateToPayee(context.router);
          },
        ),
      ],
    );
  }

  void onResult(PayeeModel payee) {
    Log.i("Category selected: ${payee.toJson()}");
  }
}
