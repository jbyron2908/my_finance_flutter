import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:my_finance_flutter_3/ui/navigation/app_router.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/form/text_field.dart';
import 'package:my_finance_flutter_3/ui/widget/bottom_action_bar/bottom_action_bar.dart';
import 'package:provider/provider.dart';

import 'profile_form_bloc.dart';

class ProfileFormPage extends StatelessWidget {
  ProfileFormPage({
    Key? key,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ProfileFormBloc(
        context.read(),
      ),
      builder: (context, _) {
        var bloc = context.read<ProfileFormBloc>();

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
                  AppTextField(
                    label: 'Current',
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Required'),
                    ]),
                    onSaved: (value) {
                      bloc.currency = value ?? '';
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
}
