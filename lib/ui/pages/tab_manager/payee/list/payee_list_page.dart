import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/core/domain/model/payee/payee_model.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/payee/list/payee_list_controller.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/payee/select/payee_select_page.dart';
import 'package:my_finance_flutter_3/ui/widget/bottom_action_bar/bottom_action_bar.dart';
import 'package:provider/provider.dart';

class PayeeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => PayeeListController(context.read()),
      builder: (context, _) {
        return Scaffold(
          body: BottomActionBar(
            actionList: [
              BottomActionItem(
                icon: Icons.self_improvement_outlined,
                onTap: () async {
                  var result = await showPayeeMultiSelector(context);
                  print('Result - $result');
                },
              ),
              BottomActionItem(
                icon: Icons.add,
                onTap: () {
                  context.router.push(PayeeFormRoute());
                },
              ),
            ],
            child: Consumer<List<PayeeModel>>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    var payee = value[index];

                    return ListTile(
                      title: Text(payee.name),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
