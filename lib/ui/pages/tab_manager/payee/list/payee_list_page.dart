import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/core/domain/model/payee/payee_model.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/payee/list/payee_list_controller.dart';
import 'package:provider/provider.dart';

class PayeeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => PayeeListController(context.read()),
      builder: (context, _) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.router.push(PayeeFormRoute());
            },
            child: Icon(Icons.add),
          ),
          body: Consumer<List<PayeeModel>>(
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
        );
      },
    );
  }
}
