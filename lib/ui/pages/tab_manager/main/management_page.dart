import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/widget/helper/ui_helpers.dart';

class ManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Management'),
      ),
      body: ListView(
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
            // onTap: () => controller.goToPayeeList(),
          ),
          UIHelper.horizontalDivider,
          ListTile(
            title: Text('Playground1'),
            leading: Icon(Icons.info),
            // onTap: () => controller.goToPlayground(),
          ),
        ],
      ),
    );
  }
}
