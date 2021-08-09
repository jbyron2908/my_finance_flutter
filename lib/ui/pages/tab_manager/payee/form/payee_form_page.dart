import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:my_finance_flutter_3/ui/navigation/app_router.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/form/picker_field.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/form/text_field.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/side_sheet/side_sheet.dart';
import 'package:my_finance_flutter_3/ui/widget/bottom_action_bar/bottom_action_bar.dart';
import 'package:my_finance_flutter_3/ui/widget/helper/ui_helpers.dart';
import 'package:provider/provider.dart';

import 'payee_form_bloc.dart';

class PayeeFormPage extends StatelessWidget {
  PayeeFormPage({
    Key? key,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();

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
                onTap: () async {
                  var validated = formKey.currentState?.validate();
                  if (validated == true) {
                    formKey.currentState?.save();
                    await bloc.save();
                    await AppRouter.navigateBack(context);
                  }
                },
              ),
            ],
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  AppTextField(
                    label: 'Name',
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Required'),
                    ]),
                    onSaved: (value) {
                      bloc.name = value ?? '';
                    },
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
                      result = index;
                      AppRouter.navigateBack(context);
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
