import 'package:database_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/ui/pages/tab_manager/payee/list/payee_list_controller.dart';
import 'package:my_finance_flutter/ui/pages/tab_manager/payee/select/payee_select_page.dart';
import 'package:navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:theme/widget.dart';

class PayeeListPage extends StatelessWidget {
  const PayeeListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => PayeeListController(context.read()),
      child: LifecycleWidget(
        key: const Key("PayeeListPage"),
        onReady: (context) {
          var controller = context.read<PayeeListController>();
          controller.start();
        },
        onTopStack: (context) {
          Log.i("PayeeListPage onTopStack");
        },
        onBackStack: (context) {
          Log.i("PayeeListPage onBackStack");
        },
        child: Scaffold(
          body: BottomActionBar(
            actionList: [
              BottomActionItem(
                icon: Icons.self_improvement_outlined,
                onTap: () async {
                  var result = await showPayeeMultiSelector(context);
                  Log.i('Result - $result');
                },
              ),
              BottomActionItem(
                icon: Icons.add,
                onTap: () {
                  AppRouter.navigateToPayeeForm(context);
                },
              ),
            ],
            child: const PayeeList(),
          ),
        ),
      ),
      // builder: (context, _) {
      //   return LifecycleWidget(
      //     key: const Key("PayeeListPage"),
      //     onReady: (context) {
      //       var controller = context.read<PayeeListController>();
      //       controller.start();
      //     },
      //     onTopStack: (context) {
      //       Log.i("PayeeListPage onTopStack");
      //     },
      //     onBackStack: (context) {
      //       Log.i("PayeeListPage onBackStack");
      //     },
      //     child: Scaffold(
      //       body: BottomActionBar(
      //         actionList: [
      //           BottomActionItem(
      //             icon: Icons.self_improvement_outlined,
      //             onTap: () async {
      //               var result = await showPayeeMultiSelector(context);
      //               Log.i('Result - $result');
      //             },
      //           ),
      //           BottomActionItem(
      //             icon: Icons.add,
      //             onTap: () {
      //               AppRouter.navigateToPayeeForm(context);
      //             },
      //           ),
      //         ],
      //         child: const PayeeList(),
      //       ),
      //     ),
      //   );
      // },
    );
  }
}

class PayeeList extends StatelessWidget {
  const PayeeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var payeeList = context.read<PayeeListController>().payeeStream;
    return StreamBuilder<List<PayeeModel>>(
      stream: payeeList,
      builder: (context, snapshot) {
        var list = snapshot.data ?? [];
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            var payee = list[index];

            return ListTile(
              title: Text(payee.name),
            );
          },
        );
      },
    );
  }
}
