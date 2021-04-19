import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';
import 'package:my_finance_flutter_3/ui/widget/helper/ui_helpers.dart';

class ManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          title: Text('Profiles'),
          leading: Icon(Icons.account_circle),
          // onTap: () => controller.goToProfileList(),
        ),
        UIHelper.horizontalDivider,
        ListTile(
          title: Text('Accounts'),
          leading: Icon(Icons.account_balance),
          // onTap: () => controller.goToAccountList(),
        ),
        UIHelper.horizontalDivider,
        ListTile(
          title: Text('Categories'),
          leading: Icon(Icons.category),
          // onTap: () => controller.goToCategoryList(),
        ),
        UIHelper.horizontalDivider,
        ListTile(
          title: Text('Payees'),
          leading: Icon(
            Icons.people,
          ),
          onTap: () => context.router.push(PayeeListRoute()),
        ),
      ],
    );
  }
}
