import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/ui/widget/basic/lifecycle_widget.dart';
import 'package:my_finance_flutter_3/ui/widget/helper/ui_helpers.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_button.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_panel_bloc.dart';
import 'package:my_finance_flutter_3/ui/widget/toolbar_panel/toolbar_scroll_observer.dart';
import 'package:provider/provider.dart';

class PayeeFormBloc with ChangeNotifier {
  String name = '';

  final formKey = GlobalKey<FormState>();

  void submit(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      print(name);
    }
  }
}

class PayeeFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PayeeFormBloc(),
      child: Builder(
        builder: (context) {
          var bloc = context.read<PayeeFormBloc>();

          return ToolbarScrollObserver(
            child: LifecycleWidget(
              onRead: (context) {
                // TODO: Modify toolbar
              },
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
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanDown: (_) {
                  // Hide keyboard when scroll
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Form(
                  key: bloc.formKey,
                  child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: <Widget>[
                      ...buildFormFields(context),
                      ElevatedButton(
                        onPressed: () => bloc.submit(context),
                        child: Text('Sumbit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> buildFormFields(BuildContext context) {
    return <Widget>[
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(),
        ),
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
        onSaved: (value) {
          context.read<PayeeFormBloc>().name = value ?? '';
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
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(),
        ),
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
        onSaved: (value) {
          context.read<PayeeFormBloc>().name = value ?? '';
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
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(),
        ),
        initialValue: 'Default',
        validator: (value) {
          if (value == 'Default') {
            return 'Change it';
          }
        },
        scrollPadding: EdgeInsets.all(68),
        onSaved: (value) {
          context.read<PayeeFormBloc>().name = value ?? '';
        },
      ),
    ];
  }
}
