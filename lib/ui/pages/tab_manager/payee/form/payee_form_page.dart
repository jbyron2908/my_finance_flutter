import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/core/domain/model/payee/payee_model.dart';
import 'package:my_finance_flutter_3/core/domain/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/form/picker_field.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/form/text_field.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/side_sheet/side_sheet.dart';
import 'package:my_finance_flutter_3/ui/widget/bottom_action_bar/bottom_action_bar.dart';
import 'package:my_finance_flutter_3/ui/widget/helper/ui_helpers.dart';
import 'package:provider/provider.dart';

class PayeeFormBloc {
  PayeeFormBloc(this.payeeRepository);

  final formKey = GlobalKey<FormState>();
  final PayeeRepository payeeRepository;

  String name = '';
  int picker = 0;

  Future submit(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();

      var model = PayeeModel(name: name);
      await payeeRepository.save(model);
    }
  }
}

class PayeeFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => PayeeFormBloc(
        context.read(),
      ),
      builder: (context, _) {
        var bloc = context.read<PayeeFormBloc>();

        return Scaffold(
          body: BottomActionBar(
            actionList: [
              BottomActionItem(
                icon: Icons.check,
                onTap: () {
                  bloc.submit(context);
                  context.router.pop();
                },
              ),
            ],
            child: Form(
              key: bloc.formKey,
              child: ListView(
                children: [
                  AppTextField(
                    label: 'Name',
                    validator: (value) {
                      if (value == 'Default') {
                        return 'Change it';
                      }
                    },
                    onSaved: (value) => bloc.name = value ?? '',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> buildFormFields(BuildContext context) {
    return <Widget>[
      AppTextField(
        label: 'Name',
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      PickerField<int?>(
        initialValue: null,
        buildTitle: (value) => 'Index: $value',
        label: 'My expirement',
        onTap: () async {
          return await showIndexSelector(context);
        },
        onSaved: (value) {
          context.read<PayeeFormBloc>().picker = value ?? 0;
        },
      ),
      UIHelper.verticalSpaceSmall,
      AppTextField(
        label: 'Name',
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      AppTextField(
        label: 'Name',
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      AppTextField(
        label: 'Name',
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      AppTextField(
        label: 'Name',
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      AppTextField(
        label: 'Name',
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      AppTextField(
        label: 'Name',
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      AppTextField(
        label: 'Name',
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      AppTextField(
        label: 'Name',
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      AppTextField(
        label: 'Name',
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      AppTextField(
        label: 'Name',
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      AppTextField(
        label: 'Name',
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
      ),
    ];
  }

  Future<int?> showIndexSelector(BuildContext context) async {
    int? result;
    var onResult = (int index) async {
      result = index;
    };

    await showSideSheet(
      context: context,
      builder: (context) {
        return Container(
          width: 300,
          color: Colors.amber,
          child: Scaffold(
            body: ListView(
              children: List.generate(
                25,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onResult(index);
                      context.router.pop();
                    },
                    child: Text('Button $index'),
                  ),
                ),
              ).toList(),
            ),
          ),
        );
      },
    );

    return Future.value(result);
  }
}
