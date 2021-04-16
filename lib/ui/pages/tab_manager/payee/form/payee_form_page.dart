import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/form/picker_field.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/form/text_field.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/lifecycle_widget.dart';
import 'package:my_finance_flutter_3/ui/widget/helper/ui_helpers.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_button.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_panel_bloc.dart';
import 'package:provider/provider.dart';

class PayeeFormBloc {
  String name = '';
  String picker = '';

  final formKey = GlobalKey<FormState>();

  void submit(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      print(name);
      print(picker);
    }
  }
}

class PayeeFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => PayeeFormBloc(),
      builder: (context, _) {
        var bloc = context.read<PayeeFormBloc>();

        return LifecycleWidget(
          onTopStack: (context) {
            var bloc = context.read<ToolbarPanelBloc>();
            bloc.updateBottomRightChildren([
              ToolbarButton(
                child: Icon(Icons.add),
              ),
            ]);
          },
          onBackStack: (context) {
            var bloc = context.read<ToolbarPanelBloc>();
            bloc.updateBottomRightChildren([]);
          },
          child: Form(
            key: bloc.formKey,
            child: ListView(
              children: [
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
                ...buildFormFields(context),
                ElevatedButton(
                  onPressed: () => bloc.submit(context),
                  child: Text('Sumbit'),
                ),
              ],
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
      PickerField<String>(
        initialValue: 'KKKKK',
        buildTitle: (value) => 'AAA: $value',
        label: 'My expirement',
        onTap: () async {
          return 'BBB';
        },
        validator: (value) {
          // return 'Change itaaaa';
        },
        onSaved: (value) {
          context.read<PayeeFormBloc>().picker = value ?? '';
        },
      ),
      UIHelper.verticalSpaceSmall,
      InputDecorator(
        decoration: InputDecoration(
          labelText: 'Name2',
          border: OutlineInputBorder(),
        ),
        child: Text(
          'Hello',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      InputDecorator(
        decoration: InputDecoration(
          labelText: 'Name2',
          border: OutlineInputBorder(),
        ),
        child: Text(
          'Hello',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      InputDecorator(
        decoration: InputDecoration(
          labelText: 'Name2',
          border: OutlineInputBorder(),
        ),
        child: Text(
          'Hello',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      InputDecorator(
        decoration: InputDecoration(
          labelText: 'Name2',
          border: OutlineInputBorder(),
        ),
        child: Text(
          'Hello',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      InputDecorator(
        decoration: InputDecoration(
          labelText: 'Name2',
          border: OutlineInputBorder(),
        ),
        child: Text(
          'Hello',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      InputDecorator(
        decoration: InputDecoration(
          labelText: 'Name2',
          border: OutlineInputBorder(),
        ),
        child: Text(
          'Hello',
          style: Theme.of(context).textTheme.subtitle1,
        ),
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
        onSaved: (value) {
          // context.read<PayeeFormBloc>().name = value ?? '';
        },
      ),
      UIHelper.verticalSpaceSmall,
      InputDecorator(
        decoration: InputDecoration(
          labelText: 'Name2',
          border: OutlineInputBorder(),
        ),
        child: Text(
          'Hello',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      InputDecorator(
        decoration: InputDecoration(
          labelText: 'Name2',
          border: OutlineInputBorder(),
        ),
        child: Text(
          'Hello',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      InputDecorator(
        decoration: InputDecoration(
          labelText: 'Name2',
          border: OutlineInputBorder(),
        ),
        child: Text(
          'Hello',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      InputDecorator(
        decoration: InputDecoration(
          labelText: 'Name2',
          border: OutlineInputBorder(),
        ),
        child: Text(
          'Hello',
          style: Theme.of(context).textTheme.subtitle1,
        ),
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
        onSaved: (value) {
          //  context.read<PayeeFormBloc>().name = value ?? '';
        },
      ),
    ];
  }
}
