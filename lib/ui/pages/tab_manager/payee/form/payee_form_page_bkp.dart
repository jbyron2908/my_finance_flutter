import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = StateProvider.autoDispose((_) => '');

final payeeFormProvider = Provider.autoDispose(
  (ref) {
    return PayeeFormBloc(ref.read);
  },
);

class PayeeFormBloc {
  PayeeFormBloc(this.reader);

  final Reader reader;
  final formKey = GlobalKey<FormState>();

  void submit(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      var name = reader(nameProvider).state;
      print(name);
    }
  }
}

class PayeeFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read(payeeFormProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Payee form'),
      ),
      body: GestureDetector(
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
              ...buildFormFields(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildFormFields() {
    return <Widget>[
      TextField(
        stateProvider: nameProvider,
        labelText: 'Name:',
      ),
    ];
  }
}

class TextField extends StatelessWidget {
  const TextField({
    Key? key,
    required this.stateProvider,
    this.labelText = '',
  }) : super(key: key);

  final AutoDisposeStateProvider<String> stateProvider;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        var field = watch(stateProvider);
        return TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(),
          ),
          initialValue: 'Default',
          validator: (value) {
            if (value == 'Default') {
              return 'Change it';
            }
          },
          onSaved: (value) => field.state = value ?? '',
        );
      },
    );
  }
}
